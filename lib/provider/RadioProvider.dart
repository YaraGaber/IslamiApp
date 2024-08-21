import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import '../home_screen/radio/RadioService.dart';
import '../home_screen/radio/radio_model.dart';


class RadioProvider with ChangeNotifier {
  final RadioService _radioService = RadioService();
  final AudioPlayer _audioPlayer = AudioPlayer();
  List<RadioStation> _radioStations = [];
  bool _isLoading = false;
  String? _error;
  String? _currentStreamUrl;

  List<RadioStation> get radioStations => _radioStations;
  bool get isLoading => _isLoading;
  String? get error => _error;
  String? get currentStreamUrl => _currentStreamUrl;

  Future<void> loadRadioStations() async {
    _isLoading = true;
    notifyListeners();

    try {
      _radioStations = await _radioService.fetchRadioStations();
      _error = null;
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> playRadio(String streamUrl) async {
    try {
      if (_currentStreamUrl != null && _currentStreamUrl == streamUrl) {
        await stopRadio(); // If the same stream is clicked again, stop it
      } else {
        if (_currentStreamUrl != null) {
          await _audioPlayer.stop();
        }
        await _audioPlayer.play(UrlSource(streamUrl));
        _currentStreamUrl = streamUrl;
      }
      notifyListeners();
    } catch (e) {
      _error = "Failed to play radio: ${e.toString()}";
      notifyListeners();
    }
  }

  Future<void> stopRadio() async {
    try {
      await _audioPlayer.stop();
      _currentStreamUrl = null;
      notifyListeners();
    } catch (e) {
      _error = "Failed to stop radio: ${e.toString()}";
      notifyListeners();
    }
  }
}

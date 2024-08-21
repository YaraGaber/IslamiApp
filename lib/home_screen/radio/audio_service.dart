import 'package:audioplayers/audioplayers.dart';

class AudioService {
  AudioPlayer _audioPlayer = AudioPlayer();
  String? _currentUrl;

  Future<void> playStream(String url) async {
    if (_currentUrl != url) {
      _currentUrl = url;
      await _audioPlayer.play(UrlSource(url));
    } else {
      await _audioPlayer.resume();
    }
  }

  Future<void> pausePlayback() async {
    await _audioPlayer.pause();
  }

  Future<void> stopPlayback() async {
    await _audioPlayer.stop();
  }
}

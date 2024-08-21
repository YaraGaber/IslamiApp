import 'package:flutter/material.dart';
import 'package:islamii/Theme/my_theme.dart';
import 'package:islamii/home_screen/radio/radio_model.dart';
import 'package:islamii/provider/app_provider.dart';
import 'package:provider/provider.dart';

import 'RadioService.dart';
import 'audio_service.dart';

class RadioScreen extends StatefulWidget {
  @override
  _RadioScreenState createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
  final RadioService _radioService = RadioService();
  final AudioService _audioService = AudioService();
  late Future<List<RadioStation>> _futureRadioStations;
  late AppProvider provider;

  String? _currentPlayingUrl;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _futureRadioStations = _radioService.fetchRadioStations();
  }

  void _togglePlayPause(String url) async {
    if (_currentPlayingUrl == url) {
      if (_isPlaying) {
        await _audioService.pausePlayback();
        setState(() {
          _isPlaying = false;
        });
      } else {
        await _audioService.playStream(url);
        setState(() {
          _isPlaying = true;
        });
      }
    } else {
      await _audioService.playStream(url);
      setState(() {
        _currentPlayingUrl = url;
        _isPlaying = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppProvider>(context);
    return Scaffold(
      body: FutureBuilder<List<RadioStation>>(
        future: _futureRadioStations,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No radio stations found.'));
          } else {
            final radioStations = snapshot.data!;
            return ListView.builder(
              itemCount: radioStations.length,
              itemBuilder: (context, index) {
                final station = radioStations[index];
                return ListTile(
                  subtitle: Text(station.name,
                      style: TextStyle(
                          color: provider.isDark()
                              ? MyTheme.yallow
                              : MyTheme.black,
                          fontSize: 20)),
                  trailing: Icon(
                    color: provider.isDark() ? MyTheme.yallow : MyTheme.black,
                    _currentPlayingUrl == station.url
                        ? (_isPlaying ? Icons.pause : Icons.play_arrow)
                        : Icons.play_arrow,
                  ),
                  onTap: () => _togglePlayPause(station.url ?? ''),
                );
              },
            );
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _audioService.stopPlayback();
    super.dispose();
  }
}

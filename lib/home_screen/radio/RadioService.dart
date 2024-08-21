import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:islamii/home_screen/radio/radio_model.dart';

class RadioService {
  final String baseUrl = 'https://mp3quran.net/api/v3/radios';

  Future<List<RadioStation>> fetchRadioStations() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<dynamic> radios = data['radios'];
      return radios.map((json) => RadioStation.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load radio stations');
    }
  }
}

import 'dart:convert';

class ZivParserService {
  Map<String, dynamic> parse(String rawConfig) {
    try {
      return jsonDecode(rawConfig);
    } catch (e) {
      return {
        'error': e.toString()
      };
    }
  }
}

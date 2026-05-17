class XrayParserService {

  Map<String, dynamic> parseUri(String uri) {
    return {
      'raw': uri,
      'protocol': uri.split('://').first,
    };
  }
}

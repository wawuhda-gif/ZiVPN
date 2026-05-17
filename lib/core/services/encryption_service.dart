import 'dart:convert';

class EncryptionService {

  String encrypt(String data) {
    return base64Encode(utf8.encode(data));
  }

  String decrypt(String data) {
    return utf8.decode(base64Decode(data));
  }
}

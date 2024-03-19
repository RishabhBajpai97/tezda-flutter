import 'dart:convert';
import "package:http/http.dart" as http;
import 'package:tezda/services/index.dart';

class AuthService {
  AuthService._();
  static AuthService instance() => AuthService._();
  login(Map<String, dynamic> data) async {
    try {
      final response = await http.post(
        Uri.parse("https://backend-tezda-production.up.railway.app/api/auth/login"),
        body: json.encode(data),
        headers: {
          "Content-Type": "application/json",
        },
      );
      final decodedBody = json.decode(response.body);
      return decodedBody;
    } catch (e) {
      throw (e);
    }
  }
  autoAuthenticate()async{
    
    try {
      final response = await http.get(
        Uri.parse("https://backend-tezda-production.up.railway.app/api/users/me"),
        headers: {
          "Content-Type": "application/json",
          "Authorization":"Bearer ${await preferencesService.getAuthToken()}"
        },
      );
      final decodedBody = json.decode(response.body);
      return decodedBody;
    } catch (e) {
      throw (e);
    }
  }
}

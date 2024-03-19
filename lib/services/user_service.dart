import "dart:convert";

import "package:http/http.dart" as http;
import "package:tezda/services/index.dart";

class UserService {
  UserService._();
  static UserService instance() => UserService._();
  signup(Map<String, dynamic> data) async {
    try {
      final response = await http.post(
        Uri.parse("http://127.0.0.1:3000/api/users/signup"),
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

  updateUser(Map<String, dynamic> data) async {
    try {
      final response = await http.put(
        Uri.parse(
            "https://backend-tezda-production.up.railway.app/api/users/updateUser"),
        body: json.encode(data),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${await preferencesService.getAuthToken()}"
        },
      );
      final decodedBody = json.decode(response.body);
      return decodedBody;
    } catch (e) {
      throw (e);
    }
  }
}

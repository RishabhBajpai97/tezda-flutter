import 'package:tezda/services/auth_service.dart';
import 'package:tezda/services/preference_service.dart';
import 'package:tezda/services/product_service.dart';
import 'package:tezda/services/user_service.dart';

AuthService authService = AuthService.instance();
ProductService productService = ProductService.instance();
UserService userService = UserService.instance();
PreferencesService preferencesService = PreferencesService();

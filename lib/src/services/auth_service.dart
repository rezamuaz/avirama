import 'package:get_storage/get_storage.dart';

import '../config/constants/keys.dart';
import '../network/model/user/user.dart';

class Auth {
  factory Auth() => instance;
  Auth._internal();

  static final Auth instance = Auth._internal();

  late GetStorage _box;

  Future initialize() async {
    _box = GetStorage();
  }

  // get user bearer token
  String? get token => _box.read(XKeys.bearerToken);

  // get user data
  User? get user => _box.read(XKeys.userData);

  // check is user logged in
  bool get isLoggedIn => token != null;

  // set user bearer token
  Future<void> setToken(String? value) async =>
      await _box.write(XKeys.bearerToken, value);
  // set user data
  Future<void> setUser(User? value) async =>
      await _box.write(XKeys.userData, value);

  Future<void> setTokenAndUserData(String? token, User? userData) async {
    _box.write(XKeys.userData, userData);
    _box.write(XKeys.bearerToken, token);
  }

  // clear all data
  void clear() {
    _box.remove(XKeys.bearerToken);
    _box.remove(XKeys.userData);
  }
}

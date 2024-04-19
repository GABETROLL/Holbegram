import 'package:flutter/foundation.dart';
import 'package:holbegram/methods/auth_methods.dart';
import 'package:holbegram/models/user.dart';

class UserProvider with ChangeNotifier {
  Users? _user;
  AuthMethods _authMethods = AuthMethods();

  Future<Users?> get user async {
    return _user;
  }

  Future<void> refreshUser() async {
    
  }
}

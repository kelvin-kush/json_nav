import 'package:flutter/foundation.dart';

class UserData with ChangeNotifier {
  String username = '';
  String email = '';

  notifyListeners();
}

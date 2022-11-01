import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class NewsData with ChangeNotifier {
  Map<String, dynamic> map = {};
  bool error = false;
  String errorMessage = '';

  Future<void> get fetchData async {
    final response = await get(
      Uri.parse('https://dl.dropbox.com/s/b7knoth5w34qvag/stories.json?dl=0'),
    );

    if (response.statusCode == 200) {
      try {
        map = jsonDecode(response.body);
        error = false;
        
      } catch (e) {
        error = true;
        errorMessage = e.toString();
        map = {};
      }

    }
    else{
      error = true;
      errorMessage = 'Check your internet connection';
      map = {};
    }
    notifyListeners();
  }

  void initialValues(){
      map = {};
  error = false;
   errorMessage = '';
  }
}

import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shopping/models/http_exception.dart';


class Auth with ChangeNotifier{
  String _token;
  DateTime _expiryDate;
  String _userId;
  Timer _authTimer;

  String get userId {
    return _userId;

  }

  bool get isAuth {
    return token  != null;
  }

  String get token {
    if(_expiryDate != null && _expiryDate.isAfter(DateTime.now()) && _token != null) {
      return _token;
    }
    else{
      return null;
    }


  }

  Future<void> _authenticate(String email, String password , String urlKeyword) async {
    final url = "https://identitytoolkit.googleapis.com/v1/accounts:$urlKeyword?key=AIzaSyDNl6SiufUjMzKo4OdnP6BxEIXJuWZe4lU";
    try {
      final response = await http.post(url , body: json.encode({
        'email': email,
        'password': password,
        'returnSecureToken': true,
      },),);
      final responseData = json.decode(response.body);
      if(responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
      _token = responseData['idToken'];
      _userId = responseData['localId'];
      _expiryDate = DateTime.now().add(Duration(seconds: int.parse(responseData['expiresIn'],),),);
      notifyListeners();
    }
    catch(error){
      throw error;
    }
  }

  Future<void> signup(String email , String password) async {
    return _authenticate(email, password, 'signUp');
  }

  Future<void> signin(String email , String password ) async {
    return _authenticate(email, password , 'signInWithPassword');
  }

  Future<void> logout() async {
    _token = null;
    _userId = null;
    _expiryDate = null;
    if(_authTimer != null) {
      _authTimer.cancel();
      _authTimer = null;
    }
    print("Logout successful");
    notifyListeners();
  }




}
import 'package:flutter/material.dart';
import 'package:nhatlieu/main.dart';

class ServerException implements Exception {}
class CacheException implements Exception{}
class NetworkException implements Exception{}
class NoInternetException implements Exception{
  late String _message;
  NoInternetException([String message='No internet connection']){
    if(globalMessagerKey.currentState !=null)
    {
      globalMessagerKey.currentState!.showSnackBar(SnackBar(content: Text(message)));
    } 
    _message = message;
  }
  @override
  String toString() {
        return _message;
  }
}
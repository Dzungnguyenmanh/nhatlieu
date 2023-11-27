import 'package:flutter/material.dart';

class Logger {
  static LogMode _logMode = LogMode.debug;
  static void init(LogMode mode)
  {
      Logger._logMode = mode;
  }
  static void log(dynamic data,{StackTrace? stackTrace}){
    switch(_logMode)
    {
      case LogMode.debug :
        debugPrint("error:$data$stackTrace");
      break;
      case LogMode.info:
        debugPrint("info:$data");
      break;
      case LogMode.warning:
        debugPrint("warring:$stackTrace");
      break; 
    }
  
    if (_logMode==LogMode.info)
    {
     
    }
  }
}

enum LogMode { debug, info, warning }

import 'package:flutter/material.dart';
import 'package:recipeapp/model/movie.dart';

class HelperFunction{

  static SnackBar showMySnackBar(String message) {
    return SnackBar(
      content: Text(message),
      backgroundColor: (Colors.black54),
      duration: const Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
    );
  }

  static String formatMonth(String month){
    String reversedDate = month.split("-").reversed.join("-").replaceAll("-", " ");
  return reversedDate.replaceAll(reversedDate[3]+reversedDate[4], HelperFunction.stringToMonth(reversedDate[3]+reversedDate[4]));
  }
  
  static String stringToMonth(String month){
    switch(month){
      case "01":
        return "January";
        break;
      case "02":
        return "February";
        break;
      case "03":
        return "March";
        break;
      case "04":
        return "April";
        break;
      case "05":
        return "May";
        break;
      case "06":
        return "June";
        break;
      case "07":
        return "July";
        break;
      case "08":
        return "August";
        break;
      case "09":
        return "September";
        break;
      case "10":
        return "October";
        break;
      case "11":
        return "November";
        break;
      case "12":
        return "December";
        break;
      default:
        return "null";
    }
  }
}
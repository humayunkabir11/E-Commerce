import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SystemUtil{

  //----------------------------------hide the system bottom navigation bar
  static void hideBottomNav() {
    try {

      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky,
          overlays: [SystemUiOverlay.top]); // to hide system bottom nav and show status bar
    } catch (e) {
    }
  }

  //----------------------------------------change the status bar color
  static void setStatusBarColor(Color color){
    try{
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
          statusBarColor: color)); //to change status bar color

    }catch (e){
    }
  }//end of setStatusBarColor()

  //dismiss the keyboard
  static void dismissKeyboard(){
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

Widget AdaptiveScreen(
    {Widget body, Color backgroundColor, PreferredSizeWidget navBar}) {
      // if(navBar == null){
      //   navBar = Platform.isIOS? CupertinoNavigationBar(): AppBar();
      // }
     
  var widget =  Platform.isIOS
      ? CupertinoPageScaffold(
          child: body,
          navigationBar: navBar as ObstructingPreferredSizeWidget,
          backgroundColor: backgroundColor,
        )
      : Scaffold(
          body: body,
          backgroundColor: backgroundColor,
          appBar: navBar ,
        );
        return Material(child: SafeArea(child: widget),);
}

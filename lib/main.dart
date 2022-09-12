import 'package:flutter/material.dart';
import 'package:relogio/view/home_view.dart';
main(){
  runApp(AppWidget());
}

class AppWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: HomePage());
  }
}
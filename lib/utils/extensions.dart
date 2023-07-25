import 'package:flutter/material.dart';

extension NavigationExtension on BuildContext{
  Future navigationNextScreen(Widget nextScreen)=>
  Navigator.of(this).push(MaterialPageRoute(builder: (_) => nextScreen));
}
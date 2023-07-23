import 'package:flutter/material.dart';
import 'package:todoapp/constant/color.dart';
import 'package:todoapp/constant/dimen.dart';

class ClockWidget extends StatelessWidget {
  const ClockWidget({
    super.key,
    required String currentTime,
  }) : _currentTime = currentTime;

  final String _currentTime;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: kSP150x,
      height: kSP50x,
      child: Text(
        _currentTime
      ,style: TextStyle(
        color: kPrimaryTextColor,
        fontSize: kFS50x,
        fontWeight: FontWeight.bold
      ),),
    );
  }
}

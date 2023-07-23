import 'package:flutter/material.dart';
import 'package:todoapp/constant/String.dart';
import 'package:todoapp/constant/color.dart';
import 'package:todoapp/constant/dimen.dart';
import 'dart:async';

import '../item_view/home_page_item_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _currentTime = "";

  @override
  void initState() {
    super.initState();
    _updateTime();
  }

  void _updateTime() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _currentTime = _getCurrentTime();
      });
    });
  }

  String _getCurrentTime() {
    DateTime now = DateTime.now();
    String formatTime =
        '${_formatTimeConponent(now.hour)}:${_formatTimeConponent(now.minute)}';
    return formatTime;
  }

  String _formatTimeConponent(int timeConponent) {
    return timeConponent.toString().padLeft(2, '0');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: kSP50x),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ClockWidget(currentTime: _currentTime),
                Padding(
                  padding: const EdgeInsets.only(top: kSP3x),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: kSP100x,
                      height: kSP50x,
                      decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(15)),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(
                            Icons.add,
                            color: kSecondaryTextColor,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: kSP10x),
                            child: Text(
                              kAddTask,
                              style: TextStyle(color: kSecondaryTextColor),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

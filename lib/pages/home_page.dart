import 'package:flutter/material.dart';
import 'package:todoapp/boxes.dart';
import 'package:todoapp/constant/String.dart';
import 'package:todoapp/constant/color.dart';
import 'package:todoapp/constant/dimen.dart';
import 'package:todoapp/pages/add_task.dart';
import 'package:todoapp/persistent/tasks/tasks.dart';
import 'package:todoapp/utils/extensions.dart';
import 'dart:async';

import '../item_view/home_page_item_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _currentTime = "";
  String _currentDate = '';

  

  @override
  void initState() {
    super.initState();
    _updateTime();
    
  }

  void _updateTime() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _currentTime = _getCurrentTime();
        _currentDate = _getCurrentDate();
      });
    });
  }

  String _getCurrentTime() {
    DateTime now = DateTime.now();
    String formatTime =
        '${_formatTimeConponent(now.hour)}:${_formatTimeConponent(now.minute)}';
    return formatTime;
  }

  String _getCurrentDate() {
    DateTime now = DateTime.now();
    String formatDate =
        '${_formatTimeConponent(now.day)}/${_formatTimeConponent(now.month)}/${_formatTimeConponent(now.year)}';
    return formatDate;
  }

  String _formatTimeConponent(int timeConponent) {
    return timeConponent.toString().padLeft(2, '0');
  }
  void showAlert(){
    showDialog(context: context, builder:(BuildContext context) {
      return
       AlertDialog(
        title: Text("alert"),
        content: Text("time up"),
        actions: [
          TextButton(onPressed: (){
            
          }, child: Text("ok"))
        ],
       )
      ;
    });
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
                Column(
                  children: [
                    ClockWidget(currentTime: _currentTime),
                    DateWidget(currentDate: _currentDate),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: kSP3x),
                  child: GestureDetector(
                    onTap: () {
                      context.navigationNextScreen(const AddTaskPgae());
                    },
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
                            padding: EdgeInsets.only(right: kSP10x),
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
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Container(
                width: 350,
                height: 530,
                color: Colors.white,
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                  itemCount: boxTasks.length,
                  itemBuilder: (context, index) {
                    Tasks tasks = boxTasks.getAt(index);
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        width: 200,
                        height: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: (_currentTime!=tasks.time)?kPrimaryColor:Colors.white
                            ),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 8, left: 10),
                                  child: SizedBox(
                                    width: 150,
                                    height: 29,
                                    child: Text(
                                      tasks.title,
                                      style: const TextStyle(
                                        color: kSecondaryTextColor,
                                        fontSize: 22,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: SizedBox(
                                    width: 150,
                                    height: 20,
                                    child: Text(
                                      tasks.description,
                                      style: TextStyle(
                                          color: kSecondaryTextColor,
                                          fontSize: 14),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 4),
                                  child: Text(
                                    tasks.date,
                                    style: TextStyle(
                                        color: kSecondaryTextColor,
                                        fontSize: 20),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 2),
                                  child: Text(
                                    tasks.time,
                                    style: TextStyle(
                                        color: kSecondaryTextColor,
                                        fontSize: 20),
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 25),
                              child: IconButton(
                                  onPressed: () {
                                    boxTasks.deleteAt(index);
                                  },
                                  icon: const Icon(
                                    Icons.done,
                                    color: kSecondaryTextColor,
                                    size: 30,
                                  )),
                            )
                          ],
                        ),
                      ),
                    );
                    
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: GestureDetector(
              onTap: () {
                boxTasks.clear();
              },
              child: Container(
                width: 350,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.purple),
                child: const Center(
                    child: Text(
                  "Delete All",
                  style: TextStyle(color: kSecondaryTextColor),
                )),
              ),
            ),
          )
        ],
      ),
    
    );
  }
}

class DateWidget extends StatelessWidget {
  const DateWidget({
    super.key,
    required String currentDate,
  }) : _currentDate = currentDate;

  final String _currentDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 65, top: 5),
      child: Text(
        _currentDate,
        style: const TextStyle(color: Colors.purple),
      ),
    );
  }
}

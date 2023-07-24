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
  String _currentDate ='';

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

  String _getCurrentDate(){
    DateTime now  = DateTime.now();
    String formatDate = '${_formatTimeConponent(now.day)}/${_formatTimeConponent(now.month)}/${_formatTimeConponent(now.year)}';
    return formatDate;
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
                Column(
                  children: [
                    ClockWidget(currentTime: _currentTime),
                    DateWidget(currentDate: _currentDate),
                  ],
                ),
                
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
                height: 530 ,
                color: Colors.white,
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: 300,
                      height: 80,
                      child: Card(
                        shape: RoundedRectangleBorder(borderRadius:Bord),
                        color: Colors.purple,
                        child: ListTile(
                          // shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        leading: Padding(
                          padding: const EdgeInsets.only(top: 18),
                          child: Checkbox(value: false, onChanged: ((value) {
                            if(value!){
                              
                            }
                          })),
                        ),
                        title: Text("first task",style:TextStyle(
                          color: kSecondaryTextColor,
                          fontSize: 20,
                        ),),
                        trailing: Icon(Icons.remove),
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
            child: Container(
              width: 350,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.purple
              ),
              child:const  Center(child: Text("Delete All",style: TextStyle(
                color: kSecondaryTextColor
              ),)),
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
      padding: const EdgeInsets.only(right: 65 ,top: 5),
      child: Text(_currentDate,style: const TextStyle(color: Colors.purple),),
    );
  }
}

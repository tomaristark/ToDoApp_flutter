import 'package:flutter/material.dart';
import 'package:todoapp/boxes.dart';
import 'package:todoapp/constant/color.dart';
import 'package:todoapp/persistent/tasks/tasks.dart';


class AddTaskPgae extends StatefulWidget {
  const AddTaskPgae({super.key});

  @override
  State<AddTaskPgae> createState() => _AddTaskPgaeState();
}

class _AddTaskPgaeState extends State<AddTaskPgae> {
  DateTime nowDate = DateTime.now();
  TimeOfDay nowTime = TimeOfDay.now();
  String _formatDate="";
  String _formatTime="";
  final titleController =TextEditingController();
  final descriptionController =TextEditingController();

  String taskTitle = "";
  String taskDescription="";

  void _datePicker(){
    showDatePicker(context: context,
     initialDate: DateTime.now(),
      firstDate: DateTime(2000), 
      lastDate: DateTime(3000)
      ).then((value) {
        setState(() {
          nowDate =value!;
          _formatDate = "${nowDate.day}/${nowDate.month}/${nowDate.year}";
        });
      });
  }

  void _timePicker(){
    showTimePicker(
      context: context, 
      initialTime: const TimeOfDay(hour: 0, minute: 0))
      .then((value) {
        setState(() {
          nowTime=value!;
          if(nowTime.hour > 12){
           _formatTime="${_formatTimeConponent(nowTime.hour)}:${_formatTimeConponent(nowTime.minute)} PM";
          }else{
           _formatTime="${_formatTimeConponent(nowTime.hour)}:${_formatTimeConponent(nowTime.minute)} AM";
          }
          
        });
      });
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
            padding: const EdgeInsets.only(top: 40,right: 300),
            child: IconButton(onPressed: (){
              Navigator.of(context).pop();
            }, icon: const Icon(Icons.arrow_back_ios,color: Colors.white,size: 25,)),
          ),
       const TextInAddtask(addText: "Title",rightPD: 300,topPD: 30,),
         Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: 400,
        height: 50,
        decoration: 
        BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: TextField(
            style: TextStyle(
              color: kPrimaryTextColor
            ),
            controller: titleController,
            maxLines: 1,
            autofocus: false,
            decoration: const InputDecoration(
              border: InputBorder.none
            ),
          ),
        ),
      ),
    ),
      const TextInAddtask(addText: "Add Description",rightPD: 200,topPD: 10,),
         Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: 400,
        height: 150,
        decoration: 
        BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: TextField(
            style: TextStyle(
              color: kPrimaryTextColor
            ),
            controller: descriptionController,
            maxLines: 3,
            autofocus: false,
            decoration: const InputDecoration(
              border: InputBorder.none
            ),
          ),
        ),
      ),
    ),
        const TextInAddtask(addText: "Pick a Date", rightPD: 230, topPD:10),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        child: Row(
          children: [
            Container(
              width: 200,
              height: 50,
              decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white
              ),
              child:  Center(child: Text(_formatDate,style: TextStyle(
                color: kPrimaryTextColor,
                fontSize: 25,
              ),)
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:50),
              child: GestureDetector(
                onTap: _datePicker,
                child: Container(
                  width: 100,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: kPrimaryColor
                  ),
                  child: const Center(child: Text("Choose Date")),
                ),
              ),
            )
          ],
        ),
      ),
     TextInAddtask(addText: "Pick Time", rightPD: 250, topPD: 10),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        child: Row(
          children: [
            Container(
              width: 200,
              height: 50,
              decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white
              ),
              child: Center(child: Text(_formatTime,style:const  TextStyle(
                color: kPrimaryTextColor,
                fontSize: 25,
              ),)
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:50),
              child: GestureDetector(
                onTap: _timePicker,
                child: Container(
                  width: 100,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: kPrimaryColor
                  ),
                  child: const Center(child: Text("Choose Date")),
                ),
              ),
            )
          ],
        ),
      ),
      
      GestureDetector(
        onTap: (){
          setState(() {
            boxTasks.put("key_${titleController.text}", Tasks(
              title: titleController.text, 
              description: descriptionController.text, 
              date: _formatDate, 
              time: _formatTime));
          });
        },
        child:  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
          child: Container(
            width: 400,
            height: 50,
            decoration: BoxDecoration(
              color:  kPrimaryColor,
              borderRadius: BorderRadius.circular(15)
            ),
            child: const Center(child: Text("Done")),
          ),
        ),
      )
      
      ]),
    );
  }
}



class TextInAddtask extends StatelessWidget {
  const TextInAddtask({
    super.key, required this.addText, required this.rightPD, required this.topPD,
    
  });

  final String addText;
  final double rightPD; 
  final double topPD;

  @override
  Widget build(BuildContext context) {
    return   Padding(
       padding:   EdgeInsets.only(top: topPD,right: rightPD,bottom: 10),
       child: Text(addText,style: const TextStyle( color: kPrimaryColor,fontSize: 20),),
     );
  }
}
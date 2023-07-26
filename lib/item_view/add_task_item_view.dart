import 'package:flutter/material.dart';
import 'package:todoapp/constant/dimen.dart';

import '../constant/color.dart';

class DescriptionInput extends StatelessWidget {
  const DescriptionInput({
    super.key,
    required this.descriptionController,
  });

  final TextEditingController descriptionController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: kSP400x,
        height: kSP150x,
        decoration: 
        BoxDecoration(
     color: kSecondaryColor,
     borderRadius: BorderRadius.circular(kSP15x),
        ),
        child: Padding(
     padding: const EdgeInsets.only(left: kSP10x),
     child: TextField(
       style: const TextStyle(
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
    );
  }
}

class TileInput extends StatelessWidget {
  const TileInput({
    super.key,
    required this.titleController,
  });

  final TextEditingController titleController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: kSP400x,
        height: kSP50x,
        decoration: 
        BoxDecoration(
     color: kSecondaryColor,
     borderRadius: BorderRadius.circular(kSP15x),
        ),
        child: Padding(
     padding: const EdgeInsets.only(left: kSP10x),
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
    );
  }
}

class BackIcon extends StatelessWidget {
  const BackIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kSP40x,right: kSP300x),
      child: IconButton(onPressed: (){
        Navigator.of(context).pop();
      }, icon: const Icon(Icons.arrow_back_ios,color: kSecondaryColor,size: 25,)),
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
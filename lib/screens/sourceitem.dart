import 'package:flutter/material.dart';
import 'package:newsapp/models/responseSource.dart';

class sourceitem extends StatelessWidget{
  Sources source;
  bool isSelected;

  sourceitem({super.key,required this.source,required this.isSelected});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print(source.name);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12,vertical: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.green),
        color: isSelected?Colors.green:Colors.white

      ),
      child: Text(source.name??"",style: TextStyle(
        color: isSelected?Colors.white:Colors.green
      ),),
    );
  }
}
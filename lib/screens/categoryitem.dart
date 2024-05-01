import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/models/categoryModel.dart';

class categoryitem extends StatelessWidget {
  categoryModel model;
  int index;

  categoryitem({super.key, required this.model, required this.index});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        color: model.color,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(28),
            topRight: Radius.circular(28),
            bottomRight: index.isEven ? Radius.circular(28) : Radius.zero,
            bottomLeft: index.isOdd ? Radius.circular(28) : Radius.zero),
      ),
      child: Column(
        children: [
          Expanded(child: Image.asset(model.image)),
          Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Text(
                model.name,
                style: TextStyle(color: Colors.white, fontSize: 22),
              ))
        ],
      ),
    );
  }
}

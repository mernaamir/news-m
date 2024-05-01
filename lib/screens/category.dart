import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/models/categoryModel.dart';
import 'package:newsapp/screens/categoryitem.dart';

class categorytab extends StatelessWidget{

  Function onClick;
  categorytab({super.key, required this.onClick});

  List<categoryModel> allcategories=categoryModel.getCatgerioes();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text("Pick your category of interest",style: TextStyle(fontSize: 30),),
          Expanded(
            child: GridView.builder(
              itemBuilder: (context,index){
                return InkWell(
                    onTap: (){
                      onClick(allcategories[index]);
                    },
                    child: categoryitem(model: allcategories[index], index: index));
              },
              itemCount: allcategories.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
            mainAxisSpacing: 12,
              crossAxisSpacing: 12

            ),


            ),
          ),


        ],
      ),
    );

  }
}
import 'package:flutter/material.dart';



class categoryModel {
  String id;
  String name;
  String image;
  Color color;


  categoryModel({required this.id,required this.name,required this.image,required this.color});

 static List<categoryModel> getCatgerioes(){
return [
  categoryModel(id: "sports", name: "Sports", image: "assets/images/sports.png", color: Color(0xffC91C22)),
  categoryModel(id: "entertainment", name: "Politics", image: "assets/images/politics.png", color: Color(0xff003E90)),
  categoryModel(id: "health", name: "health", image: "assets/images/health.png", color: Color(0xffED1E79)),
  categoryModel(id: "business", name: "business ", image: "assets/images/bussines.png", color: Color(0xffCF7E48)),
  categoryModel(id: "general", name: "Enviroment", image: "assets/images/environment.png", color: Color(0xff4882CF)),
  categoryModel(id: "science", name: "Science", image: "assets/images/science.png", color: Color(0xffF2D352)),
  categoryModel(id: "science", name: "Science", image: "assets/images/science.png", color: Color(0xffF2D352))




];

}}
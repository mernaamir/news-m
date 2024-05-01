import 'package:flutter/material.dart';

import '../screens/newsitem.dart';
import '../shared/network/remote/api_manger.dart';

class searchscreen extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
   return [IconButton(onPressed: (){
     // showResults(context);
   }, icon: Icon(Icons.search,color: Colors.white,))];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
return  IconButton(onPressed: (){
  Navigator.pop(context);
}, icon: Icon(Icons.close,color: Colors.white,));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
    }

  @override
  Widget buildSuggestions(BuildContext context) {
   return FutureBuilder(future: ApiManger.getSearchNews(query), builder: (context,snapshot){
     if(snapshot.connectionState==ConnectionState.waiting){
       return CircularProgressIndicator();
     }

     if(snapshot.hasError){
       return Text("Something went error");
     }

     var articlesList=snapshot.data?.articles??[];
     if(articlesList.isEmpty){
       return Text("no articles");
     }
     return Expanded(
       child: ListView.separated(
         separatorBuilder: (context,index)=>SizedBox(height: 12,),
         itemBuilder: (context,index){
           return newsitem(article:articlesList[index]);
         },itemCount: articlesList.length,),
     );
   });
  }
@override
ThemeData appBarTheme(BuildContext context) {
  return ThemeData(
    textTheme: TextTheme(
      // Use this to change the query's text style
      headline6: TextStyle(fontSize: 24.0, color: Colors.white),
    ),
    appBarTheme: const AppBarTheme(
      shape: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20))),
      backgroundColor: Colors.green,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: InputBorder.none,

      // Use this change the placeholder's text style
      hintStyle: TextStyle(fontSize: 24.0),
    ),
  );
}
}
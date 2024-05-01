import 'package:flutter/material.dart';

import '../models/responseSource.dart';
import '../shared/network/remote/api_manger.dart';
import 'newsitem.dart';
import 'sourceitem.dart';
import 'detailsScreen.dart';

class newstab extends StatefulWidget{
  List<Sources> sources;
  newstab({super.key,required this.sources});

  @override
  State<newstab> createState() => _newstabState();
}

class _newstabState extends State<newstab> {
  int selectedindex=0;

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Column(
      children: [
        DefaultTabController(length: widget.sources.length, child: TabBar(
          onTap: (value){
            selectedindex=value;
            setState(() {

            });
          },
          isScrollable: true,
        indicatorColor: Colors.transparent,
        tabs:

          widget.sources.map((e) => Tab(
          child: sourceitem(
         source: e,
        isSelected: widget.sources.elementAt(selectedindex)==e,
        ),
          )).toList(),

        )),
        FutureBuilder(future: ApiManger.getNewsData(widget.sources[selectedindex].id??""), builder: (context,snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
            }

          if(snapshot.hasError){
            return Center(child: Text("Something went errorrrrrrrrr"));
          }

          var articlesList=snapshot.data?.articles??[];
          if(articlesList.isEmpty){
            return Center(child: Text("no articles"));
          }
          return Expanded(
            child: ListView.separated(
              separatorBuilder: (context,index)=>SizedBox(height: 12,),
              itemBuilder: (context,index){
            return newsitem(article:articlesList[index]);
            },itemCount: articlesList.length,),
          );
        })

      ],
    );
  }
}

























// import 'package:flutter/material.dart';
// import 'package:newsapp/models/responseSource.dart';
// import 'package:newsapp/screens/cubit/cubit.dart';
// import 'package:newsapp/screens/newsitem.dart';
// import 'package:newsapp/screens/sourceitem.dart';
//
// class NewsTab extends StatelessWidget {
//   const NewsTab({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         // ----- sources
//         DefaultTabController(
//             length: HomeCubit.get(context).sourcesList.length,
//             child:
//             TabBar(
//                 dividerColor: Colors.transparent,
//                 isScrollable: true,
//                 onTap: (value) {
//                   HomeCubit.get(context).onSourceChange(value);
//                 },
//                 indicatorColor: Colors.transparent,
//                 tabs:
//
//                 HomeCubit.get(context).sourcesList
//                     .map((e) => Tab(
//                   child: sourceitem(
//                     source: e,
//                     isSelected: HomeCubit.get(context).sourcesList.elementAt(HomeCubit.get(context).selectedIndex) == e,
//                   ),
//                 )).toList())
//
//         ),
//
//           //------------------------
//           Expanded(child:
//         ListView.separated(
//           separatorBuilder: (context,index)=>SizedBox(
//             height: 25,
//           ),
//           itemBuilder:(context,index){
//           return Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: newsitem(article: HomeCubit.get(context).articles[index]),
//           );
//         },itemCount: HomeCubit.get(context).articles.length,
//
//         )),
//
//
//
//       ],
//     );
//   }
// }

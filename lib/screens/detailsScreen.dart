
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:newsapp/models/newsResponse.dart';
import 'package:url_launcher/url_launcher.dart';

class detailsScreen extends StatelessWidget{
  detailsScreen({super.key});
  static const String routeName="detailsScreen";
  @override
  Widget build(BuildContext context) {
    Articles article=ModalRoute.of(context)?.settings.arguments as Articles;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("news",style: TextStyle(fontSize: 30),),
        centerTitle: true,
        shape: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 7),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(borderRadius: BorderRadius.circular(18),

              child:CachedNetworkImage(
                imageUrl: article.urlToImage??"",
                height: 250,
                fit: BoxFit.fill,
                placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),



            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(article.source?.name??"",style: TextStyle(fontWeight: FontWeight.w700,color: Colors.black),),
                  Text(article.title??"",style: TextStyle(fontWeight: FontWeight.w300,color: Colors.black,fontSize: 25)),
                  Text(article.description??"",style: TextStyle(fontWeight: FontWeight.w300,color: Colors.black),textAlign: TextAlign.center,),
                  Text(article.publishedAt??"",style: TextStyle(fontWeight: FontWeight.w300,color: Colors.black)),
                  SizedBox(height: 200,),

                  Align(
                    alignment: Alignment.bottomRight,
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: TextButton.icon(onPressed: (){
                        launchMyurl(article.url??"");
                      }, icon: Icon(Icons.arrow_back_ios), label: Text("Show Full article",style: TextStyle(color: Colors.green,fontSize: 20),)
                                    ),
                    ),
                  ),
            ]))

        ]),
      ),
    );
  }

}

void launchMyurl(String url)async{
  Uri _url=Uri.parse(url);
  bool canLunch= await canLaunchUrl(_url);
  if(canLunch){
    launchUrl(_url);
  }else{
    print("cannot launch");
  }
}







// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:newsapp/models/newsResponse.dart';
//
// class detailsScreen extends StatelessWidget{
//   Articles article;
//   static const String routeName="detailsScreen";
//   detailsScreen ({super.key});
//
// @override
//   Widget build(BuildContext context) {
//
//   // TODO: implement build
//     return Scaffold(
//
//       body: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//       ClipRRect(borderRadius: BorderRadius.circular(18),
//
//       child:CachedNetworkImage(
//         imageUrl: article.urlToImage??"",
//         height: 250,
//         fit: BoxFit.fill,
//         placeholder: (context, url) => Center(child: CircularProgressIndicator()),
//         errorWidget: (context, url, error) => Icon(Icons.error),
//       ),
//
//
//
//     ),
//   Padding(
//   padding: const EdgeInsets.all(8.0),
//   child: Column(
//   crossAxisAlignment: CrossAxisAlignment.start,
//   children: [
//   Text(article.source?.name??"",style: TextStyle(fontWeight: FontWeight.w700,color: Colors.black),),
//   Text(article.title??"",style: TextStyle(fontWeight: FontWeight.w300,color: Colors.black)),
//   Text(article.description??"",style: TextStyle(fontWeight: FontWeight.w300,color: Colors.black),)
//   ],
//   ),
//     )
//   ])); }
//
// }
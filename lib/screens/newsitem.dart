import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/models/newsResponse.dart';
import 'package:newsapp/screens/detailsScreen.dart';


class newsitem extends StatelessWidget{
  Articles article;
  newsitem({required this.article,super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(

      decoration: BoxDecoration(
        color: Colors.grey.shade400,
        borderRadius: BorderRadius.circular(18),
      ),
      child: InkWell(
        onTap: (){
          Navigator.pushNamed(context, detailsScreen.routeName,arguments: article);
        },
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
                 Text(article.title??"",style: TextStyle(fontWeight: FontWeight.w300,color: Colors.black)),
                 Text(article.description??"",style: TextStyle(fontWeight: FontWeight.w300,color: Colors.black),)
               ],
             ),
           )
        
         ],
        
        ),
      ),
    );
  }
}
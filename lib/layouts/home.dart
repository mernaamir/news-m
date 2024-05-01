import 'package:flutter/material.dart';
import 'package:newsapp/models/categoryModel.dart';
import 'package:newsapp/screens/category.dart';
import 'package:newsapp/screens/datatab.dart';
import 'package:newsapp/screens/settings.dart';
import 'package:newsapp/shared/network/remote/api_manger.dart';
import 'package:newsapp/screens/newstab.dart';
import 'package:newsapp/shared/styles/my_theme.dart';
import 'package:newsapp/screens/drawer_widget.dart';

import '../search/searchScreen.dart';


class home extends StatefulWidget {
  static const String routeName = "home";

  home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
          image:
              DecorationImage(image: AssetImage("assets/images/pattern.png")),
          color: Colors.white),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        drawer: drawerWidget(onClick: onDrawerclicked,),
        appBar: AppBar(
          actions: [
            IconButton(onPressed: (){
              showSearch(context: context, delegate: searchscreen());
            }, icon: Icon(Icons.search))
          ],
          shape: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
          title: Text(
            "news",
            style: TextStyle(fontSize: 28),
          ),
          centerTitle: true,
        ),
          body:selectedCategory==null?categorytab(onClick: onCategoryClik):datatab(categoryId: selectedCategory!.id,),
      )

    );

  }

  categoryModel? selectedCategory;

  onCategoryClik(category) {
    selectedCategory = category;
    setState(() {});
  }
  onDrawerclicked(id) {
    if (id == drawerWidget.categoryId) {
      selectedCategory = null;
      Navigator.pop(context);
      setState(() {});
    } else if (id == drawerWidget.settingId) {
      Navigator.pushNamed(context, settings.routeName);
      setState(() {});
    }
  }

}


//         selectedCategory == null
//             ? category(onClick: onCategoryClik)
//             : DataTab(
//                 categoryId: selectedCategory!.id,
//               ),
//       ),
//     );
//   }
//


//   onDrawerclicked(id) {
//     if (id == drawerWidget.categoryId) {
//       selectedCategory = null;
//       Navigator.pop(context);
//       setState(() {});
//     } else if (id == drawerWidget.settingId) {
//       Navigator.pushNamed(context, settings.routeName);
//       setState(() {});
//     }
//   }
//
//
// }

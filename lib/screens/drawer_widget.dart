import 'package:flutter/material.dart';
import 'package:newsapp/screens/settings.dart';

class drawerWidget extends StatelessWidget {
  Function onClick;

  drawerWidget( {required this.onClick,super.key});

  static const categoryId = 1;
  static const settingId = 2;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width * .75,
      child: Column(
        children: [
          Container(
            color: Colors.green,
            child: Text(
              "News App!",
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
            height: 150,
            width: double.infinity,
            alignment: Alignment.center,
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              onClick(categoryId);
            },
            child: Row(
              children: [
                Icon(
                  Icons.list,
                  size: 30,
                ),
                SizedBox(
                  width: 18,
                ),
                Text(
                  "Categeories",
                  style: TextStyle(fontSize: 22),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              onClick(settingId);

            },
            child: Row(
              children: [
                Icon(
                  Icons.settings,
                  size: 30,
                ),
                SizedBox(
                  width: 18,
                ),
                Text(
                  "Settings",
                  style: TextStyle(fontSize: 22),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../shared/network/remote/api_manger.dart';
import 'newstab.dart';

class datatab extends StatelessWidget{

  String categoryId;
  datatab({super.key,required this.categoryId});

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return FutureBuilder(
        future: ApiManger.getSources(categoryId),builder: (context,snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(child: CircularProgressIndicator());
      }
      if (snapshot.hasError) {
        return Center(child: Text("Something went error"));
      }
      var sourcesList=snapshot.data?.sources ??[];
      if(sourcesList.isEmpty){
        return Center(child: Text("NoSources"));
      }

      return newstab(sources: sourcesList);
    }
    ) ;
  }
}




// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:newsapp/screens/cubit/cubit.dart';
// import 'package:newsapp/screens/cubit/states.dart';
// import 'package:newsapp/shared/network/remote/api_manger.dart';
// import 'newstab.dart';
//
// class DataTab extends StatelessWidget {
//   String categoryId;
//
//   DataTab({super.key, required this.categoryId});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//         create: (context) => HomeCubit()..getSources(categoryId),
//         child: BlocConsumer<HomeCubit, HomeStates>(listener: (context, state) {
//           // ********** loading
//           if (state is HomeGetSourcesLoadingState) {
//             showDialog(
//                 context: context,
//                 builder: (context) => AlertDialog(
//                       title: Center(child: CircularProgressIndicator()),
//                     ));
//             // // ********** error
//           }
//           else if (state is HomeGetSourcesErrorState) {
//             showDialog(
//                 context: context,
//                 builder: (context) => AlertDialog(
//                       title: Text("error"),
//                       content: Text(state.error),
//                     ));
//           } else if (state is HomeGetSourcesSuccessState || state is ChangeSourceIndex) {
//             HomeCubit.get(context).getNewsData();
//           }
//         }, builder: (context, state) {
//             return NewsTab();
//         }));
//   }
// }

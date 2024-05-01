// import 'dart:convert';
//
// import 'package:bloc/bloc.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:http/http.dart' as http;
// import 'package:newsapp/models/newsResponse.dart';
// import 'package:newsapp/screens/cubit/states.dart';
//
// // import 'package:newsapp/models/responseSource.dart';
//
// import '../../shared/components/constants.dart';
//
// class HomeCubit extends Cubit<HomeStates> {
//   static HomeCubit get(context) => BlocProvider.of(context);
//   List<Sources> sourcesList = [];
//   List<Articles> articles = [];
//   int selectedIndex = 0;
//   onSourceChange(int index) {
//     selectedIndex = index;
//     emit(ChangeSourceIndex());
//   }
//
//   HomeCubit() : super(HomeInitStates());
//   // ------ Get sources
//   Future<void> getSources(String category) async {
//     try {
//       emit(HomeGetSourcesLoadingState());
//       Uri url = Uri.https(Constants.BASE_URL, "/v2/top-headlines/sources",
//           {"apiKey": "17b67a6ef92843d0af4c8d9867b355a6", "category": category});
//       http.Response response = await http.get(url);
//       // print("response =============== ${response.body}");
//       Map<String, dynamic> json = jsonDecode(response.body);
//       SourceResponse sourceResponse = SourceResponse.fromJson(json);
//       print("json ================${json}");
//       if (sourceResponse.status != "ok") {
//         emit(HomeGetSourcesErrorState(sourceResponse.message ?? ""));
//         return;
//       }
//       sourcesList = sourceResponse.sources ?? [];
//       emit(HomeGetNewsSuccessState());
//     } catch (e) {
//       emit(HomeGetSourcesErrorState(e.toString()));
//     }
//   }
//
//   // ------ News response
//   Future<void> getNewsData() async {
//     try {
//       emit(HomeGetNewsLoadingState());
//       Uri url = Uri.https(Constants.BASE_URL, "/v2/everything",
//           {"sources": sourcesList[selectedIndex].id, "apiKey": "17b67a6ef92843d0af4c8d9867b355a6"});
//       http.Response response = await http.get(url);
//       Map<String, dynamic> json = jsonDecode(response.body);
//       NewsResponse newsResponse = NewsResponse.fromJson(json);
//       if (newsResponse.status != "ok") {
//         emit(HomeGetNewsErrorState(newsResponse.message ?? ""));
//         return;
//       }
//       articles = newsResponse.articles ?? [];
//       emit(HomeGetNewsSuccessState());
//     } catch (e) {
//       emit(HomeGetNewsErrorState(e.toString()));
//     }
//   }
// }

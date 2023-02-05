import 'package:airbnb_app_clone/MainList.dart';
import 'package:flutter/material.dart';


class Search extends StatelessWidget {
  final Future<MainList> futureMainList = fetchMainList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: FutureBuilder<MainList>(
          future: futureMainList,
          builder: (context, snapshot) {
            if(snapshot.hasData) {
              return Text(snapshot.data!.categoryList[0].name);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            // 기본적으로 로딩 Spinner를 보여줍니다.
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

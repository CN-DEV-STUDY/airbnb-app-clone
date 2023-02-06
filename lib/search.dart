import 'package:airbnb_app_clone/MainList.dart';
import 'package:flutter/material.dart';


class Search extends StatelessWidget {
  final Future<MainList> futureMainList = fetchMainList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 50,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(30)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex:1,
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white,
                  child: IconButton(
                    icon: Icon(
                        Icons.search,
                        color: Colors.black),
                    onPressed: () => {},
                  ),
                )),
              Flexible(
                  flex:1,
                  child: Text('어디로 여행가세요?', style: TextStyle(color: Colors.black))),
            ],
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: FutureBuilder<MainList>(
          future: futureMainList,
          builder: (context, snapshot) {
            if(!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            } else {
              return Container(
                child: ListView.builder(
                  itemCount: snapshot.data!.categoryList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:[
                          Image.network(snapshot.data!.categoryList[index].url, height: 30),
                          Text(snapshot.data!.categoryList[index].name, style: TextStyle(fontSize: 12)),
                        ],
                      )
                    );
                  },
                )
              );
            }



            // if(snapshot.hasData) {
            //   for (var element in snapshot.data!.categoryList) {
            //     Text(element.name);
            //   }
            // } else if (snapshot.hasError) {
            //   return Text("${snapshot.error}");
            // }
            // // 기본적으로 로딩 Spinner를 보여줍니다.
            // return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

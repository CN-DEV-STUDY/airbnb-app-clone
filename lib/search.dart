import 'package:airbnb_app_clone/MainList.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class Search extends StatelessWidget {
  final Future<MainList> futureMainList = fetchMainList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Container(
          height: 50,
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Color(0xffadadad), width: 0.3),
              boxShadow: [
                BoxShadow(
                  color: Color(0xffececec).withOpacity(1),
                  blurRadius: 5.0,
                  spreadRadius: 0.0,
                  offset: const Offset(1, 5),
                )
              ],
              borderRadius: BorderRadius.circular(30)),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.transparent,
                  child: IconButton(
                    icon: Icon(
                        Icons.search,
                        color: Colors.black),
                    onPressed: () => {},
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('어디로 여행가세요?', style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold)),
                    Text('어디든지 언제든 일주일 게스트 추가', style: TextStyle(color: Colors.black, fontSize: 12))
                  ],
                )
              ),
              Expanded(
                // flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(100.0)),
                    border: Border.all(
                      color: Color(0xff5e5e5e),
                      width:0.3
                    )
                  ),
                  child: Icon(
                      Icons.filter_list_alt,
                      color: Colors.black),
                )
              ),
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

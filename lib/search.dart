import 'package:airbnb_app_clone/MainList.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class Search extends StatelessWidget {
  final Future<MainList> futureMainList = fetchMainList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
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
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    //Navigator.of(context).pop();
                  },
                  child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(width: 0.3, color: Colors.black)),
                        child: Icon(
                          Icons.sort,
                          color: Colors.black,
                        ),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: FutureBuilder<MainList>(
              future: futureMainList,
              builder: (context, snapshot) {
                if(!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                } else if(snapshot.hasData) {
                  return Scrollbar(
                    controller: ScrollController(),
                    isAlwaysShown: true,
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
                    ),
                  );
                }
                // 기본적으로 로딩 Spinner를 보여줍니다.
                return CircularProgressIndicator();
              },
            ),
          ),
          Flexible(
            flex: 7,
            child: FutureBuilder<MainList>(
            future: futureMainList,
            builder: (context, snapshot) {
              if(!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              } else if(snapshot.hasData) {
                return Scrollbar(
                  isAlwaysShown: true,
                  child: ListView.builder(
                    itemCount: snapshot.data!.categoryList.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children:[
                              Container(width: 300, height: 300, color: Colors.black,)
                              // Image.network(snapshot.data!.accomodationList[index].url, height: 30),
                              // Text(snapshot.data!.categoryList[index].name, style: TextStyle(fontSize: 12)),
                            ],
                          )
                      );
                    },
                  ),
                );
              }
              // 기본적으로 로딩 Spinner를 보여줍니다.
              return CircularProgressIndicator();
            },
          ),
          ),
        ],
      ),
    );
  }
}

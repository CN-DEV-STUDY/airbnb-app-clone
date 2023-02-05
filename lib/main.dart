import 'dart:js';

import 'package:airbnb_app_clone/login.dart';
import 'package:airbnb_app_clone/message.dart';
import 'package:airbnb_app_clone/search.dart';
import 'package:airbnb_app_clone/travel.dart';
import 'package:airbnb_app_clone/wish_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: "/",
    routes: {
      "/" : (context) => MainPage(),
      "/message" : (context) => Message(),
      "/travel" : (context) => Travel(),
      "/wish" : (context) => WishList(),
      "login" : (context) => Login()
    },
  ));
}


class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TabPage(),
      ),
    );
  }
}

// Bottom Navigation Bar
// 동적으로 화면을 변화하므로 StatefulWdiget 사용
class TabPage extends StatefulWidget {
  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {

  int _selectedIndex = 0; // 처음에 나올 화면 지정

  // 이동할 페이지
  List _pages = [Search(),WishList(),Travel(),Message(), Login()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Center(
          child: _pages[_selectedIndex], // 페이지와 연결
        ),

        // BottomNavigationBar 위젯
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed, // bottomNavigationBar item이 4개 이상일 경우

          // 클릭 이벤트
          onTap: _onItemTapped,

          currentIndex: _selectedIndex, // 현재 선택된 index

          // BottomNavigationBarItem 위젯
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "검색"),
            BottomNavigationBarItem(icon: Icon(Icons.favorite_outline), label: "위시리스트"),
            BottomNavigationBarItem(icon: Icon(Icons.airplane_ticket), label: "여행"),
            BottomNavigationBarItem(icon: Icon(Icons.message_outlined), label: "메시지함"),
            BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: "로그인"),
          ],
          selectedItemColor: Colors.pink, // 선택된 요소 색
          unselectedItemColor: Colors.grey, // 선택되지 않은 요소 색
          selectedLabelStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.bold , color:Colors.pink ), // 선택된 라벨 스타일
          unselectedLabelStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.bold , color: Colors.grey), // 선택되지 않은 라벨 스타일
        )
    );
  }

  void _onItemTapped(int index) {
    // state 갱신
    setState(() {
      _selectedIndex = index; // index는 item 순서로 0, 1, 2로 구성
    });
  }
}
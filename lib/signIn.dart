import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  // TextEditing 컨트롤러를 생성하여 필드에 할당
  final textController = TextEditingController();

  String email = "";
  String pwd = "";

  // _SignInState가 생성될 때 호출
  @override
  void initState() {
    super.initState();
    // textController
    textController.addListener(_printLatestValue);
  }

  // _SignInState가 제거될 때 호출
  @override
  void dispose() {
    // 텍스트에디팅컨트롤러를 제거하고, 등록된 리스너도 제거된다.
    textController.dispose();
    super.dispose();
  }

  // textController의 텍스트를 콘솔에 출력하는 메소드
  void _printLatestValue() {
    print("Second text field: ${textController.text}");
  }

  void _loginRequest() async {
    final url = Uri.parse("http://localhost:8080/user/signIn");

    http.Response response = await http.post(
        url,
        headers:<String, String> {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(
            {
              "email": email,
              "pwd": pwd
            }
        )
    );

    if(response.statusCode == 200){
      print("성공");
    } else {
      print("실패");
    }
  }

  /**
   * 텍스트필드의 값의 변화를 핸들링 하는 방법
   * 1. 텍스트필드에 onChange 항목 구현
   * 2. TextEditingController 인스턴스에 핸들링하는 함수를 리스너로 추가
   */
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: PreferredSize( // appBar 높이 조정
        preferredSize: Size.fromHeight(30.0),
        child: AppBar( backgroundColor:Color(0xffafafa), elevation: 0.0,), // appBar 색상변경과 그림자 제거
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(25, 25, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex:1,
              child: Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
                  child:  Text('에어비앤비 로그인 / 회원가입' , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold))),
            ),
            Flexible(
                flex:1,
                child: Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                  child: Form(
                    child: ListView(
                      children: [
                        TextFormField(
                          onChanged: (text){
                            setState(() {
                              email = text;
                              print("email : $email");
                            });
                          },
                          decoration: InputDecoration(
                              labelText: 'ID',
                              labelStyle: TextStyle(color: Colors.grey),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)
                              )),
                          cursorColor: Colors.black,
                          autofocus: true,
                          style: TextStyle(color: Colors.black,),
                          textInputAction: TextInputAction.next,),
                        TextFormField(
                          onChanged: (text){
                            setState(() {
                              pwd = text;
                              print("pwd : $pwd");
                            });
                          },
                          decoration: InputDecoration(
                              labelText: 'PWD',
                              labelStyle: TextStyle(color: Colors.grey),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)
                              )),
                          cursorColor: Colors.black,
                          autofocus: true,
                          style: TextStyle(color: Colors.black,),
                          textInputAction: TextInputAction.next,),
                        Text('아이디와 비밀번호를 입력해주세요.' , style: TextStyle(fontSize: 10))
                      ],
                    ),
                  ),
                )
            ),
            Flexible(
              flex:1,
              child: Column(
                children: [Container(
                  // margin: EdgeInsets.fromLTRB(10, 0, 0, 20),
                  padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                  child: ElevatedButton(
                      onPressed: (){_loginRequest();},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink ,
                          foregroundColor: Colors.white ,
                          textStyle: TextStyle(fontSize: 20) ,
                          minimumSize: Size(450,50)),
                      child: Text('   계속 하기')),
                ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
                    child: Text('또는' , style: TextStyle(fontSize: 15)),
                  )]
              ),
            ),
          ],
        ),
      ),
    );
  }
}


import 'package:airbnb_app_clone/signIn.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize( // appBar 높이 조정
        preferredSize: Size.fromHeight(30.0),
        child: AppBar( backgroundColor:Color(0xffafafa), elevation: 0.0,), // appBar 색상변경과 그림자 제거
      ),
      body: Column(
        children: [
          Expanded(
              flex:0,
              child: Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.fromLTRB(25,0, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Text('프로필' , style: TextStyle(fontSize: 40 , fontWeight: FontWeight.bold),),
                      Text('로그인하고 다음 여행 계획을 세워보세요.', style: TextStyle(fontSize: 20 , color: Colors.grey),)
                  ],
                ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // margin: EdgeInsets.fromLTRB(30, 20, 0, 0),
                        // width: 400,
                        // height: 50,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 25, 0, 0),
                            width: 340,
                            height: 50,
                          child: ElevatedButton(onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn()));
                          }, child: Text('로그인') , style: ElevatedButton.styleFrom(backgroundColor: Colors.pink , foregroundColor: Colors.white , textStyle: TextStyle(fontSize: 20))),
                          ),
                          
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 25, 0, 0),
                            child: Row(
                              children: [
                                Text('에어비앤비 계정이 없나요?') , TextButton(onPressed: (){}, child: Text('회원 가입') , style: TextButton.styleFrom(foregroundColor: Colors.black),)
                              ],
                            ),
                          )
                        ]
                    ),
                    // ElevatedButton(onPressed: (){}, child: Text('로그인') , style: ButtonStyle(),)
                  ],
                ),
              )),
          Expanded(flex:3,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex:1,
                      child: TextButton(
                          onPressed: (){},
                          child: Row(
                            children: [
                              Expanded(flex: 1, child: Icon(Icons.settings_outlined , size: 20, color: Colors.black,),),
                              Expanded(flex: 5, child: Text('설정' , style: TextStyle(fontSize: 20 , color: Colors.black))),
                              Expanded(flex: 1, child: Icon(Icons.arrow_forward_ios_outlined , size: 20, color: Colors.black,),),
                            ],
                          )),),
                    Expanded(
                      flex: 1,
                      child: TextButton(
                          onPressed: (){},
                          child: Row(
                            children: [
                              Expanded(flex: 1, child: Icon(Icons.home , size: 20, color: Colors.black,),),
                              Expanded(flex: 5, child: Text('호스팅에 대해 자세히 알아보기' , style: TextStyle(fontSize: 20 , color: Colors.black))),
                              Expanded(flex: 1, child: Icon(Icons.arrow_forward_ios_outlined , size: 20, color: Colors.black,),),
                            ],
                          )),),
                    Expanded(
                      flex: 1,
                      child: TextButton(
                          onPressed: (){},
                          child: Row(
                            children: [
                              Expanded(flex: 1, child: Icon(Icons.help_outline , size: 20, color: Colors.black,),),
                              Expanded(flex: 5, child: Text('도움 요청' , style: TextStyle(fontSize: 20 , color: Colors.black))),
                              Expanded(flex: 1, child: Icon(Icons.arrow_forward_ios_outlined , size: 20, color: Colors.black,),),
                            ],
                          )),),
                    Expanded(
                      flex: 1,
                      child: TextButton(
                          onPressed: (){},
                          child: Row(
                            children: [
                              Expanded(flex: 1, child: Icon(Icons.menu_book_outlined , size: 20, color: Colors.black,),),
                              Expanded(flex: 5, child: Text('이용 약관' , style: TextStyle(fontSize: 20 , color: Colors.black))),
                              Expanded(flex: 1, child: Icon(Icons.arrow_forward_ios_outlined , size: 20, color: Colors.black,),),
                            ],
                          )),),
                    Expanded(
                      flex: 1,
                      child:  TextButton(
                          onPressed: (){},
                          child: Row(
                            children: [
                              Expanded(flex: 1, child: Icon(Icons.menu_book_outlined , size: 20, color: Colors.black,),),
                              Expanded(flex: 5, child: Text('개인정보 처리방침' , style: TextStyle(fontSize: 20 , color: Colors.black))),
                              Expanded(flex: 1, child: Icon(Icons.arrow_forward_ios_outlined , size: 20, color: Colors.black,),),
                            ],
                          )),
                    ),
                    Expanded(
                      flex: 1,
                      child: TextButton(
                          onPressed: (){},
                          child: Row(
                            children: [
                              Expanded(flex: 1, child: Icon(Icons.menu_book_outlined , size: 20, color: Colors.black,),),
                              Expanded(flex: 5, child: Text('회사 세부정보' , style: TextStyle(fontSize: 20 , color: Colors.black))),
                              Expanded(flex: 1, child: Icon(Icons.arrow_forward_ios_outlined , size: 20, color: Colors.black,),),
                            ],
                          )),),
                    Expanded(
                        flex: 1,
                        child: Text('          버전 223.05.1(26004030)', style: TextStyle(fontSize: 10),))
                  ],
                ),
              )),
        ],
      ),
    );
  }
}

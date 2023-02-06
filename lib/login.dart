import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex:1,
            child: Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.fromLTRB(25, 20, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('프로필' , style: TextStyle(fontSize: 40 , fontWeight: FontWeight.bold),),
                  Text('로그인하고 다음 여행 계획을 세워보세요.', style: TextStyle(fontSize: 20 , color: Colors.grey),)
                ],
              ),
            )),
        Flexible(flex:2,
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
    );
  }
}

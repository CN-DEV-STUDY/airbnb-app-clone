import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

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
              child: Form(
                child: ListView(
                  children: [
                    TextFormField(decoration: InputDecoration(labelText: 'ID'), textInputAction: TextInputAction.next,),
                    TextFormField(decoration: InputDecoration(labelText: 'PWD'), textInputAction: TextInputAction.next,),
                    Text('아이디와 비밀번호를 입력해주세요.' , style: TextStyle(fontSize: 10))
                  ],
                ),
              )
            ),
            Flexible(
              flex:1,
              child: Container(
                margin: EdgeInsets.fromLTRB(10, 0, 0, 20),
                padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                width: 340,
                height: 50,
                child: ElevatedButton(onPressed: (){}, style: ElevatedButton.styleFrom(backgroundColor: Colors.pink , foregroundColor: Colors.white , textStyle: TextStyle(fontSize: 20)), child: Text('   계속 하기')),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
              alignment: Alignment.center,
              child: Text('또는' , style: TextStyle(fontSize: 15)),
            )
          ],
        ),
      ),
    );
  }
}

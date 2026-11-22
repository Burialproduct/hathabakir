import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: test(),



  //Container(
      //   color: Colors.blue[600],
      //   margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
      //   padding: EdgeInsets.all(20.0),
      //   child: Text('menna'),
      // )
      //Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   children: [
      //     Text("hi iam menna"),
      //     ElevatedButton(onPressed: (){},
      //         child: Text("click here")),
      //      Image.asset(
      //          "assets/images/Flag_Egypt.png",
      //        width: 100.0,
      //         height: 100.0,
  ),
  );
class test extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("My App"),
        centerTitle: true,
        backgroundColor: Colors.red[500],
      ),
      body: Center(
        child: Text(
            "hi",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 35.0,
            letterSpacing: 12.0
          ),
        ),
      ),
    );
  }
}
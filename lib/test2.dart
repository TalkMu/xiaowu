import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xiaowu/test1.dart';

class test2 extends StatefulWidget {
  const test2({Key? key}) : super(key: key);

  @override
  _test2State createState() => _test2State();
}

class _test2State extends State<test2> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return test1();
          }));
        },
        child: Text("跳转到1"),
      ),
    );
  }
}

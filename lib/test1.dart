import 'package:flutter/material.dart';
import 'package:xiaowu/test2.dart';

class test1 extends StatefulWidget {
  const test1({Key? key}) : super(key: key);

  @override
  _test1State createState() => _test1State();
}

class _test1State extends State<test1> {

  @override
  Widget build(BuildContext context) {
    return test2();
    return Center(
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return test2();
          }));
        },
        child: Text("跳转到页面二"),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

  }
}

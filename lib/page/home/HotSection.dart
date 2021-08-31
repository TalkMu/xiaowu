import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HotSection extends StatefulWidget {
  const HotSection({Key? key}) : super(key: key);

  @override
  _HotSectionState createState() => _HotSectionState();
}

class _HotSectionState extends State<HotSection> {
  List list = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: Row(
              children: [
                Container(
                  child: Text(
                    "实时热点",
                    style: TextStyle(
                        fontSize: ScreenUtil.getInstance().getSp(17),
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

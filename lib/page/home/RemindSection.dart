import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:xiaowu/entity/remind_entity.dart';
import 'package:xiaowu/util/ColorUtil.dart';

class RemindSection extends StatefulWidget {
  const RemindSection({Key? key}) : super(key: key);

  @override
  _RemindSectionState createState() => _RemindSectionState();
}

class _RemindSectionState extends State<RemindSection> {
  List<RemindEntity> list = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: ScreenUtil.getInstance().getWidth(16),
          right: ScreenUtil.getInstance().getWidth(16)),
      child: Column(
        children: [
          Container(
            child: Row(
              children: [
                Container(
                  child: Text(
                    "今日提醒",
                    style: TextStyle(
                      fontSize: ScreenUtil.getInstance().getSp(17),
                      fontWeight: FontWeight.w500,
                      color: ColorUtil.fromHex("#161833"),
                    ),
                  ),
                ),
                Container(
                  child: Image.asset(
                    "assets/images/home/remind.png",
                    width: ScreenUtil.getInstance().getWidth(16),
                    height: ScreenUtil.getInstance().getHeight(16),
                  ),
                ),
                Expanded(child: Container()),
                Container(
                    child: InkWell(
                  onTap: () {},
                  child: Text(
                    "添加",
                    style: TextStyle(
                        fontSize: ScreenUtil.getInstance().getSp(12),
                        fontWeight: FontWeight.w400,
                        color: ColorUtil.fromHex("#06D380")),
                  ),
                )),
                Container(
                  child: Text(
                    "｜",
                    style: TextStyle(
                        fontSize: ScreenUtil.getInstance().getSp(12),
                        fontWeight: FontWeight.w400,
                        color: ColorUtil.fromHex("#06D380")),
                  ),
                ),
                Container(
                  child: Text(
                    "更多>",
                    style: TextStyle(
                        fontSize: ScreenUtil.getInstance().getSp(12),
                        fontWeight: FontWeight.w400,
                        color: ColorUtil.fromHex("#161833")),
                  ),
                )
              ],
            ),
          ),
          Container(),
        ],
      ),
    );
  }
}

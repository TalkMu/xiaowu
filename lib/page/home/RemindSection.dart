import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xiaowu/entity/remind_entity.dart';
import 'package:xiaowu/util/ColorUtil.dart';

class RemindSection extends StatefulWidget {
  List<RemindEntity> list;

  RemindSection(this.list);

  @override
  _RemindSectionState createState() => _RemindSectionState(this.list);
}

class _RemindSectionState extends State<RemindSection> {
  List<RemindEntity> list = [];
  bool hasFirst = true;
  _RemindSectionState(this.list);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16),
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
                    child: InkWell(
                  child: Text(
                    "更多>",
                    style: TextStyle(
                        fontSize: ScreenUtil.getInstance().getSp(12),
                        fontWeight: FontWeight.w400,
                        color: ColorUtil.fromHex("#161833")),
                  ),
                  onTap: () {},
                ))
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: ScreenUtil.getInstance().getAdapterSize(12)),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Wrap(
                spacing: 10,
                children: list.map((e) => createView(e)).toList(),
              ),
            ),
          )

        ],
      ),
    );
  }

  Widget createView(RemindEntity remindEntity) {
    var view = Container(
      child: Container(
        width: ScreenUtil.getInstance().getWidth(164),
        decoration: BoxDecoration(
          image: new DecorationImage(
            // 图片填充方式
              fit: BoxFit.fill,
              // 图片位置
              alignment: Alignment.topCenter,
              image: AssetImage("assets/images/home/remind/kxp.png"),
              // 图片平铺方式
              repeat: ImageRepeat.repeatY),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            hasFirst?Container(
              alignment: Alignment.topCenter,
              height: ScreenUtil.getInstance().getAdapterSize(20),
              child: Text(
                "最近",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
              decoration: BoxDecoration(
                color: ColorUtil.fromHex("#FF8DCB"),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
              ),
              width: ScreenUtil.getInstance().getWidth(59),
            ):Container(height: ScreenUtil.getInstance().getAdapterSize(20),),
            Container(
              margin: EdgeInsets.only(top: ScreenUtil.getInstance().getAdapterSize(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      remindEntity.period,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5),
                    child: Text(remindEntity.time,
                        style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w500,
                            color: ColorUtil.fromHex("#161833"))),
                  )
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: ScreenUtil.getInstance().getAdapterSize(12), bottom: ScreenUtil.getInstance().getAdapterSize(15)),
              child: Text(
                remindEntity.description,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: ColorUtil.fromHex("#F86C18")),
              ),
            )
          ],
        ),
      ),
    );
    hasFirst = false;
    return view;
  }

  Widget emptyView() {
    return Container(
      margin: EdgeInsets.only(left: 0, right: 0),
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 0.4),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 30),
            child: Text(
              "无提醒",
              style: TextStyle(
                  color: ColorUtil.fromHex("#161833"),
                  fontSize: 32,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: 12, bottom: 15),
              child: Text.rich(TextSpan(children: [
                TextSpan(text: "今天你还没有行程哟，赶紧来"),
                TextSpan(
                  text: "添加",
                  style: TextStyle(color: ColorUtil.fromHex("#44CC92")),
                ),
                TextSpan(text: "试试吧"),
              ])))
        ],
      ),
    );
  }
}

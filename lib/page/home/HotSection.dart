import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xiaowu/entity/news_entity.dart';
import 'package:xiaowu/page/home/NewsDetail.dart';
import 'package:xiaowu/util/ColorUtil.dart';

class HotSection extends StatefulWidget {
  List<NewsEntity> list = [];

  HotSection(this.list);

  @override
  _HotSectionState createState() => _HotSectionState(this.list);
}

class _HotSectionState extends State<HotSection> {
  List<NewsEntity> list = [];

  _HotSectionState(this.list);

  Widget createView(NewsEntity newsEntity) {
    return InkWell(
      onTap: (){
        Navigator.push(context,
            new MaterialPageRoute(builder: (BuildContext context) {
              return new NewsDetail(
                newsId: newsEntity.id,
              );
              /// 跳转到第三页，并且传递参数过去
            }));
      },
      child: Container(
        margin: EdgeInsets.only(top: ScreenUtil.getInstance().getHeight(10)),
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 0.4),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(
                  left: ScreenUtil.getInstance().getWidth(16),
                  top: ScreenUtil.getInstance().getHeight(20)),
              width: ScreenUtil.getInstance().getWidth(218),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      newsEntity.title,
                      style: TextStyle(
                          color: ColorUtil.fromHex("#161833"),
                          fontSize: ScreenUtil.getInstance().getSp(15),
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: ScreenUtil.getInstance().getHeight(20),
                        bottom: ScreenUtil.getInstance().getHeight(20)),
                    child: Text(
                      "更新于" + newsEntity.createTimeStr,
                      style: TextStyle(
                          color: ColorUtil.fromHex("#94969E"),
                          fontSize: ScreenUtil.getInstance().getSp(12),
                          fontWeight: FontWeight.w400),
                    ),
                  )
                ],
              ),
            ),
            Expanded(child: Container()),
            newsEntity.mediaUrls.length > 0
                ? Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    margin: EdgeInsets.only(
                        right: ScreenUtil.getInstance().getWidth(10)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        newsEntity.mediaUrls.first,
                        width: ScreenUtil.getInstance().getWidth(95),
                        height: ScreenUtil.getInstance().getHeight(85),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }

  _showDetail(int newsId) {
    Navigator.push(context,
        new MaterialPageRoute(builder: (BuildContext context) {
      return new NewsDetail(
        newsId: newsId,
      );

      /// 跳转到第三页，并且传递参数过去
    }));
  }

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
                    "实时热点",
                    style: TextStyle(
                        fontSize: ScreenUtil.getInstance().getSp(17),
                        fontWeight: FontWeight.w500,
                        color: ColorUtil.fromHex("#161833")),
                  ),
                ),
                Container(
                  child: Image.asset(
                    "assets/images/home/hot.png",
                    width: ScreenUtil.getInstance().getWidth(16),
                    height: ScreenUtil.getInstance().getHeight(16),
                  ),
                ),
                Expanded(child: Container()),
                Container(
                  child: InkWell(
                    child: Text(
                      "更多>",
                      style: TextStyle(
                          color: ColorUtil.fromHex("#161833"),
                          fontSize: ScreenUtil.getInstance().getSp(12),
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return createView(list[index]);
                  }))
        ],
      ),
    );
  }
}

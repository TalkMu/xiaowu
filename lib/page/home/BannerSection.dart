import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:xiaowu/entity/banner_entity.dart';

class BannerSection extends StatefulWidget {
  List<BannerEntity> list = [];

  BannerSection(this.list);

  @override
  _BannerSectionState createState() => _BannerSectionState(list);
}

class _BannerSectionState extends State<BannerSection> {
  List<BannerEntity> list = [];

  _BannerSectionState(this.list);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 28, right: 28),
      height: ScreenUtil.getInstance().getHeight(120),
      child: Swiper(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Image.network(
            list[index].url,
            fit: BoxFit.fitWidth,
          );
        },
        pagination: SwiperPagination(
            //margin: EdgeInsets.only(bottom: 0)
            ),
        control: SwiperControl(),
      ),
    );
  }
}

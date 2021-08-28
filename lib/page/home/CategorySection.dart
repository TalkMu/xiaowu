import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:xiaowu/entity/category_entity.dart';
import 'package:xiaowu/util/ColorUtil.dart';

class CategorySection extends StatelessWidget {
  List<CategoryEntity> list = [];

  CategorySection(this.list);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16,right: 16),
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 0.4),
        borderRadius: BorderRadius.circular(15),
      ),
      child: GridView.count(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: 3,
        childAspectRatio: 1/0.8,
        children: list.map((e) => createCategoryView(e)).toList(),
      ),
    );
  }

  Widget createCategoryView(CategoryEntity categoryEntity) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Image.network(categoryEntity.serverIcon,
                width: ScreenUtil.getInstance().getWidth(44),
                height: ScreenUtil.getInstance().getAdapterSize(44)),
          ),
          Container(
            margin: EdgeInsets.only(
                top: ScreenUtil.getInstance().getAdapterSize(11)),
            child: Text(
              categoryEntity.serverName,
              style: TextStyle(
                  fontSize: ScreenUtil.getInstance().getAdapterSize(12),
                  fontWeight: FontWeight.w400,
                  color: ColorUtil.fromHex("#161833")),
            ),
          )
        ],
      ),
    );
  }
}

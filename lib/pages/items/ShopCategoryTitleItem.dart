import 'package:clowset/extension/ext.dart';
import 'package:flutter/material.dart';

class ShopCategoryTitleItem extends StatefulWidget {
  final name;

  ShopCategoryTitleItem({@required this.name});

  @override
  _ShopCategoryTitleItemState createState() => _ShopCategoryTitleItemState();
}

class _ShopCategoryTitleItemState extends State<ShopCategoryTitleItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      padding: EdgeInsets.only(right: 20 , left: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                color: parseColor("d3c7aa").withOpacity(0.10),
                offset: Offset(1, 3),
                blurRadius: 5,
                spreadRadius: 0)
          ]
      ),
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(widget.name),
      ),
    );
  }
}

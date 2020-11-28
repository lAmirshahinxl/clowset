import 'package:flutter/material.dart';

typedef OnPress(String id);

class HomeItem extends StatefulWidget {
  final src;
  final id;
  OnPress callback;

  HomeItem({@required this.src, @required this.id, @required this.callback});

  @override
  _HomeItemState createState() => _HomeItemState();
}

class _HomeItemState extends State<HomeItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: () {
          print("click");
        },
        child: Stack(
          children: [
            FadeInImage.assetNetwork(
              placeholder: "assets/clowset_place.jpeg",
              image: widget.src,
              fit: BoxFit.cover,
            ),
            Positioned.fill(
              child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                      splashColor: Colors.orangeAccent.withOpacity(0.5),
                      onTap: () {
                        widget.callback(widget.id);
                      })),
            ),
          ],
        ),
      ),
    );
  }
}

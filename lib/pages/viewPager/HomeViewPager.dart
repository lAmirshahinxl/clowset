import 'package:clowset/components/HeaderHome.dart';
import 'package:clowset/core/service/Service.dart';
import 'package:clowset/pages/items/HomeItem.dart';
import 'package:flutter/material.dart';

typedef OnPressItem(String id);

class HomeViewPager extends StatefulWidget {
  final MyService service;
  OnPressItem callback;

  HomeViewPager(this.service, {@required this.callback});

  @override
  _HomeViewPagerState createState() => _HomeViewPagerState();
}

class _HomeViewPagerState extends State<HomeViewPager> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          SingleChildScrollView(
            child: FutureBuilder(
              future: widget.service.homeBanner(),
              builder: (context, snapshot) {
                Widget child;
                if (snapshot.connectionState == ConnectionState.waiting) {
                  child = Align(
                      alignment: Alignment.center,
                      child: LinearProgressIndicator());
                } else {
                  child = Container(
                    padding: EdgeInsets.only(right: 20, left: 20, top: 100),
                    child: ListView.builder(
                      itemCount: snapshot.data.data.length,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return HomeItem(
                          id: snapshot.data.data[index].idNeed,
                          src: snapshot.data.data[index].src,
                          callback: (String id) {
                            widget.callback(id);
                          },
                        );
                      },
                    ),
                  );
                }

                return AnimatedSwitcher(
                  duration: Duration(seconds: 1),
                  child: child,
                );
              },
            ),
          ),
          HeaderHome(),
        ],
      ),
    );
  }
}

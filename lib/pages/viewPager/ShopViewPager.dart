import 'package:clowset/components/TextFiealdSearch.dart';
import 'package:clowset/core/service/Service.dart';
import 'package:clowset/pages/items/HomeItem.dart';
import 'package:clowset/styles/colors.dart';
import 'package:clowset/styles/strings.dart';
import 'package:clowset/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:clowset/extension/ext.dart';
import 'package:petitparser/expression.dart';

typedef OnPressItemShop(String id);
class ShopViewPager extends StatefulWidget {
  final String id;
  OnPressItemShop callback;
  ShopViewPager(this.id , {@required this.callback});

  @override
  _ShopViewPagerState createState() => _ShopViewPagerState();
}

class _ShopViewPagerState extends State<ShopViewPager> {
  var _service = MyService();
  var _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _service.shopBanner(widget.id),
      builder: (context, snapshot) {
        Widget child;
        if (snapshot.connectionState == ConnectionState.waiting) {
          child = Align(
              alignment: Alignment.center, child: LinearProgressIndicator());
        } else {
          child = SingleChildScrollView(
            child: Container(
              height: gh(1),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 0,
                    child: FadeInImage.assetNetwork(
                      placeholder: "assets/clowset_place.jpeg",
                      image: snapshot.data.data.base.bgSrc,
                      fit: BoxFit.cover,
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                  Positioned(
                      top: 0,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.only(right: 20, left: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 40,
                                ),
                                TextFiealdSearch(
                                    _searchController, MyStrings.search, 30),
                                SizedBox(
                                  height: 40,
                                ),
                                Container(
                                  width: gw(1),
                                  height: 100,
                                  padding: EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                      color: MyColors.white,
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      FadeInImage.assetNetwork(
                                        placeholder: "assets/clowset_place.jpeg",
                                        image: snapshot.data.data.base.nameSrc,
                                        fit: BoxFit.cover,
                                        height: 30,
                                      ),
                                      Text(
                                        MyStrings.shopName,
                                        style: MyStyles.titleShop,
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                ListView.builder(
                                  itemCount: snapshot.data.data.listt.length,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return HomeItem(
                                      src: snapshot.data.data.listt[index].src,
                                      id: snapshot.data.data.listt[index].idNeed,
                                      callback: (id) {
                                        widget.callback(id);
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                  )
                ],
              ),
            ),
          );
        }

        return AnimatedSwitcher(
          duration: Duration(seconds: 1),
          child: child,
        );
      },
    );
  }
}

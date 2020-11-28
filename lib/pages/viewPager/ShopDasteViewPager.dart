import 'package:clowset/components/TextFiealdSearch.dart';
import 'package:clowset/core/service/Service.dart';
import 'package:clowset/pages/items/HomeItem.dart';
import 'package:clowset/pages/items/ShopCategoryTitleItem.dart';
import 'package:clowset/styles/colors.dart';
import 'package:clowset/styles/strings.dart';
import 'package:clowset/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:clowset/extension/ext.dart';
import 'package:shared_preferences/shared_preferences.dart';

typedef OnItemSelected(String id);

class ShopDasteViewPager extends StatefulWidget {
  final String id;
  OnItemSelected callback;

  ShopDasteViewPager(this.id, {@required this.callback});

  @override
  _ShopDasteViewPagerState createState() => _ShopDasteViewPagerState();
}

class _ShopDasteViewPagerState extends State<ShopDasteViewPager>
    with TickerProviderStateMixin {
  var _service = MyService();
  var _searchController = TextEditingController();
  TabController _tabController;
  int _gender = 0;

  @override
  void initState() {
    _tabController = TabController(vsync: this, initialIndex: 0, length: 2);
    super.initState();
  }

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
            child: DefaultTabController(
              length: 2,
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
                                    height: 180,
                                    padding: EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                        color: MyColors.white,
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            FadeInImage.assetNetwork(
                                              placeholder:
                                                  "assets/clowset_place.jpeg",
                                              image: snapshot
                                                  .data.data.base.nameSrc,
                                              fit: BoxFit.cover,
                                              height: 30,
                                            ),
                                            Text(
                                              MyStrings.shopName,
                                              style: MyStyles.titleShop,
                                            )
                                          ],
                                        ),
                                        Divider(
                                          height: 1,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              right: 30, left: 30),
                                          child: TabBar(
                                            indicatorColor: MyColors.orang,
                                            unselectedLabelColor:
                                                MyColors.black.withOpacity(0.3),
                                            indicatorPadding: EdgeInsets.only(
                                                right: 30, left: 30),
                                            controller: _tabController,
                                            onTap: (value) {
                                              setState(() {
                                                _gender = value;
                                              });
                                            },
                                            tabs: [
                                              Tab(
                                                text: "آقایان",
                                              ),
                                              Tab(
                                                text: "بانوان",
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  ListView.builder(
                                    itemCount: 5,
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      if (_gender == 0) {
                                        return ExpansionTile(
                                          title: ShopCategoryTitleItem(
                                            name: "تست",
                                          ),
                                          children: [
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Center(
                                              child: Container(
                                                height: 30,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color: parseColor(
                                                                  "d3c7aa")
                                                              .withOpacity(
                                                                  0.10),
                                                          offset: Offset(1, 3),
                                                          blurRadius: 5,
                                                          spreadRadius: 0)
                                                    ]),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Center(
                                              child: Container(
                                                height: 30,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color: parseColor(
                                                                  "d3c7aa")
                                                              .withOpacity(
                                                                  0.10),
                                                          offset: Offset(1, 3),
                                                          blurRadius: 5,
                                                          spreadRadius: 0)
                                                    ]),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Center(
                                              child: Container(
                                                height: 30,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color: parseColor(
                                                                  "d3c7aa")
                                                              .withOpacity(
                                                                  0.10),
                                                          offset: Offset(1, 3),
                                                          blurRadius: 5,
                                                          spreadRadius: 0)
                                                    ]),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        );
                                      } else {
                                        return ExpansionTile(
                                          title: ShopCategoryTitleItem(
                                            name: "تست",
                                          ),
                                          children: [
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Center(
                                              child: Container(
                                                height: 30,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color: parseColor(
                                                                  "d3c7aa")
                                                              .withOpacity(
                                                                  0.10),
                                                          offset: Offset(1, 3),
                                                          blurRadius: 5,
                                                          spreadRadius: 0)
                                                    ]),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Center(
                                              child: Container(
                                                height: 30,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color: parseColor(
                                                                  "d3c7aa")
                                                              .withOpacity(
                                                                  0.10),
                                                          offset: Offset(1, 3),
                                                          blurRadius: 5,
                                                          spreadRadius: 0)
                                                    ]),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Center(
                                              child: Container(
                                                height: 30,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color: parseColor(
                                                                  "d3c7aa")
                                                              .withOpacity(
                                                                  0.10),
                                                          offset: Offset(1, 3),
                                                          blurRadius: 5,
                                                          spreadRadius: 0)
                                                    ]),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        );
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ))
                  ],
                ),
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

// Future<bool> _isMale() async {
//   SharedPreferences _pref = await SharedPreferences.getInstance();
//   if (_pref.getString('gender') == "male") {
//     return true;
//   }else {
//     return false;
//   }
// }
}

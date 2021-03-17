import 'package:Armdeot/Discover.dart';
import 'package:Armdeot/Home.dart';
import 'package:Armdeot/Profile.dart';
import 'package:Armdeot/assests/color.dart';
import 'package:Armdeot/assests/dimension.dart';
import 'package:Armdeot/assests/icons.dart';
import 'package:Armdeot/assests/snack.dart';
import 'package:Armdeot/assests/uiOverlay.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:Armdeot/assests/font.dart';
import 'package:Armdeot/assests/capitalization.dart';

class Brands extends StatefulWidget {
  @override
  _BrandsState createState() => _BrandsState();
}

class _BrandsState extends State<Brands> {
  // global keys
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  Dimensions _dimensions;
  HandleMsg _msg;

  @override
  void initState() {
    super.initState();
    _dimensions = Dimensions(context: context);
    _msg = HandleMsg(globalKey: _globalKey);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    UIOverlay.mainOverlay;
    return Scaffold(
      key: _globalKey,
      backgroundColor: ColorTheme.background,
      bottomNavigationBar: CurvedNavigationBar(
        index: 2,
        height: _dimensions.height(70),
        backgroundColor: ColorTheme.background,
        buttonBackgroundColor: ColorTheme.white,
        onTap: (pageIndex) {
          if (pageIndex == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Home(),
              ),
            );
          } else if (pageIndex == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Discover(),
              ),
            );
          } else if (pageIndex == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Brands(),
              ),
            );
          } else if (pageIndex == 3) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Profile(),
              ),
            );
          }
        },
        items: [
          // home
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                AppIcons.homeIcon,
                color: ColorTheme.button,
              ),
              Text(
                'Home',
                style: FontStyle.small(false),
              ),
            ],
          ),
          // discover
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                AppIcons.exploreIcon,
                color: ColorTheme.button,
              ),
              Text(
                'Discover',
                style: FontStyle.small(false),
              ),
            ],
          ),
          // brands
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                AppIcons.brandsIcon,
                color: ColorTheme.button,
              ),
              Text(
                'Brands',
                style: FontStyle.small(false),
              ),
            ],
          ),
          // profile
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                AppIcons.profileIcon,
                color: ColorTheme.button,
              ),
              Text(
                'Profile',
                style: FontStyle.small(false),
              ),
            ],
          ),
        ],
      ),
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          // app bar
          SliverAppBar(
            title: Container(
              width: _dimensions.width(100),
              height: _dimensions.height(50),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'images/armdeot.png',
                  ),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            actions: [
              // favourite button
              InkWell(
                onTap: () {
                  _msg.show(
                    'This is a demo version',
                    context,
                  );
                },
                child: Container(
                  width: _dimensions.width(30),
                  height: _dimensions.height(70),
                  child: Icon(
                    AppIcons.favoriteBorderIcon,
                    color: ColorTheme.background,
                    size: 25,
                  ),
                ),
              ),
              // sized box
              SizedBox(
                width: 10,
              ),
              // cart button
              InkWell(
                onTap: () {
                  _msg.show(
                    'This is a demo version',
                    context,
                  );
                },
                child: Container(
                  width: _dimensions.width(30),
                  height: _dimensions.height(70),
                  child: Icon(
                    AppIcons.cartIcon,
                    color: ColorTheme.background,
                    size: 25,
                  ),
                ),
              ),
              // sized box
              SizedBox(
                width: 10,
              ),
            ],
            brightness: Brightness.dark,
            backgroundColor: ColorTheme.button,
            floating: true,
            expandedHeight: _dimensions.height(50),
            toolbarHeight: _dimensions.height(50),
            collapsedHeight: _dimensions.height(50),
          ),
          // body
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  width: _dimensions.width(360),
                  height: _dimensions.height(588),
                  margin: EdgeInsets.only(
                    top: _dimensions.topbottom(20),
                  ),
                  alignment: Alignment.topLeft,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    physics: BouncingScrollPhysics(),
                    children: [
                      // Brands title bar
                      Container(
                        height: _dimensions.height(30),
                        padding: EdgeInsets.only(
                          left: _dimensions.rightleft(12),
                          right: _dimensions.rightleft(16),
                        ),
                        child: Text(
                          'Brands'.capitalizeFirstofEach(),
                          style: FontStyle.xlargeBold(false),
                        ),
                      ),
                      // amazon
                      Container(
                        height: _dimensions.height(80),
                        margin: EdgeInsets.only(
                          top: _dimensions.topbottom(10),
                        ),
                        padding: EdgeInsets.only(
                          left: _dimensions.rightleft(12),
                          right: _dimensions.rightleft(16),
                        ),
                        color: ColorTheme.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // logo
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // logo
                                Container(
                                  width: _dimensions.width(120),
                                  height: _dimensions.height(80),
                                  child: Image.network(
                                    'https://cdn.shortpixel.ai/spai/w_207+q_lossy+ret_img+to_webp/https://www.armdeot.world/wp-content/uploads/2020/09/amazon.jpg',
                                    fit: BoxFit.fitWidth,
                                    loadingBuilder: (BuildContext context,
                                        Widget child,
                                        ImageChunkEvent loadingProgress) {
                                      if (loadingProgress == null) {
                                        return child;
                                      }
                                      return Center(
                                        child: CircularProgressIndicator(
                                          value: loadingProgress
                                                      .expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes
                                              : null,
                                        ),
                                      );
                                    },
                                    filterQuality: FilterQuality.high,
                                    width: _dimensions.width(120),
                                    height: _dimensions.height(60),
                                    cacheHeight: _dimensions.height(60).toInt(),
                                    cacheWidth: _dimensions.width(120).toInt(),
                                  ),
                                ),
                                // sized box
                                SizedBox(
                                  width: _dimensions.width(10),
                                ),
                                // name
                                Text(
                                  'Amazon UK',
                                  style: FontStyle.normal(false),
                                ),
                              ],
                            ),
                            // visit site icon
                            Container(
                              width: _dimensions.width(50),
                              alignment: Alignment.centerLeft,
                              child: Icon(
                                AppIcons.visitSiteIcon,
                                size: IconSize.normal,
                                color: ColorTheme.button,
                              ),
                            )
                          ],
                        ),
                      ),
                      // ebay
                      Container(
                        height: _dimensions.height(80),
                        margin: EdgeInsets.only(
                          top: _dimensions.topbottom(10),
                        ),
                        padding: EdgeInsets.only(
                          left: _dimensions.rightleft(12),
                          right: _dimensions.rightleft(16),
                        ),
                        color: ColorTheme.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // logo
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // logo
                                Container(
                                  width: _dimensions.width(120),
                                  height: _dimensions.height(80),
                                  child: Image.network(
                                    'https://cdn.shortpixel.ai/spai/w_207+q_lossy+ret_img+to_webp/https://www.armdeot.world/wp-content/uploads/2020/09/ebay.jpg',
                                    fit: BoxFit.fitWidth,
                                    loadingBuilder: (BuildContext context,
                                        Widget child,
                                        ImageChunkEvent loadingProgress) {
                                      if (loadingProgress == null) {
                                        return child;
                                      }
                                      return Center(
                                        child: CircularProgressIndicator(
                                          value: loadingProgress
                                                      .expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes
                                              : null,
                                        ),
                                      );
                                    },
                                    filterQuality: FilterQuality.high,
                                    width: _dimensions.width(120),
                                    height: _dimensions.height(60),
                                    cacheHeight: _dimensions.height(60).toInt(),
                                    cacheWidth: _dimensions.width(120).toInt(),
                                  ),
                                ),
                                // sized box
                                SizedBox(
                                  width: _dimensions.width(10),
                                ),
                                // name
                                Text(
                                  'Ebay UK',
                                  style: FontStyle.normal(false),
                                ),
                              ],
                            ),
                            // visit site icon
                            Container(
                              width: _dimensions.width(50),
                              alignment: Alignment.centerLeft,
                              child: Icon(
                                AppIcons.visitSiteIcon,
                                size: IconSize.normal,
                                color: ColorTheme.button,
                              ),
                            )
                          ],
                        ),
                      ),
                      // nike
                      Container(
                        height: _dimensions.height(80),
                        margin: EdgeInsets.only(
                          top: _dimensions.topbottom(10),
                        ),
                        padding: EdgeInsets.only(
                          left: _dimensions.rightleft(12),
                          right: _dimensions.rightleft(16),
                        ),
                        color: ColorTheme.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // logo
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // logo
                                Container(
                                  width: _dimensions.width(120),
                                  height: _dimensions.height(80),
                                  child: Image.network(
                                    'https://cdn.shortpixel.ai/spai/w_207+q_lossy+ret_img+to_webp/https://www.armdeot.world/wp-content/uploads/2020/09/nike.jpg',
                                    fit: BoxFit.fitWidth,
                                    loadingBuilder: (BuildContext context,
                                        Widget child,
                                        ImageChunkEvent loadingProgress) {
                                      if (loadingProgress == null) {
                                        return child;
                                      }
                                      return Center(
                                        child: CircularProgressIndicator(
                                          value: loadingProgress
                                                      .expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes
                                              : null,
                                        ),
                                      );
                                    },
                                    filterQuality: FilterQuality.high,
                                    width: _dimensions.width(120),
                                    height: _dimensions.height(60),
                                    cacheHeight: _dimensions.height(60).toInt(),
                                    cacheWidth: _dimensions.width(120).toInt(),
                                  ),
                                ),
                                // sized box
                                SizedBox(
                                  width: _dimensions.width(10),
                                ),
                                // name
                                Text(
                                  'Nike UK',
                                  style: FontStyle.normal(false),
                                ),
                              ],
                            ),
                            // visit site icon
                            Container(
                              width: _dimensions.width(50),
                              alignment: Alignment.centerLeft,
                              child: Icon(
                                AppIcons.visitSiteIcon,
                                size: IconSize.normal,
                                color: ColorTheme.button,
                              ),
                            )
                          ],
                        ),
                      ),
                      // superchrug
                      Container(
                        height: _dimensions.height(80),
                        margin: EdgeInsets.only(
                          top: _dimensions.topbottom(10),
                        ),
                        padding: EdgeInsets.only(
                          left: _dimensions.rightleft(12),
                          right: _dimensions.rightleft(16),
                        ),
                        color: ColorTheme.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // logo
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // logo
                                Container(
                                  width: _dimensions.width(120),
                                  height: _dimensions.height(80),
                                  child: Image.network(
                                    'https://cdn.shortpixel.ai/spai/w_207+q_lossy+ret_img+to_webp/https://www.armdeot.world/wp-content/uploads/2020/09/superdrug.jpg',
                                    fit: BoxFit.fitWidth,
                                    loadingBuilder: (BuildContext context,
                                        Widget child,
                                        ImageChunkEvent loadingProgress) {
                                      if (loadingProgress == null) {
                                        return child;
                                      }
                                      return Center(
                                        child: CircularProgressIndicator(
                                          value: loadingProgress
                                                      .expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes
                                              : null,
                                        ),
                                      );
                                    },
                                    filterQuality: FilterQuality.high,
                                    width: _dimensions.width(120),
                                    height: _dimensions.height(60),
                                    cacheHeight: _dimensions.height(60).toInt(),
                                    cacheWidth: _dimensions.width(120).toInt(),
                                  ),
                                ),
                                // sized box
                                SizedBox(
                                  width: _dimensions.width(10),
                                ),
                                // name
                                Text(
                                  'Superchrug UK',
                                  style: FontStyle.normal(false),
                                ),
                              ],
                            ),
                            // visit site icon
                            Container(
                              width: _dimensions.width(50),
                              alignment: Alignment.centerLeft,
                              child: Icon(
                                AppIcons.visitSiteIcon,
                                size: IconSize.normal,
                                color: ColorTheme.button,
                              ),
                            )
                          ],
                        ),
                      ),
                      // zara
                      Container(
                        height: _dimensions.height(80),
                        margin: EdgeInsets.only(
                          top: _dimensions.topbottom(10),
                        ),
                        padding: EdgeInsets.only(
                          left: _dimensions.rightleft(12),
                          right: _dimensions.rightleft(16),
                        ),
                        color: ColorTheme.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // logo
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // logo
                                Container(
                                  width: _dimensions.width(120),
                                  height: _dimensions.height(80),
                                  child: Image.network(
                                    'https://cdn.shortpixel.ai/spai/w_207+q_lossy+ret_img+to_webp/https://www.armdeot.world/wp-content/uploads/2020/09/zara.jpg',
                                    fit: BoxFit.fitWidth,
                                    loadingBuilder: (BuildContext context,
                                        Widget child,
                                        ImageChunkEvent loadingProgress) {
                                      if (loadingProgress == null) {
                                        return child;
                                      }
                                      return Center(
                                        child: CircularProgressIndicator(
                                          value: loadingProgress
                                                      .expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes
                                              : null,
                                        ),
                                      );
                                    },
                                    filterQuality: FilterQuality.high,
                                    width: _dimensions.width(120),
                                    height: _dimensions.height(60),
                                    cacheHeight: _dimensions.height(60).toInt(),
                                    cacheWidth: _dimensions.width(120).toInt(),
                                  ),
                                ),
                                // sized box
                                SizedBox(
                                  width: _dimensions.width(10),
                                ),
                                // name
                                Text(
                                  'ZARA UK',
                                  style: FontStyle.normal(false),
                                ),
                              ],
                            ),
                            // visit site icon
                            Container(
                              width: _dimensions.width(50),
                              alignment: Alignment.centerLeft,
                              child: Icon(
                                AppIcons.visitSiteIcon,
                                size: IconSize.normal,
                                color: ColorTheme.button,
                              ),
                            )
                          ],
                        ),
                      ),
                      // topman
                      Container(
                        height: _dimensions.height(80),
                        margin: EdgeInsets.only(
                          top: _dimensions.topbottom(10),
                        ),
                        padding: EdgeInsets.only(
                          left: _dimensions.rightleft(12),
                          right: _dimensions.rightleft(16),
                        ),
                        color: ColorTheme.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // logo
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // logo
                                Container(
                                  width: _dimensions.width(120),
                                  height: _dimensions.height(80),
                                  child: Image.network(
                                    'https://cdn.shortpixel.ai/spai/w_207+q_lossy+ret_img+to_webp/https://www.armdeot.world/wp-content/uploads/2020/09/topman.jpg',
                                    fit: BoxFit.fitWidth,
                                    loadingBuilder: (BuildContext context,
                                        Widget child,
                                        ImageChunkEvent loadingProgress) {
                                      if (loadingProgress == null) {
                                        return child;
                                      }
                                      return Center(
                                        child: CircularProgressIndicator(
                                          value: loadingProgress
                                                      .expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes
                                              : null,
                                        ),
                                      );
                                    },
                                    filterQuality: FilterQuality.high,
                                    width: _dimensions.width(120),
                                    height: _dimensions.height(60),
                                    cacheHeight: _dimensions.height(60).toInt(),
                                    cacheWidth: _dimensions.width(120).toInt(),
                                  ),
                                ),
                                // sized box
                                SizedBox(
                                  width: _dimensions.width(10),
                                ),
                                // name
                                Text(
                                  'Topman',
                                  style: FontStyle.normal(false),
                                ),
                              ],
                            ),
                            // visit site icon
                            Container(
                              width: _dimensions.width(50),
                              alignment: Alignment.centerLeft,
                              child: Icon(
                                AppIcons.visitSiteIcon,
                                size: IconSize.normal,
                                color: ColorTheme.button,
                              ),
                            )
                          ],
                        ),
                      ),
                      // estee
                      Container(
                        height: _dimensions.height(80),
                        margin: EdgeInsets.only(
                          top: _dimensions.topbottom(10),
                        ),
                        padding: EdgeInsets.only(
                          left: _dimensions.rightleft(12),
                          right: _dimensions.rightleft(16),
                        ),
                        color: ColorTheme.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // logo
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // logo
                                Container(
                                  width: _dimensions.width(120),
                                  height: _dimensions.height(80),
                                  child: Image.network(
                                    'https://cdn.shortpixel.ai/spai/w_207+q_lossy+ret_img+to_webp/https://www.armdeot.world/wp-content/uploads/2020/09/estelauder.jpg',
                                    fit: BoxFit.fitWidth,
                                    loadingBuilder: (BuildContext context,
                                        Widget child,
                                        ImageChunkEvent loadingProgress) {
                                      if (loadingProgress == null) {
                                        return child;
                                      }
                                      return Center(
                                        child: CircularProgressIndicator(
                                          value: loadingProgress
                                                      .expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes
                                              : null,
                                        ),
                                      );
                                    },
                                    filterQuality: FilterQuality.high,
                                    width: _dimensions.width(120),
                                    height: _dimensions.height(60),
                                    cacheHeight: _dimensions.height(60).toInt(),
                                    cacheWidth: _dimensions.width(120).toInt(),
                                  ),
                                ),
                                // sized box
                                SizedBox(
                                  width: _dimensions.width(10),
                                ),
                                // name
                                Text(
                                  'Estee Lauder',
                                  style: FontStyle.normal(false),
                                ),
                              ],
                            ),
                            // visit site icon
                            Container(
                              width: _dimensions.width(50),
                              alignment: Alignment.centerLeft,
                              child: Icon(
                                AppIcons.visitSiteIcon,
                                size: IconSize.normal,
                                color: ColorTheme.button,
                              ),
                            )
                          ],
                        ),
                      ),
                      // sized box
                      SizedBox(
                        height: _dimensions.height(40),
                      ),
                    ],
                  ),
                );
              },
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }
}

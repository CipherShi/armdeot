import 'package:Armdeot/Brands.dart';
import 'package:Armdeot/Discover.dart';
import 'package:Armdeot/Home.dart';
import 'package:Armdeot/assests/color.dart';
import 'package:Armdeot/assests/dimension.dart';
import 'package:Armdeot/assests/icons.dart';
import 'package:Armdeot/assests/snack.dart';
import 'package:Armdeot/assests/uiOverlay.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:Armdeot/assests/font.dart';
import 'package:Armdeot/assests/capitalization.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  // global keys
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  PageController _pageController;

  int _pageControllerIndex = 0;

  Dimensions _dimensions;
  HandleMsg _msg;

  @override
  void initState() {
    super.initState();
    _dimensions = Dimensions(context: context);
    _msg = HandleMsg(globalKey: _globalKey);
    _pageController = PageController(
      initialPage: 0,
      viewportFraction: 1.0,
    );
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
        index: 3,
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
              // settings button
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
                    AppIcons.settingsIcon,
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
                  height: _dimensions.height(550),
                  margin: EdgeInsets.only(
                    bottom: _dimensions.topbottom(20),
                  ),
                  alignment: Alignment.topLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // account details
                      Container(
                        height: _dimensions.height(200),
                        padding: EdgeInsets.only(
                          left: _dimensions.rightleft(24),
                          right: _dimensions.rightleft(16),
                        ),
                        color: ColorTheme.button,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // user details
                            Container(
                              height: _dimensions.height(150),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  // user details
                                  Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        // image
                                        Container(
                                          width: _dimensions.width(100),
                                          height: _dimensions.height(100),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              _dimensions.radius(
                                                20,
                                              ),
                                            ),
                                            image: DecorationImage(
                                              image: AssetImage(
                                                'images/Profile_sea.png',
                                              ),
                                            ),
                                          ),
                                        ),
                                        // sized box
                                        SizedBox(
                                          height: _dimensions.height(10),
                                        ),
                                        // user name
                                        Container(
                                          width: _dimensions.width(80),
                                          height: _dimensions.height(30),
                                          alignment: Alignment.center,
                                          child: Text(
                                            'John doe'.capitalizeFirstofEach(),
                                            textAlign: TextAlign.center,
                                            style: FontStyle.normal(true),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      // menu
                      Container(
                        height: _dimensions.height(50),
                        padding: EdgeInsets.only(
                          left: _dimensions.rightleft(12),
                          right: _dimensions.rightleft(16),
                        ),
                        color: ColorTheme.button,
                        child: Row(
                          children: [
                            // favourite items
                            InkWell(
                              onTap: () {
                                _pageController.animateToPage(
                                  0,
                                  duration: Duration(
                                    milliseconds: 100,
                                  ),
                                  curve: Curves.easeInOut,
                                );
                              },
                              child: Container(
                                width: _dimensions.width(110),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: ColorTheme.amber,
                                      width: _pageControllerIndex == 0 ? 2 : 0,
                                    ),
                                  ),
                                ),
                                child: Text(
                                  'Favourite'.toUpperCase(),
                                  style: FontStyle.medium(true),
                                ),
                              ),
                            ),
                            // tracker
                            InkWell(
                              onTap: () {
                                _pageController.animateToPage(
                                  1,
                                  duration: Duration(
                                    milliseconds: 100,
                                  ),
                                  curve: Curves.easeInOut,
                                );
                              },
                              child: Container(
                                width: _dimensions.width(110),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: ColorTheme.amber,
                                      width: _pageControllerIndex == 1 ? 2 : 0,
                                    ),
                                  ),
                                ),
                                child: Text(
                                  'Tracker'.toUpperCase(),
                                  style: FontStyle.medium(true),
                                ),
                              ),
                            ),
                            // history
                            InkWell(
                              onTap: () {
                                _pageController.animateToPage(
                                  2,
                                  duration: Duration(
                                    milliseconds: 100,
                                  ),
                                  curve: Curves.easeInOut,
                                );
                              },
                              child: Container(
                                width: _dimensions.width(110),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: ColorTheme.amber,
                                      width: _pageControllerIndex == 2 ? 2 : 0,
                                    ),
                                  ),
                                ),
                                child: Text(
                                  'History'.toUpperCase(),
                                  style: FontStyle.medium(true),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // pageview
                      Container(
                        width: _dimensions.width(360),
                        height: _dimensions.height(300),
                        child: PageView(
                          controller: _pageController,
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          onPageChanged: (pageIndex) {
                            setState(() {
                              _pageControllerIndex = pageIndex;
                            });
                          },
                          children: [
                            // favourite
                            Container(
                              width: _dimensions.width(360),
                              height: _dimensions.height(300),
                              color: ColorTheme.background,
                              child: SingleChildScrollView(
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                child: Column(
                                  children: [
                                    // sized box
                                    SizedBox(
                                      height: _dimensions.height(10),
                                    ),
                                    // row 1
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        // image
                                        Container(
                                          width: _dimensions.width(110),
                                          height: _dimensions.height(110),
                                          color: ColorTheme.background,
                                          child: Image.network(
                                            'https://www.armdeot.world/wp-content/uploads/2020/09/red-stand-mixer-vonshef-1000w.jpg',
                                            fit: BoxFit.cover,
                                            filterQuality: FilterQuality.low,
                                            color: ColorTheme.dark(34)
                                                .withOpacity(0.1),
                                            colorBlendMode: BlendMode.darken,
                                            cacheHeight:
                                                _dimensions.height(110).toInt(),
                                            cacheWidth:
                                                _dimensions.width(110).toInt(),
                                            height: _dimensions.height(110),
                                            width: _dimensions.width(110),
                                            loadingBuilder:
                                                (BuildContext context,
                                                    Widget child,
                                                    ImageChunkEvent
                                                        loadingProgress) {
                                              if (loadingProgress == null) {
                                                return child;
                                              }
                                              return Center(
                                                child:
                                                    CircularProgressIndicator(
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
                                          ),
                                        ),
                                        // image
                                        Container(
                                          width: _dimensions.width(110),
                                          height: _dimensions.height(110),
                                          color: ColorTheme.background,
                                          child: Image.network(
                                            'https://www.armdeot.world/wp-content/uploads/2020/09/2000032_1_copy.jpg',
                                            fit: BoxFit.cover,
                                            filterQuality: FilterQuality.low,
                                            color: ColorTheme.dark(34)
                                                .withOpacity(0.1),
                                            colorBlendMode: BlendMode.darken,
                                            cacheHeight:
                                                _dimensions.height(110).toInt(),
                                            cacheWidth:
                                                _dimensions.width(110).toInt(),
                                            height: _dimensions.height(110),
                                            width: _dimensions.width(110),
                                            loadingBuilder:
                                                (BuildContext context,
                                                    Widget child,
                                                    ImageChunkEvent
                                                        loadingProgress) {
                                              if (loadingProgress == null) {
                                                return child;
                                              }
                                              return Center(
                                                child:
                                                    CircularProgressIndicator(
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
                                          ),
                                        ),
                                        // image
                                        Container(
                                          width: _dimensions.width(110),
                                          height: _dimensions.height(110),
                                          color: ColorTheme.background,
                                          child: Image.network(
                                            'https://cdn.shortpixel.ai/spai/w_630+q_lossy+ret_img+to_webp/https://www.armdeot.world/wp-content/uploads/2020/09/black-stand-mixer-accessories.jpg',
                                            fit: BoxFit.cover,
                                            filterQuality: FilterQuality.low,
                                            color: ColorTheme.dark(34)
                                                .withOpacity(0.1),
                                            colorBlendMode: BlendMode.darken,
                                            cacheHeight:
                                                _dimensions.height(110).toInt(),
                                            cacheWidth:
                                                _dimensions.width(110).toInt(),
                                            height: _dimensions.height(110),
                                            width: _dimensions.width(110),
                                            loadingBuilder:
                                                (BuildContext context,
                                                    Widget child,
                                                    ImageChunkEvent
                                                        loadingProgress) {
                                              if (loadingProgress == null) {
                                                return child;
                                              }
                                              return Center(
                                                child:
                                                    CircularProgressIndicator(
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
                                          ),
                                        ),
                                      ],
                                    ),
                                    // sized box
                                    SizedBox(
                                      height: _dimensions.height(10),
                                    ),
                                    // row 2
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        // image
                                        Container(
                                          width: _dimensions.width(110),
                                          height: _dimensions.height(110),
                                          color: ColorTheme.background,
                                          child: Image.network(
                                            'https://cdn.shortpixel.ai/spai/w_236+q_lossy+ret_img+to_webp/https://www.armdeot.world/wp-content/uploads/2020/09/7248236_R_Z001A-300x300.jpg',
                                            fit: BoxFit.cover,
                                            filterQuality: FilterQuality.low,
                                            color: ColorTheme.dark(34)
                                                .withOpacity(0.1),
                                            colorBlendMode: BlendMode.darken,
                                            cacheHeight:
                                                _dimensions.height(110).toInt(),
                                            cacheWidth:
                                                _dimensions.width(110).toInt(),
                                            height: _dimensions.height(110),
                                            width: _dimensions.width(110),
                                            loadingBuilder:
                                                (BuildContext context,
                                                    Widget child,
                                                    ImageChunkEvent
                                                        loadingProgress) {
                                              if (loadingProgress == null) {
                                                return child;
                                              }
                                              return Center(
                                                child:
                                                    CircularProgressIndicator(
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
                                          ),
                                        ),
                                        // image
                                        Container(
                                          width: _dimensions.width(110),
                                          height: _dimensions.height(110),
                                          color: ColorTheme.background,
                                          child: Image.network(
                                            'https://cdn.shortpixel.ai/spai/w_236+q_lossy+ret_img+to_webp/https://www.armdeot.world/wp-content/uploads/2020/09/71xEdjiRKjL._AC_SL1500_.jpg',
                                            fit: BoxFit.cover,
                                            filterQuality: FilterQuality.low,
                                            color: ColorTheme.dark(34)
                                                .withOpacity(0.1),
                                            colorBlendMode: BlendMode.darken,
                                            cacheHeight:
                                                _dimensions.height(110).toInt(),
                                            cacheWidth:
                                                _dimensions.width(110).toInt(),
                                            height: _dimensions.height(110),
                                            width: _dimensions.width(110),
                                            loadingBuilder:
                                                (BuildContext context,
                                                    Widget child,
                                                    ImageChunkEvent
                                                        loadingProgress) {
                                              if (loadingProgress == null) {
                                                return child;
                                              }
                                              return Center(
                                                child:
                                                    CircularProgressIndicator(
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
                                          ),
                                        ),
                                        // image
                                        Container(
                                          width: _dimensions.width(110),
                                          height: _dimensions.height(110),
                                          color: ColorTheme.background,
                                          child: Image.network(
                                            'https://cdn.shortpixel.ai/spai/w_236+q_lossy+ret_img+to_webp/https://www.armdeot.world/wp-content/uploads/2020/10/61vlKD2UHSL._AC_SL1000_-300x300.jpg',
                                            fit: BoxFit.cover,
                                            filterQuality: FilterQuality.low,
                                            color: ColorTheme.dark(34)
                                                .withOpacity(0.1),
                                            colorBlendMode: BlendMode.darken,
                                            cacheHeight:
                                                _dimensions.height(110).toInt(),
                                            cacheWidth:
                                                _dimensions.width(110).toInt(),
                                            height: _dimensions.height(110),
                                            width: _dimensions.width(110),
                                            loadingBuilder:
                                                (BuildContext context,
                                                    Widget child,
                                                    ImageChunkEvent
                                                        loadingProgress) {
                                              if (loadingProgress == null) {
                                                return child;
                                              }
                                              return Center(
                                                child:
                                                    CircularProgressIndicator(
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
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // tracker
                            Container(
                              width: _dimensions.width(360),
                              height: _dimensions.height(300),
                              color: ColorTheme.background,
                              alignment: Alignment.center,
                              child: Text(
                                'Coming Soon',
                                style: FontStyle.normal(false),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            // history
                            Container(
                              width: _dimensions.width(360),
                              height: _dimensions.height(300),
                              color: ColorTheme.background,
                              alignment: Alignment.center,
                              child: Text(
                                'No History Found',
                                style: FontStyle.normal(false),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
              childCount: 1,
            ),
          )
        ],
      ),
    );
  }
}

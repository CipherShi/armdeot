import 'package:Armdeot/Brands.dart';
import 'package:Armdeot/Home.dart';
import 'package:Armdeot/filter.dart';
import 'package:Armdeot/productShowCase.dart';
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
import 'package:Armdeot/assests/productList.dart';

class Discover extends StatefulWidget {
  @override
  _DiscoverState createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
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
        index: 1,
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
        physics: NeverScrollableScrollPhysics(),
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
                  height: _dimensions.height(602),
                  margin: EdgeInsets.only(
                    bottom: _dimensions.topbottom(20),
                    top: _dimensions.topbottom(10),
                  ),
                  alignment: Alignment.topLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // discover title bar
                      Container(
                        height: _dimensions.height(30),
                        padding: EdgeInsets.only(
                          left: _dimensions.rightleft(12),
                          right: _dimensions.rightleft(16),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // title
                            Container(
                              width: _dimensions.width(160),
                              child: Text(
                                'Discover'.capitalizeFirstofEach(),
                                style: FontStyle.xlargeBold(false),
                              ),
                            ),
                            // filter
                            InkWell(
                              onTap: () {
                                advancedFilter(context);
                              },
                              child: Container(
                                width: _dimensions.width(100),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Icon(
                                      AppIcons.filterIcon,
                                      color: ColorTheme.fontDark,
                                      size: IconSize.small,
                                    ),
                                    SizedBox(
                                      width: _dimensions.width(5),
                                    ),
                                    Text(
                                      'Filter'.toUpperCase(),
                                      style: FontStyle.normal(false),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // tags
                      Container(
                        height: _dimensions.height(22),
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(
                          left: _dimensions.rightleft(12),
                        ),
                        margin: EdgeInsets.only(
                          top: _dimensions.topbottom(20),
                        ),
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, tagIndex) {
                            if (tags[tagIndex]['Selected']) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    tags[tagIndex]['Selected'] = false;
                                  });
                                },
                                child: Container(
                                  height: _dimensions.height(20),
                                  color: ColorTheme.button,
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(
                                    right: _dimensions.rightleft(10),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      // Sized box
                                      SizedBox(
                                        width: _dimensions.width(10),
                                      ),
                                      // icon
                                      Icon(
                                        AppIcons.closeIcon,
                                        size: IconSize.small,
                                        color: ColorTheme.background,
                                      ),
                                      // Sized box
                                      SizedBox(
                                        width: _dimensions.width(5),
                                      ),
                                      // tag
                                      Text(
                                        tags[tagIndex]['TagName'],
                                        style: FontStyle.medium(true),
                                      ),
                                      // Sized box
                                      SizedBox(
                                        width: _dimensions.width(10),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            } else {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    tags[tagIndex]['Selected'] = true;
                                  });
                                },
                                child: Container(
                                  height: _dimensions.height(20),
                                  color: ColorTheme.button.withOpacity(0.2),
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(
                                    right: _dimensions.rightleft(10),
                                  ),
                                  child: Row(
                                    children: [
                                      // Sized box
                                      SizedBox(
                                        width: _dimensions.width(10),
                                      ),
                                      // tag
                                      Text(
                                        tags[tagIndex]['TagName'],
                                        style: FontStyle.medium(false),
                                      ),
                                      // Sized box
                                      SizedBox(
                                        width: _dimensions.width(10),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }
                          },
                          itemCount: tags.length,
                        ),
                      ),
                      // products
                      Container(
                        width: _dimensions.width(360),
                        height: _dimensions.height(470),
                        padding: EdgeInsets.only(
                          left: _dimensions.rightleft(12),
                          right: _dimensions.rightleft(16),
                        ),
                        margin: EdgeInsets.only(
                          bottom: _dimensions.topbottom(
                            20,
                          ),
                          top: _dimensions.topbottom(
                            20,
                          ),
                        ),
                        alignment: Alignment.topLeft,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              width: _dimensions.width(360),
                              height: _dimensions.height(220),
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.only(
                                bottom: (index == 5)
                                    ? _dimensions.topbottom(
                                        50,
                                      )
                                    : _dimensions.topbottom(
                                        10,
                                      ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  // product
                                  Container(
                                    width: _dimensions.width(160),
                                    height: _dimensions.height(220),
                                    decoration: BoxDecoration(
                                      color: ColorTheme.container,
                                      borderRadius: BorderRadius.circular(
                                        _dimensions.radius(
                                          10,
                                        ),
                                      ),
                                      boxShadow: <BoxShadow>[
                                        BoxShadow(
                                          color: ColorTheme.containerShadow,
                                          blurRadius: _dimensions.radius(5),
                                          offset: Offset(
                                            _dimensions.radius(0.5),
                                            _dimensions.radius(4),
                                          ),
                                          spreadRadius: _dimensions.radius(1),
                                        ),
                                      ],
                                    ),
                                    child: Stack(
                                      children: <Widget>[
                                        // image placeholder
                                        Positioned(
                                          top: _dimensions.topbottom(0),
                                          left: _dimensions.rightleft(0),
                                          child: Container(
                                            width: _dimensions.width(160),
                                            height: _dimensions.height(150),
                                            decoration: BoxDecoration(
                                              color: ColorTheme.container,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                _dimensions.radius(
                                                  10,
                                                ),
                                              ),
                                            ),
                                            child: InkWell(
                                              onTap: () {
                                                productDetails(
                                                  context,
                                                  popularProducts[index][0]
                                                      ['Name'],
                                                  popularProducts[index][0]
                                                      ['Price'],
                                                  popularProducts[index][0]
                                                      ['Image'],
                                                  popularProducts[index][0]
                                                      ['Favourite'],
                                                  popularProducts[index][0]
                                                      ['Discount'],
                                                  popularProducts[index][0]
                                                      ['SupportImage'],
                                                  popularProducts[index][0]
                                                      ['Description'],
                                                );
                                              },
                                              child: Image.network(
                                                popularProducts[index][0]
                                                    ['Image'],
                                                fit: BoxFit.cover,
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
                                                filterQuality:
                                                    FilterQuality.low,
                                                color: ColorTheme.dark(34)
                                                    .withOpacity(0.2),
                                                colorBlendMode:
                                                    BlendMode.darken,
                                                width: _dimensions.width(160),
                                                height: _dimensions.height(120),
                                                cacheHeight: _dimensions
                                                    .height(120)
                                                    .toInt(),
                                                cacheWidth: _dimensions
                                                    .width(160)
                                                    .toInt(),
                                              ),
                                            ),
                                          ),
                                        ),
                                        // item details
                                        Positioned(
                                          top: _dimensions.topbottom(160),
                                          left: _dimensions.rightleft(0),
                                          child: Container(
                                            width: _dimensions.width(160),
                                            height: _dimensions.height(100),
                                            padding: EdgeInsets.only(
                                              right: _dimensions.rightleft(12),
                                              left: _dimensions.rightleft(12),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                // rating
                                                Container(
                                                  width: _dimensions.width(160),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      // stars
                                                      Container(
                                                        width: _dimensions
                                                            .width(80),
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                              AppIcons
                                                                  .ratingStarIcon,
                                                              size: IconSize
                                                                  .small,
                                                              color: ColorTheme
                                                                  .amber,
                                                            ),
                                                            Icon(
                                                              AppIcons
                                                                  .ratingStarIcon,
                                                              size: IconSize
                                                                  .small,
                                                              color: ColorTheme
                                                                  .amber,
                                                            ),
                                                            Icon(
                                                              AppIcons
                                                                  .ratingStarIcon,
                                                              size: IconSize
                                                                  .small,
                                                              color: ColorTheme
                                                                  .amber
                                                                  .withOpacity(
                                                                      0.6),
                                                            ),
                                                            Icon(
                                                              AppIcons
                                                                  .ratingStarIcon,
                                                              size: IconSize
                                                                  .small,
                                                              color: ColorTheme
                                                                  .amber
                                                                  .withOpacity(
                                                                      0.5),
                                                            ),
                                                            Icon(
                                                              AppIcons
                                                                  .ratingStarIcon,
                                                              size: IconSize
                                                                  .small,
                                                              color: ColorTheme
                                                                  .amber
                                                                  .withOpacity(
                                                                      0.4),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      // reviews
                                                      Container(
                                                        width: _dimensions
                                                            .width(50),
                                                        child: Text(
                                                          '(230)',
                                                          style:
                                                              FontStyle.small(
                                                            false,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                // sized box
                                                SizedBox(
                                                  height: _dimensions.height(5),
                                                ),
                                                // item details
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    // name
                                                    Container(
                                                      width:
                                                          _dimensions.width(68),
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                        popularProducts[index]
                                                            [0]['Name'],
                                                        style: FontStyle.medium(
                                                          false,
                                                        ),
                                                        maxLines: 2,
                                                        overflow:
                                                            TextOverflow.clip,
                                                      ),
                                                    ),
                                                    // price
                                                    Container(
                                                      width:
                                                          _dimensions.width(68),
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: Text(
                                                        popularProducts[index]
                                                            [0]['Price'],
                                                        style: FontStyle
                                                            .mediumBold(false),
                                                        maxLines: 1,
                                                        overflow:
                                                            TextOverflow.clip,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        // favourite button
                                        Positioned(
                                          top: _dimensions.topbottom(10),
                                          left: _dimensions.rightleft(120),
                                          child: Container(
                                            width: _dimensions.width(30),
                                            height: _dimensions.height(30),
                                            decoration: BoxDecoration(
                                              color: ColorTheme.background
                                                  .withOpacity(0.9),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                _dimensions.radius(30),
                                              ),
                                            ),
                                            child: TextButton(
                                              onPressed: () {
                                                setState(() {
                                                  if (popularProducts[index][0]
                                                      ['Favourite']) {
                                                    popularProducts[index][0]
                                                        ['Favourite'] = false;
                                                    _msg.show(
                                                      'Item removed from favourites',
                                                      context,
                                                    );
                                                  } else {
                                                    popularProducts[index][0]
                                                        ['Favourite'] = true;
                                                    _msg.show(
                                                      'Item added to favourites',
                                                      context,
                                                    );
                                                  }
                                                });
                                              },
                                              child: Icon(
                                                popularProducts[index][0]
                                                        ['Favourite']
                                                    ? AppIcons.favoriteIcon
                                                    : AppIcons
                                                        .favoriteBorderIcon,
                                                size: IconSize.small,
                                                color: popularProducts[index][0]
                                                        ['Favourite']
                                                    ? ColorTheme.primary
                                                    : ColorTheme.button
                                                        .withOpacity(0.8),
                                              ),
                                            ),
                                          ),
                                        ),
                                        // discount badge
                                        Positioned(
                                          top: _dimensions.topbottom(130),
                                          left: _dimensions.rightleft(40),
                                          right: _dimensions.rightleft(40),
                                          child: Container(
                                            width: _dimensions.width(80),
                                            height: _dimensions.height(15),
                                            color: (popularProducts[index][0]
                                                        ['Discount'] ==
                                                    '0')
                                                ? ColorTheme.amber
                                                    .withOpacity(0.0)
                                                : ColorTheme.amber
                                                    .withOpacity(0.8),
                                            alignment: Alignment.center,
                                            child: Text(
                                              (popularProducts[index][0]
                                                          ['Discount'] ==
                                                      '0')
                                                  ? ''
                                                  : '${popularProducts[index][0]['Discount']}% OFF',
                                              style: TextStyle(
                                                fontSize: 10,
                                                color: (popularProducts[index]
                                                            [0]['Discount'] ==
                                                        '0')
                                                    ? ColorTheme.fontLight
                                                        .withOpacity(0.0)
                                                    : ColorTheme.fontLight,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  // sized box
                                  SizedBox(
                                    width: _dimensions.width(10),
                                  ),
                                  // product
                                  Container(
                                    width: _dimensions.width(160),
                                    height: _dimensions.height(220),
                                    decoration: BoxDecoration(
                                      color: ColorTheme.container,
                                      borderRadius: BorderRadius.circular(
                                        _dimensions.radius(
                                          10,
                                        ),
                                      ),
                                      boxShadow: <BoxShadow>[
                                        BoxShadow(
                                          color: ColorTheme.containerShadow,
                                          blurRadius: _dimensions.radius(5),
                                          offset: Offset(
                                            _dimensions.radius(0.5),
                                            _dimensions.radius(4),
                                          ),
                                          spreadRadius: _dimensions.radius(1),
                                        ),
                                      ],
                                    ),
                                    child: Stack(
                                      children: <Widget>[
                                        // image placeholder
                                        Positioned(
                                          top: _dimensions.topbottom(0),
                                          left: _dimensions.rightleft(0),
                                          child: Container(
                                            width: _dimensions.width(160),
                                            height: _dimensions.height(150),
                                            decoration: BoxDecoration(
                                              color: ColorTheme.container,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                _dimensions.radius(
                                                  10,
                                                ),
                                              ),
                                            ),
                                            child: InkWell(
                                              onTap: () {
                                                productDetails(
                                                  context,
                                                  popularProducts[index][1]
                                                      ['Name'],
                                                  popularProducts[index][1]
                                                      ['Price'],
                                                  popularProducts[index][1]
                                                      ['Image'],
                                                  popularProducts[index][1]
                                                      ['Favourite'],
                                                  popularProducts[index][1]
                                                      ['Discount'],
                                                  popularProducts[index][1]
                                                      ['SupportImage'],
                                                  popularProducts[index][1]
                                                      ['Description'],
                                                );
                                              },
                                              child: Image.network(
                                                popularProducts[index][1]
                                                    ['Image'],
                                                fit: BoxFit.cover,
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
                                                filterQuality:
                                                    FilterQuality.low,
                                                color: ColorTheme.dark(34)
                                                    .withOpacity(0.2),
                                                colorBlendMode:
                                                    BlendMode.darken,
                                                width: _dimensions.width(160),
                                                height: _dimensions.height(120),
                                                cacheHeight: _dimensions
                                                    .height(120)
                                                    .toInt(),
                                                cacheWidth: _dimensions
                                                    .width(160)
                                                    .toInt(),
                                              ),
                                            ),
                                          ),
                                        ),
                                        // item details
                                        Positioned(
                                          top: _dimensions.topbottom(160),
                                          left: _dimensions.rightleft(0),
                                          child: Container(
                                            width: _dimensions.width(160),
                                            height: _dimensions.height(100),
                                            padding: EdgeInsets.only(
                                              right: _dimensions.rightleft(12),
                                              left: _dimensions.rightleft(12),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                // rating
                                                Container(
                                                  width: _dimensions.width(160),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      // stars
                                                      Container(
                                                        width: _dimensions
                                                            .width(80),
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                              AppIcons
                                                                  .ratingStarIcon,
                                                              size: IconSize
                                                                  .small,
                                                              color: ColorTheme
                                                                  .amber,
                                                            ),
                                                            Icon(
                                                              AppIcons
                                                                  .ratingStarIcon,
                                                              size: IconSize
                                                                  .small,
                                                              color: ColorTheme
                                                                  .amber,
                                                            ),
                                                            Icon(
                                                              AppIcons
                                                                  .ratingStarIcon,
                                                              size: IconSize
                                                                  .small,
                                                              color: ColorTheme
                                                                  .amber
                                                                  .withOpacity(
                                                                      0.6),
                                                            ),
                                                            Icon(
                                                              AppIcons
                                                                  .ratingStarIcon,
                                                              size: IconSize
                                                                  .small,
                                                              color: ColorTheme
                                                                  .amber
                                                                  .withOpacity(
                                                                      0.5),
                                                            ),
                                                            Icon(
                                                              AppIcons
                                                                  .ratingStarIcon,
                                                              size: IconSize
                                                                  .small,
                                                              color: ColorTheme
                                                                  .amber
                                                                  .withOpacity(
                                                                      0.4),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      // reviews
                                                      Container(
                                                        width: _dimensions
                                                            .width(50),
                                                        child: Text(
                                                          '(230)',
                                                          style:
                                                              FontStyle.small(
                                                            false,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                // sized box
                                                SizedBox(
                                                  height: _dimensions.height(5),
                                                ),
                                                // text
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    // name
                                                    Container(
                                                      width:
                                                          _dimensions.width(68),
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                        popularProducts[index]
                                                            [1]['Name'],
                                                        style: FontStyle.medium(
                                                          false,
                                                        ),
                                                        maxLines: 2,
                                                        overflow:
                                                            TextOverflow.clip,
                                                      ),
                                                    ),
                                                    // price
                                                    Container(
                                                      width:
                                                          _dimensions.width(68),
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: Text(
                                                        popularProducts[index]
                                                            [1]['Price'],
                                                        style: FontStyle
                                                            .mediumBold(
                                                          false,
                                                        ),
                                                        maxLines: 1,
                                                        overflow:
                                                            TextOverflow.clip,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        // favourite button
                                        Positioned(
                                          top: _dimensions.topbottom(10),
                                          left: _dimensions.rightleft(120),
                                          child: Container(
                                            width: _dimensions.width(30),
                                            height: _dimensions.height(30),
                                            decoration: BoxDecoration(
                                              color: ColorTheme.background
                                                  .withOpacity(0.9),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                _dimensions.radius(30),
                                              ),
                                            ),
                                            child: TextButton(
                                              onPressed: () {
                                                setState(() {
                                                  if (popularProducts[index][1]
                                                      ['Favourite']) {
                                                    popularProducts[index][1]
                                                        ['Favourite'] = false;
                                                    _msg.show(
                                                      'Item removed from favourites',
                                                      context,
                                                    );
                                                  } else {
                                                    popularProducts[index][1]
                                                        ['Favourite'] = true;
                                                    _msg.show(
                                                      'Item added to favourites',
                                                      context,
                                                    );
                                                  }
                                                });
                                              },
                                              child: Icon(
                                                popularProducts[index][1]
                                                        ['Favourite']
                                                    ? AppIcons.favoriteIcon
                                                    : AppIcons
                                                        .favoriteBorderIcon,
                                                size: IconSize.small,
                                                color: popularProducts[index][1]
                                                        ['Favourite']
                                                    ? ColorTheme.primary
                                                    : ColorTheme.button
                                                        .withOpacity(0.8),
                                              ),
                                            ),
                                          ),
                                        ),
                                        // discount badge
                                        Positioned(
                                          top: _dimensions.topbottom(130),
                                          left: _dimensions.rightleft(40),
                                          right: _dimensions.rightleft(40),
                                          child: Container(
                                            width: _dimensions.width(80),
                                            height: _dimensions.height(15),
                                            color: (popularProducts[index][1]
                                                        ['Discount'] ==
                                                    '0')
                                                ? ColorTheme.amber
                                                    .withOpacity(0.0)
                                                : ColorTheme.amber
                                                    .withOpacity(0.8),
                                            alignment: Alignment.center,
                                            child: Text(
                                              (popularProducts[index][1]
                                                          ['Discount'] ==
                                                      '0')
                                                  ? ''
                                                  : '${popularProducts[index][1]['Discount']}% OFF',
                                              style: TextStyle(
                                                fontSize: 10,
                                                color: (popularProducts[index]
                                                            [1]['Discount'] ==
                                                        '0')
                                                    ? ColorTheme.fontLight
                                                        .withOpacity(0.0)
                                                    : ColorTheme.fontLight,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          itemCount: 5,
                        ),
                      ),
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

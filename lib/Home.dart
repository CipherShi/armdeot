import 'package:Armdeot/Brands.dart';
import 'package:Armdeot/Discover.dart';
import 'package:Armdeot/productShowCase.dart';
import 'package:Armdeot/Profile.dart';
import 'package:Armdeot/assests/carouselAds.dart';
import 'package:Armdeot/assests/color.dart';
import 'package:Armdeot/assests/dimension.dart';
import 'package:Armdeot/assests/font.dart';
import 'package:Armdeot/assests/icons.dart';
import 'package:Armdeot/assests/snack.dart';
import 'package:Armdeot/assests/uiOverlay.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:Armdeot/assests/capitalization.dart';
import 'package:Armdeot/assests/productList.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // global keys
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  int _carouselIndex = 0;

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
        index: 0,
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
        slivers: <Widget>[
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
            floating: true,
            flexibleSpace: Stack(
              children: <Widget>[
                // background
                Positioned(
                  top: _dimensions.topbottom(0),
                  left: _dimensions.rightleft(0),
                  child: Container(
                    width: _dimensions.width(360),
                    height: _dimensions.height(350),
                    child: CarouselSlider.builder(
                      options: CarouselOptions(
                        viewportFraction: 1.0,
                        initialPage: 0,
                        height: _dimensions.height(350),
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 10),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        autoPlayAnimationDuration: Duration(
                          milliseconds: 1000,
                        ),
                        enableInfiniteScroll: true,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _carouselIndex = index;
                          });
                        },
                      ),
                      itemBuilder: (context, int carouseIndex) {
                        return Container(
                          width: _dimensions.width(360),
                          height: _dimensions.height(350),
                          decoration: BoxDecoration(
                            color: ColorTheme.container,
                            image: DecorationImage(
                                image: AssetImage(
                                  carouselAds[carouseIndex]['Image'],
                                ),
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(
                                  ColorTheme.dark(54),
                                  BlendMode.darken,
                                )),
                          ),
                        );
                      },
                      itemCount: 3,
                    ),
                  ),
                ),
                // collection header
                Positioned(
                  top: _dimensions.topbottom(110),
                  left: _dimensions.rightleft(12),
                  child: Text(
                    carouselAds[_carouselIndex]['Collection'].toUpperCase(),
                    style: FontStyle.medium(true),
                  ),
                ),
                // divider
                Positioned(
                  top: _dimensions.topbottom(140),
                  left: _dimensions.rightleft(12),
                  child: Container(
                    width: _dimensions.width(50),
                    child: Divider(
                      height: _dimensions.height(10),
                      thickness: 1.5,
                      color: ColorTheme.background,
                    ),
                  ),
                ),
                // collection title
                Positioned(
                  top: _dimensions.topbottom(160),
                  left: _dimensions.rightleft(12),
                  child: Container(
                    width: _dimensions.width(200),
                    child: Text(
                      carouselAds[_carouselIndex]['Title'].toUpperCase(),
                      style: FontStyle.xlargeBold(true),
                      maxLines: 2,
                    ),
                  ),
                ),
                // indicators
                Positioned(
                  top: _dimensions.topbottom(260),
                  left: _dimensions.rightleft(0),
                  child: Container(
                    width: _dimensions.width(360),
                    height: _dimensions.height(50),
                    padding: EdgeInsets.only(
                      left: _dimensions.rightleft(12),
                      right: _dimensions.rightleft(16),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // page indicator
                        Container(
                          width: _dimensions.width(160),
                          height: _dimensions.height(15),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              if (index == _carouselIndex) {
                                return Container(
                                  width: _dimensions.width(15),
                                  height: _dimensions.height(15),
                                  margin: EdgeInsets.only(
                                    right: _dimensions.rightleft(10),
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: ColorTheme.background,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                        _dimensions.radius(15),
                                      ),
                                    ),
                                  ),
                                  child: Icon(
                                    AppIcons.circleIcon,
                                    color: ColorTheme.background,
                                    size: IconSize.custom(7),
                                  ),
                                );
                              } else {
                                return Container(
                                  width: _dimensions.width(8),
                                  height: _dimensions.height(8),
                                  margin: EdgeInsets.only(
                                    right: _dimensions.rightleft(10),
                                  ),
                                  child: Icon(
                                    AppIcons.circleIcon,
                                    color: ColorTheme.background,
                                    size: IconSize.custom(5),
                                  ),
                                );
                              }
                            },
                            itemCount: carouselAds.length,
                          ),
                        ),
                        // explore button
                        Container(
                          width: _dimensions.width(100),
                          height: _dimensions.height(40),
                          decoration: BoxDecoration(
                            color: carouselAds[_carouselIndex]['Button']
                                ? ColorTheme.button.withOpacity(0.9)
                                : ColorTheme.button.withOpacity(0),
                            borderRadius: BorderRadius.circular(
                              _dimensions.radius(
                                20,
                              ),
                            ),
                          ),
                          child: carouselAds[_carouselIndex]['Button']
                              ? TextButton(
                                  onPressed: carouselAds[_carouselIndex]
                                      ['ButtonFxn'],
                                  child: Text(
                                    carouselAds[_carouselIndex]['ButtonTitle'],
                                    style: FontStyle.normal(true),
                                  ),
                                )
                              : Container(
                                  width: 0,
                                  height: 0,
                                ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            expandedHeight: _dimensions.height(300),
            toolbarHeight: _dimensions.height(50),
            collapsedHeight: _dimensions.height(50),
          ),
          // body
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  width: _dimensions.width(360),
                  height: _dimensions.height(635),
                  padding: EdgeInsets.only(
                    left: _dimensions.rightleft(12),
                    right: (index == 0)
                        ? _dimensions.rightleft(0)
                        : _dimensions.rightleft(16),
                  ),
                  margin: EdgeInsets.only(
                    top: _dimensions.topbottom(20),
                  ),
                  alignment: Alignment.topLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // featured title bar
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // title
                          Container(
                            width: _dimensions.width(160),
                            child: Text(
                              'Featured products'.capitalizeFirstofEach(),
                              style: FontStyle.large(false),
                            ),
                          ),
                          // show all
                          InkWell(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Discover(),
                                ),
                              );
                            },
                            child: Container(
                              width: _dimensions.width(100),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'Show all'.capitalize(),
                                    style: FontStyle.normal(false),
                                  ),
                                  SizedBox(
                                    width: _dimensions.width(10),
                                  ),
                                  Icon(
                                    AppIcons.arrowForwardIcon,
                                    color: ColorTheme.fontDark,
                                    size: IconSize.small,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      // sized box
                      SizedBox(
                        height: _dimensions.height(20),
                      ),
                      // featured products
                      Container(
                        width: _dimensions.width(360),
                        height: _dimensions.height(161),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (BuildContext context, int feaureIndex) {
                            return Container(
                              width: _dimensions.width(160),
                              height: _dimensions.height(200),
                              margin: EdgeInsets.only(
                                right: _dimensions.rightleft(10),
                              ),
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
                                      height: _dimensions.height(120),
                                      decoration: BoxDecoration(
                                        color: ColorTheme.container,
                                        borderRadius: BorderRadius.circular(
                                          _dimensions.radius(
                                            10,
                                          ),
                                        ),
                                      ),
                                      child: InkWell(
                                        onTap: () {
                                          productDetails(
                                            context,
                                            featuredProducts[feaureIndex]
                                                ['Name'],
                                            featuredProducts[feaureIndex]
                                                ['Price'],
                                            featuredProducts[feaureIndex]
                                                ['Image'],
                                            featuredProducts[feaureIndex]
                                                ['Favourite'],
                                            featuredProducts[feaureIndex]
                                                ['Discount'],
                                            featuredProducts[feaureIndex]
                                                ['SupportImage'],
                                            featuredProducts[feaureIndex]
                                                ['Description'],
                                          );
                                        },
                                        child: Image.network(
                                          featuredProducts[feaureIndex]
                                              ['Image'],
                                          fit: BoxFit.cover,
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
                                          color: ColorTheme.dark(34)
                                              .withOpacity(0.2),
                                          colorBlendMode: BlendMode.darken,
                                          width: _dimensions.width(160),
                                          height: _dimensions.height(120),
                                          cacheHeight:
                                              _dimensions.height(120).toInt(),
                                          cacheWidth:
                                              _dimensions.width(160).toInt(),
                                        ),
                                      ),
                                    ),
                                  ),
                                  // item details
                                  Positioned(
                                    top: _dimensions.topbottom(130),
                                    left: _dimensions.rightleft(0),
                                    child: Container(
                                      width: _dimensions.width(160),
                                      height: _dimensions.height(50),
                                      padding: EdgeInsets.only(
                                        right: _dimensions.rightleft(12),
                                        left: _dimensions.rightleft(12),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          // item name
                                          Container(
                                            width: _dimensions.width(70),
                                            height: _dimensions.height(50),
                                            child: Text(
                                              featuredProducts[feaureIndex]
                                                  ['Name'],
                                              style: FontStyle.medium(
                                                false,
                                              ),
                                              maxLines: 2,
                                              overflow: TextOverflow.clip,
                                            ),
                                          ),
                                          // sized box
                                          SizedBox(
                                            width: _dimensions.width(5),
                                          ),
                                          // item price
                                          Container(
                                            width: _dimensions.width(55),
                                            height: _dimensions.height(50),
                                            alignment: Alignment.topRight,
                                            child: Text(
                                              featuredProducts[feaureIndex]
                                                  ['Price'],
                                              style: FontStyle.mediumBold(
                                                false,
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.clip,
                                            ),
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
                                        borderRadius: BorderRadius.circular(
                                          _dimensions.radius(30),
                                        ),
                                      ),
                                      child: TextButton(
                                        onPressed: () {
                                          setState(() {
                                            if (featuredProducts[feaureIndex]
                                                ['Favourite']) {
                                              featuredProducts[feaureIndex]
                                                  ['Favourite'] = false;
                                              _msg.show(
                                                'Item removed from favourites',
                                                context,
                                              );
                                            } else {
                                              featuredProducts[feaureIndex]
                                                  ['Favourite'] = true;
                                              _msg.show(
                                                'Item added to favourites',
                                                context,
                                              );
                                            }
                                          });
                                        },
                                        child: Icon(
                                          (featuredProducts[feaureIndex]
                                                  ['Favourite'])
                                              ? AppIcons.favoriteIcon
                                              : AppIcons.favoriteBorderIcon,
                                          size: IconSize.small,
                                          color: (featuredProducts[feaureIndex]
                                                  ['Favourite'])
                                              ? ColorTheme.primary
                                              : ColorTheme.button
                                                  .withOpacity(0.8),
                                        ),
                                      ),
                                    ),
                                  ),
                                  // discount badge
                                  Positioned(
                                    top: _dimensions.topbottom(100),
                                    left: _dimensions.rightleft(40),
                                    right: _dimensions.rightleft(40),
                                    child: Container(
                                      width: _dimensions.width(80),
                                      height: _dimensions.height(15),
                                      color: (featuredProducts[feaureIndex]
                                                  ['Discount'] ==
                                              '0')
                                          ? ColorTheme.amber.withOpacity(0)
                                          : ColorTheme.amber.withOpacity(0.8),
                                      alignment: Alignment.center,
                                      child: Text(
                                        '${(featuredProducts[feaureIndex]['Discount'] == '0') ? '' : featuredProducts[feaureIndex]['Discount'].toString() + '% OFF'}',
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: ColorTheme.fontLight,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                          itemCount: featuredProducts.length,
                        ),
                      ),
                      // sized box
                      SizedBox(
                        height: _dimensions.height(20),
                      ),
                      // most popular title bar
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // title
                          Container(
                            width: _dimensions.width(160),
                            child: Text(
                              'Most popular'.capitalizeFirstofEach(),
                              style: FontStyle.large(false),
                            ),
                          ),
                          // show all
                          InkWell(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Discover(),
                                ),
                              );
                            },
                            child: Container(
                              width: _dimensions.width(100),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'Show all'.capitalize(),
                                    style: FontStyle.normal(false),
                                  ),
                                  SizedBox(
                                    width: _dimensions.width(10),
                                  ),
                                  Icon(
                                    AppIcons.arrowForwardIcon,
                                    color: ColorTheme.fontDark,
                                    size: IconSize.small,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      // most popular products
                      Container(
                        width: _dimensions.width(360),
                        height: _dimensions.height(375),
                        margin: EdgeInsets.only(
                          bottom: _dimensions.topbottom(
                            10,
                          ),
                          top: _dimensions.topbottom(
                            10,
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
                                bottom: _dimensions.topbottom(
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

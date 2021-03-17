import 'package:Armdeot/assests/color.dart';
import 'package:Armdeot/assests/dimension.dart';
import 'package:Armdeot/assests/font.dart';
import 'package:Armdeot/assests/icons.dart';
import 'package:flutter/material.dart';

Dimensions _dimensions;
Future<dynamic> productDetails(
  BuildContext context,
  String name,
  String price,
  String image,
  bool fav,
  String discount,
  List<String> supportImage,
  String description,
) {
  _dimensions = Dimensions(context: context);
  return showDialog(
    barrierColor: ColorTheme.button,
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: Material(
          color: ColorTheme.background,
          child: Container(
            width: _dimensions.width(360),
            height: _dimensions.height(725),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: BouncingScrollPhysics(),
              child: Column(
                children: <Widget>[
                  // app bar
                  Container(
                    height: _dimensions.height(50),
                    color: ColorTheme.background,
                    padding: EdgeInsets.only(
                      left: _dimensions.rightleft(10),
                      right: _dimensions.rightleft(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        // back button
                        Container(
                          width: _dimensions.width(100),
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Row(
                              children: <Widget>[
                                // icon
                                Icon(
                                  AppIcons.arrowBackIcon,
                                  size: IconSize.normal,
                                  color: ColorTheme.button,
                                ),
                                // sized box
                                SizedBox(
                                  width: _dimensions.width(10),
                                ),
                                //  text
                                Text(
                                  'Back',
                                  style: FontStyle.normal(false),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // action buttons
                        Row(
                          children: [
                            // favorite button
                            Container(
                              width: _dimensions.width(30),
                              child: TextButton(
                                onPressed: () {},
                                child: Icon(
                                  AppIcons.favoriteBorderIcon,
                                  color: ColorTheme.button,
                                  size: 25,
                                ),
                              ),
                            ),
                            // sized box
                            SizedBox(
                              width: _dimensions.width(10),
                            ),
                            // share button
                            Container(
                              width: _dimensions.width(30),
                              child: TextButton(
                                onPressed: () {},
                                child: Icon(
                                  AppIcons.shareIcon,
                                  color: ColorTheme.button,
                                  size: 25,
                                ),
                              ),
                            ),
                            // sized box
                            SizedBox(
                              width: _dimensions.width(10),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  // image slideshow
                  Container(
                    height: _dimensions.height(360),
                    width: _dimensions.width(360),
                    child: Stack(
                      children: [
                        // image placeholder
                        Positioned(
                          top: _dimensions.topbottom(0),
                          left: _dimensions.topbottom(0),
                          child: Container(
                            height: _dimensions.height(330),
                            width: _dimensions.width(360),
                            color: ColorTheme.container,
                            child: PageView.builder(
                              controller: PageController(
                                viewportFraction: 0.9,
                                initialPage: 0,
                              ),
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, int index) {
                                return Container(
                                  width: _dimensions.width(360),
                                  height: _dimensions.height(330),
                                  margin: EdgeInsets.only(
                                    right: _dimensions.rightleft(10),
                                  ),
                                  child: Image.network(
                                    supportImage[index],
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
                                    color: ColorTheme.dark(34).withOpacity(0.2),
                                    colorBlendMode: BlendMode.darken,
                                    width: _dimensions.width(360),
                                    height: _dimensions.height(330),
                                    cacheHeight:
                                        _dimensions.height(330).toInt(),
                                    cacheWidth: _dimensions.width(360).toInt(),
                                  ),
                                );
                              },
                              itemCount: supportImage.length,
                            ),
                          ),
                        ),
                        // favourite button
                        Positioned(
                          top: _dimensions.topbottom(310),
                          left: _dimensions.topbottom(280),
                          child: Container(
                            width: _dimensions.width(40),
                            height: _dimensions.height(40),
                            decoration: BoxDecoration(
                              color: ColorTheme.button,
                              borderRadius: BorderRadius.circular(
                                _dimensions.radius(40),
                              ),
                            ),
                            alignment: Alignment.center,
                            child: TextButton(
                              onPressed: () {},
                              child: Icon(
                                fav
                                    ? AppIcons.favoriteIcon
                                    : AppIcons.favoriteBorderIcon,
                                size: IconSize.small,
                                color: fav
                                    ? ColorTheme.primary
                                    : ColorTheme.background,
                              ),
                            ),
                          ),
                        ),
                        // comments button
                        Positioned(
                          top: _dimensions.topbottom(310),
                          left: _dimensions.topbottom(230),
                          child: Container(
                            width: _dimensions.width(40),
                            height: _dimensions.height(40),
                            decoration: BoxDecoration(
                              color: ColorTheme.button,
                              borderRadius: BorderRadius.circular(
                                _dimensions.radius(40),
                              ),
                            ),
                            alignment: Alignment.center,
                            child: TextButton(
                              onPressed: () {},
                              child: Icon(
                                AppIcons.commentIcon,
                                size: IconSize.small,
                                color: ColorTheme.background,
                              ),
                            ),
                          ),
                        ),
                        // rating
                        Positioned(
                          top: _dimensions.topbottom(340),
                          left: _dimensions.topbottom(12),
                          child: Row(
                            children: [
                              // title
                              Text(
                                'Rating : ',
                                style: FontStyle.normal(false),
                              ),
                              // sized box
                              SizedBox(
                                width: _dimensions.width(10),
                              ),
                              // stars
                              Row(
                                children: [
                                  Icon(
                                    AppIcons.ratingStarIcon,
                                    size: IconSize.small,
                                    color: ColorTheme.amber,
                                  ),
                                  Icon(
                                    AppIcons.ratingStarIcon,
                                    size: IconSize.small,
                                    color: ColorTheme.amber,
                                  ),
                                  Icon(
                                    AppIcons.ratingStarIcon,
                                    size: IconSize.small,
                                    color: ColorTheme.amber.withOpacity(0.6),
                                  ),
                                  Icon(
                                    AppIcons.ratingStarIcon,
                                    size: IconSize.small,
                                    color: ColorTheme.amber.withOpacity(0.5),
                                  ),
                                  Icon(
                                    AppIcons.ratingStarIcon,
                                    size: IconSize.small,
                                    color: ColorTheme.amber.withOpacity(0.4),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // item name
                  Container(
                    height: _dimensions.height(50),
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(
                      right: _dimensions.rightleft(16),
                      left: _dimensions.rightleft(12),
                    ),
                    child: Text(
                      name,
                      style: FontStyle.large(false),
                      maxLines: 2,
                    ),
                  ),
                  // description
                  Container(
                    height: _dimensions.height(120),
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(
                      right: _dimensions.rightleft(16),
                      left: _dimensions.rightleft(12),
                    ),
                    child: Text(
                      description,
                      style: FontStyle.normal(false),
                      textAlign: TextAlign.left,
                      maxLines: 8,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  // button
                  Container(
                    height: _dimensions.height(100),
                    padding: EdgeInsets.only(
                      right: _dimensions.rightleft(16),
                      left: _dimensions.rightleft(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // price
                        Container(
                          width: _dimensions.width(100),
                          height: _dimensions.height(50),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            price,
                            style: FontStyle.largeBold(false),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        // buttons
                        Row(
                          children: [
                            // add to cart
                            Container(
                              width: _dimensions.width(100),
                              height: _dimensions.height(50),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                color: ColorTheme.button,
                                width: 1,
                              )),
                              child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Add to Cart',
                                  style: FontStyle.normal(false),
                                ),
                              ),
                            ),
                            // sized box
                            SizedBox(
                              width: _dimensions.width(10),
                            ),
                            // buy now
                            Container(
                              width: _dimensions.width(100),
                              height: _dimensions.height(50),
                              decoration: BoxDecoration(
                                color: ColorTheme.amber,
                              ),
                              child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Buy Now',
                                  style: FontStyle.normal(true),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}

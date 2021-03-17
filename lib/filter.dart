import 'package:Armdeot/assests/color.dart';
import 'package:Armdeot/assests/dimension.dart';
import 'package:Armdeot/assests/icons.dart';
import 'package:flutter/material.dart';
import 'package:Armdeot/assests/font.dart';
import 'package:Armdeot/assests/capitalization.dart';

List<dynamic> filterSettings = [
  {
    'SortBy': 'alphabet',
    'FilterPrice': 'Any',
    'FilterStock': 'Yes',
  }
];

Dimensions _dimensions;
Future<dynamic> advancedFilter(BuildContext context) {
  _dimensions = Dimensions(context: context);
  return showDialog(
    barrierColor: ColorTheme.button,
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: StatefulBuilder(
          builder: (context, StateSetter setState) {
            return Material(
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
                            // save filter settings
                            Row(
                              children: [
                                // save button
                                Container(
                                  width: _dimensions.width(30),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Icon(
                                      AppIcons.saveIcon,
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
                      // sort by
                      Container(
                        height: _dimensions.height(150),
                        width: _dimensions.width(360),
                        child: Column(
                          children: [
                            // title
                            Container(
                              height: _dimensions.height(50),
                              width: _dimensions.width(360),
                              padding: EdgeInsets.only(
                                right: _dimensions.rightleft(16),
                                left: _dimensions.rightleft(12),
                              ),
                              decoration: BoxDecoration(
                                color: ColorTheme.containerShadow,
                                border: Border(
                                  bottom: BorderSide(
                                    color: ColorTheme.button.withOpacity(0.1),
                                    width: 1,
                                  ),
                                  top: BorderSide(
                                    color: ColorTheme.button.withOpacity(0.1),
                                    width: 1,
                                  ),
                                ),
                              ),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Sort By'.capitalizeFirstofEach(),
                                style: FontStyle.large(false),
                              ),
                            ),
                            // alphabetical
                            InkWell(
                              onTap: () {
                                setState(() {
                                  if (filterSettings[0]['SortBy'] == 'rating') {
                                    filterSettings[0]['SortBy'] = 'alphabet';
                                  }
                                });
                              },
                              child: Container(
                                height: _dimensions.height(50),
                                width: _dimensions.width(360),
                                color: ColorTheme.background,
                                padding: EdgeInsets.only(
                                  right: _dimensions.rightleft(0),
                                  left: _dimensions.rightleft(12),
                                ),
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    // icon
                                    Icon(
                                      AppIcons.checkIcon,
                                      size: IconSize.small,
                                      color: (filterSettings[0]['SortBy'] ==
                                              'alphabet')
                                          ? ColorTheme.button
                                          : ColorTheme.button.withOpacity(0),
                                    ),
                                    // sized box
                                    SizedBox(
                                      width: _dimensions.width(20),
                                    ),
                                    // text
                                    Container(
                                      width: _dimensions.width(302),
                                      height: _dimensions.height(50),
                                      alignment: Alignment.centerLeft,
                                      padding: EdgeInsets.only(
                                        bottom: _dimensions.topbottom(5),
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            color: ColorTheme.button
                                                .withOpacity(0.1),
                                            width: 1,
                                          ),
                                        ),
                                      ),
                                      child: Text(
                                        'alphabetical'.capitalizeFirstofEach(),
                                        style: FontStyle.normal(false),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // rating
                            InkWell(
                              onTap: () {
                                setState(() {
                                  if (filterSettings[0]['SortBy'] ==
                                      'alphabet') {
                                    filterSettings[0]['SortBy'] = 'rating';
                                  }
                                });
                              },
                              child: Container(
                                height: _dimensions.height(50),
                                width: _dimensions.width(360),
                                color: ColorTheme.background,
                                padding: EdgeInsets.only(
                                  right: _dimensions.rightleft(0),
                                  left: _dimensions.rightleft(12),
                                ),
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    // icon
                                    Icon(
                                      AppIcons.checkIcon,
                                      size: IconSize.small,
                                      color: (filterSettings[0]['SortBy'] ==
                                              'rating')
                                          ? ColorTheme.button
                                          : ColorTheme.button.withOpacity(0),
                                    ),
                                    // sized box
                                    SizedBox(
                                      width: _dimensions.width(20),
                                    ),
                                    // text
                                    Container(
                                      width: _dimensions.width(302),
                                      height: _dimensions.height(50),
                                      alignment: Alignment.centerLeft,
                                      padding: EdgeInsets.only(
                                        bottom: _dimensions.topbottom(5),
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            color: ColorTheme.button
                                                .withOpacity(0.1),
                                            width: 1,
                                          ),
                                        ),
                                      ),
                                      child: Text(
                                        'rating'.capitalizeFirstofEach(),
                                        style: FontStyle.normal(false),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // filter
                      Container(
                        height: _dimensions.height(300),
                        width: _dimensions.width(360),
                        child: Column(
                          children: [
                            // title
                            Container(
                              height: _dimensions.height(50),
                              width: _dimensions.width(360),
                              padding: EdgeInsets.only(
                                right: _dimensions.rightleft(16),
                                left: _dimensions.rightleft(12),
                              ),
                              decoration: BoxDecoration(
                                color: ColorTheme.containerShadow,
                                border: Border(
                                  bottom: BorderSide(
                                    color: ColorTheme.button.withOpacity(0.1),
                                    width: 1,
                                  ),
                                  top: BorderSide(
                                    color: ColorTheme.button.withOpacity(0.1),
                                    width: 1,
                                  ),
                                ),
                              ),
                              alignment: Alignment.centerLeft,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  // title
                                  Text(
                                    'Filter'.capitalizeFirstofEach(),
                                    style: FontStyle.large(false),
                                  ),
                                  // clear all
                                  Container(
                                    width: _dimensions.width(50),
                                    height: _dimensions.height(50),
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Clear all'.toUpperCase(),
                                      style: FontStyle.medium(false),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // price
                            Container(
                              height: _dimensions.height(120),
                              width: _dimensions.width(360),
                              padding: EdgeInsets.only(
                                right: _dimensions.rightleft(0),
                                left: _dimensions.rightleft(12),
                              ),
                              decoration: BoxDecoration(
                                color: ColorTheme.background,
                                border: Border(
                                  bottom: BorderSide(
                                    color: ColorTheme.button.withOpacity(0.1),
                                    width: 1,
                                  ),
                                ),
                              ),
                              alignment: Alignment.centerLeft,
                              child: Column(
                                children: [
                                  // title
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      // icon
                                      Icon(
                                        AppIcons.priceIcon,
                                        size: IconSize.small,
                                        color: ColorTheme.button,
                                      ),
                                      // sized box
                                      SizedBox(
                                        width: _dimensions.width(20),
                                      ),
                                      // text
                                      Container(
                                        width: _dimensions.width(302),
                                        height: _dimensions.height(50),
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Price'.capitalizeFirstofEach(),
                                          style: FontStyle.normal(false),
                                        ),
                                      ),
                                    ],
                                  ),
                                  // prices
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      // any
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            if (filterSettings[0]
                                                    ['FilterPrice'] !=
                                                'Any') {
                                              filterSettings[0]['FilterPrice'] =
                                                  'Any';
                                            }
                                          });
                                        },
                                        child: Container(
                                          width: _dimensions.width(60),
                                          height: _dimensions.height(50),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: (filterSettings[0]
                                                        ['FilterPrice'] ==
                                                    'Any')
                                                ? ColorTheme.button
                                                    .withOpacity(0.4)
                                                : ColorTheme.button
                                                    .withOpacity(0),
                                            border: Border.all(
                                              color: (filterSettings[0]
                                                          ['FilterPrice'] ==
                                                      'Any')
                                                  ? ColorTheme.button
                                                      .withOpacity(0.4)
                                                  : ColorTheme.button
                                                      .withOpacity(0.5),
                                              width: 1,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              _dimensions.radius(5),
                                            ),
                                          ),
                                          child: Text(
                                            'Any',
                                            style: (filterSettings[0]
                                                        ['FilterPrice'] ==
                                                    'Any')
                                                ? FontStyle.normal(true)
                                                : FontStyle.normal(false),
                                          ),
                                        ),
                                      ),
                                      // $$
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            if (filterSettings[0]
                                                    ['FilterPrice'] !=
                                                '\$\$') {
                                              filterSettings[0]['FilterPrice'] =
                                                  '\$\$';
                                            }
                                          });
                                        },
                                        child: Container(
                                          width: _dimensions.width(60),
                                          height: _dimensions.height(50),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: (filterSettings[0]
                                                        ['FilterPrice'] ==
                                                    '\$\$')
                                                ? ColorTheme.button
                                                    .withOpacity(0.4)
                                                : ColorTheme.button
                                                    .withOpacity(0),
                                            border: Border.all(
                                              color: (filterSettings[0]
                                                          ['FilterPrice'] ==
                                                      '\$\$')
                                                  ? ColorTheme.button
                                                      .withOpacity(0.4)
                                                  : ColorTheme.button
                                                      .withOpacity(0.5),
                                              width: 1,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              _dimensions.radius(5),
                                            ),
                                          ),
                                          child: Text(
                                            '\$\$',
                                            style: (filterSettings[0]
                                                        ['FilterPrice'] ==
                                                    '\$\$')
                                                ? FontStyle.normal(true)
                                                : FontStyle.normal(false),
                                          ),
                                        ),
                                      ),
                                      // $$$
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            if (filterSettings[0]
                                                    ['FilterPrice'] !=
                                                '\$\$\$') {
                                              filterSettings[0]['FilterPrice'] =
                                                  '\$\$\$';
                                            }
                                          });
                                        },
                                        child: Container(
                                          width: _dimensions.width(60),
                                          height: _dimensions.height(50),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: (filterSettings[0]
                                                        ['FilterPrice'] ==
                                                    '\$\$\$')
                                                ? ColorTheme.button
                                                    .withOpacity(0.4)
                                                : ColorTheme.button
                                                    .withOpacity(0),
                                            border: Border.all(
                                              color: (filterSettings[0]
                                                          ['FilterPrice'] ==
                                                      '\$\$\$')
                                                  ? ColorTheme.button
                                                      .withOpacity(0.4)
                                                  : ColorTheme.button
                                                      .withOpacity(0.5),
                                              width: 1,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              _dimensions.radius(5),
                                            ),
                                          ),
                                          child: Text(
                                            '\$\$\$',
                                            style: (filterSettings[0]
                                                        ['FilterPrice'] ==
                                                    '\$\$\$')
                                                ? FontStyle.normal(true)
                                                : FontStyle.normal(false),
                                          ),
                                        ),
                                      ),
                                      // $$$$
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            if (filterSettings[0]
                                                    ['FilterPrice'] !=
                                                '\$\$\$\$') {
                                              filterSettings[0]['FilterPrice'] =
                                                  '\$\$\$\$';
                                            }
                                          });
                                        },
                                        child: Container(
                                          width: _dimensions.width(60),
                                          height: _dimensions.height(50),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: (filterSettings[0]
                                                        ['FilterPrice'] ==
                                                    '\$\$\$\$')
                                                ? ColorTheme.button
                                                    .withOpacity(0.4)
                                                : ColorTheme.button
                                                    .withOpacity(0),
                                            border: Border.all(
                                              color: (filterSettings[0]
                                                          ['FilterPrice'] ==
                                                      '\$\$\$\$')
                                                  ? ColorTheme.button
                                                      .withOpacity(0.4)
                                                  : ColorTheme.button
                                                      .withOpacity(0.5),
                                              width: 1,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              _dimensions.radius(5),
                                            ),
                                          ),
                                          child: Text(
                                            '\$\$\$\$',
                                            style: (filterSettings[0]
                                                        ['FilterPrice'] ==
                                                    '\$\$\$\$')
                                                ? FontStyle.normal(true)
                                                : FontStyle.normal(false),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      );
    },
  );
}

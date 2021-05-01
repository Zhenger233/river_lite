import 'dart:math';

import 'package:flutter/material.dart';
import 'package:offer_show/asset/color.dart';
import 'package:offer_show/asset/size.dart';
import 'package:offer_show/components/occu.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class OSScaffold extends StatefulWidget {
  Function onRefresh;
  Function onLoad;
  Widget fixedBottom;
  Widget header;
  Widget body;
  double columnHeight;
  String headTxt;
  Color bodyColor;
  var headerHeight;
  OSScaffold({
    Key key,
    this.onRefresh,
    this.onLoad,
    this.header,
    this.fixedBottom,
    this.headTxt,
    this.body,
    this.bodyColor,
    this.columnHeight,
    this.headerHeight,
  }) : super(key: key);

  @override
  _OSScaffoldState createState() => _OSScaffoldState();
}

class _OSScaffoldState extends State<OSScaffold> {
  @override
  Widget build(BuildContext context) {
    EdgeInsets padding = MediaQuery.of(context).padding;
    double top = max(padding.top, EdgeInsets.zero.top);
    return Material(
      child: Column(
        children: [
          Container(
            height: widget.columnHeight ?? os_height,
            child: Stack(
              children: [
                Stack(
                  children: [
                    Positioned(
                      child: Container(
                        padding: new EdgeInsets.only(top: top),
                        height: 300,
                        width: os_width * 100,
                        decoration: BoxDecoration(
                          color: os_color,
                        ),
                      ),
                    ),
                    Positioned(
                      child: Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          color: os_black_opa_opa,
                          borderRadius: BorderRadius.circular(10000),
                        ),
                      ),
                      left: -50,
                      top: 60,
                    ),
                    Positioned(
                      child: Container(
                        width: 300,
                        height: 300,
                        decoration: BoxDecoration(
                          color: os_black_opa,
                          borderRadius: BorderRadius.circular(10000),
                        ),
                      ),
                      right: -150,
                      top: -100,
                    ),
                    Positioned(
                      //页面首部
                      top: top,
                      child: Container(
                        width: os_width,
                        height: widget.headerHeight ?? 60,
                        child: widget.header ??
                            HeadBackBanner(
                              headTxt: widget.headTxt,
                            ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  child: Container(
                    //页面主体部分
                    child: EasyRefresh(
                        header: MaterialHeader(),
                        footer: BallPulseFooter(),
                        onRefresh: widget.onRefresh,
                        onLoad: widget.onLoad,
                        child: ListView(
                          children: [
                            Container(
                              child: widget.body ??
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("data"),
                                      ),
                                      Text("data"),
                                      Text("data"),
                                      Text("data"),
                                      Text("data"),
                                      Text("data"),
                                      Text("data"),
                                      Text("data"),
                                      Text("data"),
                                      Text("data"),
                                    ],
                                  ),
                            ),
                          ],
                        )),
                    width: os_width,
                    height: os_height - (widget.headerHeight ?? 60) - top,
                    padding: new EdgeInsets.only(top: 5),
                    decoration: BoxDecoration(
                      color: widget.bodyColor ?? os_white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  top: top + (widget.headerHeight ?? 60),
                ),
                (widget.fixedBottom == null
                    ? Container()
                    : Positioned(
                        child: Container(
                          width: os_width,
                          height: 100,
                          padding: new EdgeInsets.only(bottom: 14),
                          child: widget.fixedBottom ??
                              Center(child: Text("底部导航栏")),
                          decoration: BoxDecoration(
                            color: os_white,
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x22000000),
                                blurRadius: 20.0,
                              ),
                            ],
                          ),
                        ),
                        bottom: 0,
                      ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BodyRefresher extends StatefulWidget {
  @override
  _BodyRefresherState createState() => _BodyRefresherState();
}

class _BodyRefresherState extends State<BodyRefresher> {
  @override
  Widget build(BuildContext context) {
    EdgeInsets padding = MediaQuery.of(context).padding;
    double top = max(padding.top, EdgeInsets.zero.top);
    return EasyRefresh(
        header: MaterialHeader(),
        onRefresh: () async {
          return Future.delayed(Duration(seconds: 3), () {
            print('延迟任务');
          });
        },
        child: ListView(
          children: [
            Container(
              padding: new EdgeInsets.all(os_width * 0.025),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("data"),
                ],
              ),
            ),
          ],
        ));
  }
}

class HeadBackBanner extends StatefulWidget {
  String headTxt;
  HeadBackBanner({Key key, this.headTxt}) : super(key: key);
  @override
  _HeadBackBannerState createState() => _HeadBackBannerState();
}

class _HeadBackBannerState extends State<HeadBackBanner> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: new EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: os_white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Text(
            widget.headTxt ?? "校招薪资爆料",
            style: TextStyle(
              color: os_white,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}

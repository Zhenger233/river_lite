import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:offer_show/asset/color.dart';
import 'package:offer_show/asset/size.dart';
import 'package:offer_show/asset/svg.dart';
import 'package:offer_show/components/banner.dart';
import 'package:offer_show/components/hot_btn.dart';
import 'package:offer_show/components/niw.dart';
import 'package:offer_show/components/nomore.dart';
import 'package:offer_show/components/topic.dart';
import 'package:offer_show/components/totop.dart';
import 'package:offer_show/page/topic/topic_detail.dart';
import 'package:offer_show/util/interface.dart';
import 'package:offer_show/util/provider.dart';
import 'package:offer_show/util/storage.dart';
import 'package:provider/provider.dart';

class HomeNew extends StatefulWidget {
  @override
  _HomeNewState createState() => _HomeNewState();
}

class _HomeNewState extends State<HomeNew> with AutomaticKeepAliveClientMixin {
  ScrollController _scrollController;
  var data = [];
  var loading = false;
  var load_done = false;
  bool showBackToTop = false;
  bool vibrate = false;

  @override
  void initState() {
    super.initState();
    _getStorageData();
    _getInitData();
    _scrollController = Provider.of<HomeRefrshProvider>(context, listen: false)
        .homeScrollController;
    _scrollController.addListener(() {
      if (_scrollController.position.pixels < -100) {
        if (!vibrate) {
          vibrate = true; //不允许再震动
          Vibrate.feedback(FeedbackType.impact);
        }
      }
      if (_scrollController.position.pixels >= 0) {
        vibrate = false; //允许震动
      }
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // print("触底");
        _getData();
      }
      if (_scrollController.position.pixels > 1000 && !showBackToTop) {
        setState(() {
          showBackToTop = true;
        });
      }
      if (_scrollController.position.pixels < 1000 && showBackToTop) {
        setState(() {
          showBackToTop = false;
        });
      }
    });
  }

  _getInitData() async {
    var tmp = await Api()
        .forum_topiclist({"page": 1, "pageSize": 20, "sortby": "new"});
    if (tmp != null && tmp["list"] != null && tmp["list"].length != 0) {
      data = tmp["list"];
    }
    if (data != null && data.length != 0)
      setStorage(key: "home_new", value: jsonEncode(data));
    load_done = false;
    setState(() {});
  }

  _getStorageData() async {
    var tmp = await getStorage(key: "home_new", initData: "[]");
    setState(() {
      data = jsonDecode(tmp);
    });
  }

  _getData() async {
    if (loading || load_done) return;
    loading = true;
    int pageSize = 20;
    var tmp = await Api().forum_topiclist({
      "page": (data.length / pageSize + 1).toInt(),
      "pageSize": pageSize,
      "sortby": "new"
    });
    if (tmp != null &&
        tmp["rs"] != 0 &&
        tmp["list"] != null &&
        tmp["list"].length != 0) {
      data.addAll(tmp["list"]);
      setStorage(key: "home_new_reply", value: jsonEncode(data));
    }
    load_done = tmp == null || ((tmp["list"] ?? []).length < pageSize);
    loading = false;
    setState(() {});
  }

  Widget _buildComponents() {
    List<Widget> t = [];
    t.add(ToSearch());
    t.add(ImgBanner());
    t.add(Container(height: 10));
    t.add(HomeBtn());
    if (data != null && data.length != 0) {
      for (var i in data) {
        t.add(Topic(data: i));
      }
    }
    if (data.length == 0) {
      t.add(Container(
        height: MediaQuery.of(context).size.height - 100,
      ));
    }
    t.add(
      load_done || data.length == 0
          ? NoMore()
          : BottomLoading(
              color: Colors.transparent,
              txt: "加载中…",
            ),
    );
    t.add(Padding(
      padding: EdgeInsets.all(load_done || data.length == 0 ? 7.5 : 0),
    ));
    return ListView(
      physics: BouncingScrollPhysics(),
      controller: _scrollController,
      children: t,
    );
  }

  @override
  Widget build(BuildContext context) {
    HomeRefrshProvider provider = Provider.of<HomeRefrshProvider>(context);
    return Scaffold(
      backgroundColor: os_back,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/new", arguments: {});
        },
        child: Icon(Icons.add),
      ),
      body: RefreshIndicator(
        color: os_color,
        key: provider.homeRefreshIndicator,
        onRefresh: () async {
          var data = await _getInitData();
          vibrate = false;
          return data;
        },
        child: _buildComponents(),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class ToSearch extends StatefulWidget {
  const ToSearch({Key key}) : super(key: key);

  @override
  State<ToSearch> createState() => _ToSearchState();
}

class _ToSearchState extends State<ToSearch> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: os_edge, right: os_edge, bottom: 10),
      child: myInkWell(
        radius: 10,
        tap: () {
          Navigator.pushNamed(context, "/search");
        },
        widget: Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "搜一搜",
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 171, 171, 171),
                ),
              ),
              os_svg(
                path: "lib/img/search_grey.svg",
                width: 20,
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

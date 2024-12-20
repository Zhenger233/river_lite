import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:offer_show/asset/bigScreen.dart';
import 'package:offer_show/asset/color.dart';
import 'package:offer_show/asset/mouse_speed.dart';
import 'package:offer_show/asset/refreshIndicator.dart';
import 'package:offer_show/asset/size.dart';
import 'package:offer_show/asset/svg.dart';
import 'package:offer_show/asset/vibrate.dart';
import 'package:offer_show/components/occu_loading.dart';
import 'package:offer_show/components/topic.dart';
import 'package:offer_show/components/totop.dart';
import 'package:offer_show/util/interface.dart';
import 'package:offer_show/util/provider.dart';
import 'package:offer_show/util/storage.dart';
import 'package:provider/provider.dart';

class HotNoScaffold extends StatefulWidget {
  @override
  _HotNoScaffoldState createState() => _HotNoScaffoldState();
}

class _HotNoScaffoldState extends State<HotNoScaffold>
    with AutomaticKeepAliveClientMixin {
  ScrollController _scrollController = new ScrollController();
  List<dynamic>? list = [];
  bool vibrate = false;
  GlobalKey<RefreshIndicatorState> _indicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    _getTmpData();
    _getData();
    _scrollController =
        Provider.of<HomeRefrshProvider>(context, listen: false).hot;
    _scrollController.addListener(() {
      if (_scrollController.position.pixels < -100) {
        if (!vibrate) {
          vibrate = true; //不允许再震动
          XSVibrate().impact();
        }
      }
      if (_scrollController.position.pixels >= 0) {
        vibrate = false; //允许震动
      }
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // print("滑动到底部");
      }
    });
    speedUp(_scrollController);
  }

  _getTmpData() async {
    var tmp_data = await getStorage(key: "home_hot_lists", initData: "[]");
    list = jsonDecode(tmp_data);
    setState(() {});
  }

  _getData() async {
    var tmp = await Api().portal_newslist();
    if (tmp != null &&
        tmp["rs"] != 0 &&
        tmp["list"] != null &&
        tmp["list"].length != 0) {
      await setStorage(key: "home_hot_lists", value: jsonEncode(tmp["list"]));
      list = tmp["list"];
    }
    setState(() {});
  }

  List<Widget> _buildComponents() {
    List<Widget> t = [];
    for (var i = 0; i < list!.length; i++) {
      t.add(
        Stack(
          children: [
            Topic(
              isLeftNaviUI: isDesktop() && true,
              data: list![i],
              top: 0,
              removeMargin: true,
            ),
            Positioned(
              right: os_edge + 40,
              top: 0,
              child: Opacity(
                opacity: 0.7,
                child: os_svg(
                  width: 25,
                  height: 25 * 1.1,
                  path: "lib/page/hot/img/${i + 1}.svg",
                ),
              ),
            ),
          ],
        ),
      );
    }
    if (list!.length == 0) {
      t.add(Container(
        height: MediaQuery.of(context).size.height - 100,
      ));
    }
    return t;
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Container(
      color:
          Provider.of<ColorProvider>(context).isDark ? os_dark_back : os_back,
      child: BackToTop(
        show: false,
        controller: _scrollController,
        refresh: () {
          _indicatorKey.currentState!.show();
        },
        child: getMyRrefreshIndicator(
          context: context,
          color: os_color,
          key: _indicatorKey,
          onRefresh: () async {
            var data = await _getData();
            return data;
          },
          child: list!.length == 0
              ? OccuLoading()
              : MasonryGridView.count(
                  physics: AlwaysScrollableScrollPhysics(),
                  controller: _scrollController,
                  itemCount: _buildComponents().length,
                  padding: EdgeInsets.all(os_edge),
                  crossAxisCount: w > 800 ? 2 : 1,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return _buildComponents()[index];
                  },
                ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

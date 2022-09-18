/*
 * @Author: xusun000「xusun000@foxmail.com」 
 * @Date: 2022-08-03 10:38:17 
 * @Last Modified by:   xusun000 
 * @Last Modified time: 2022-08-03 10:38:17 
 */
import 'dart:io';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:offer_show/asset/color.dart';
import 'package:offer_show/router/router.dart';
import 'package:offer_show/util/provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  if (Platform.isAndroid) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Color.fromRGBO(0, 0, 0, 0)),
    );
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }
  if (Platform.isWindows) {
    WidgetsFlutterBinding.ensureInitialized();
    await windowManager.ensureInitialized();
    WindowOptions windowOptions = WindowOptions(
      size: Size(1080, 720),
      center: true,
      alwaysOnTop: false,
      backgroundColor: Colors.transparent,
      skipTaskbar: false,
      titleBarStyle: TitleBarStyle.hidden,
    );
    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
    });
  }
  runApp(MyApp());
  // if (Platform.isWindows) {
  //   doWhenWindowReady(() {
  //     final win = appWindow;
  //     const initialSize = Size(1080, 720);
  //     win.minSize = initialSize;
  //     win.size = initialSize;
  //     win.alignment = Alignment.center;
  //     win.title = 'Hello World';
  //     win.show();
  //   });
  // }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      SystemUiOverlayStyle systemUiOverlayStyle =
          SystemUiOverlayStyle(statusBarColor: Colors.transparent);
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ColorProvider()),
        ChangeNotifierProvider(create: (context) => AdShowProvider()),
        ChangeNotifierProvider(create: (context) => UserInfoProvider()),
        ChangeNotifierProvider(create: (context) => TabShowProvider()),
        ChangeNotifierProvider(create: (context) => HomeRefrshProvider()),
        ChangeNotifierProvider(create: (context) => MsgProvider()),
        ChangeNotifierProvider(create: (context) => BlackProvider()),
        ChangeNotifierProvider(create: (context) => ShowPicProvider()),
      ],
      child: Sizer(
        builder: (context, orientation, deviceType) => MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: "/",
          theme: ThemeData(
            fontFamily: '微软雅黑',
            appBarTheme: AppBarTheme(
              surfaceTintColor: Provider.of<ColorProvider>(context).isDark
                  ? os_dark_back
                  : os_back,
            ),
            primaryColor: os_color,
            useMaterial3: true,
            // fontFamily: "MiSans",
          ),
          onGenerateRoute: (settings) {
            final String routersname = settings.name;
            final Function cotrollerFn = routers[routersname];
            //判断访问不存在的路由地址
            if (cotrollerFn == null) {
              return CupertinoPageRoute(
                builder: (context) => routers['/404'](),
              );
            }
            if (settings.arguments == null) {
              return CupertinoPageRoute(
                builder: (context) => cotrollerFn(),
              );
            } else {
              return CupertinoPageRoute(
                builder: (context) => cotrollerFn(settings.arguments),
              );
            }
          },
          onUnknownRoute: (setting) {
            return CupertinoPageRoute(
              builder: (context) => routers["/404"](),
            );
          },
        ),
      ),
    );
  }
}

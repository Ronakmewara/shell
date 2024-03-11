import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:shellroute/pages/main_page/main_page.dart';
import 'package:shellroute/pages/normalroute/aPage.dart';
import 'package:shellroute/pages/normalroute/bPage.dart';
import 'package:shellroute/pages/normalroute/cPage.dart';
import 'package:shellroute/pages/normalroute/normal_route.dart';

import 'package:shellroute/pages/shellroute/profile.dart';
import 'package:shellroute/pages/shellroute/settings.dart';

import '../bottombar/bottomBar.dart';
import '../pages/shellroute/home.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

class MyRouter {
  GoRouter router = GoRouter(
      observers: [SentryNavigatorObserver()],
      navigatorKey: _rootNavigatorKey,
      routes: [
        GoRoute(name: 'HomePage',path: '/', builder: (context, state) => const MainPage()),
        GoRoute(
            name: 'normalRoutePage',
            path: '/normalRoute',
            builder: (context, state) => const NormalRoute()),
        GoRoute(name: 'PageA' ,path: '/pageA', builder: (context, state) => const APage()),
        GoRoute( name: 'PageB', path: '/pageB', builder: (context, state) => const BPage()),
        GoRoute( name: 'PageC', path: '/pageC', builder: (context, state) => const CPage()),
        ShellRoute(
            navigatorKey: _shellNavigatorKey,
            builder: (context, state, child) => BottomBarScaffold(
                  child: child,
                ),
            routes: [
              GoRoute(
                name: 'bottomTabBarScaffold',
                  path: '/home',
                  builder: (context, state) => const HomePage(),
                  parentNavigatorKey: _shellNavigatorKey),
              GoRoute(
                name: 'profilePage',
                  path: '/profile',
                  builder: (context, state) => const ProfilePage(),
                  parentNavigatorKey: _shellNavigatorKey),
              GoRoute(
                name: 'settingPage',
                  path: '/setting',
                  builder: (context, state) => const SettingPage(),
                  parentNavigatorKey: _shellNavigatorKey),
            ])
      ]);
}

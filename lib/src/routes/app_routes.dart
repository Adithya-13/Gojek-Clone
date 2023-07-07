import 'package:flutter/material.dart';
import 'package:flutter_google_places_sdk/flutter_google_places_sdk.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gojek_clone/src/constants/constants.dart';
import 'package:gojek_clone/src/core/core.dart';
import 'package:gojek_clone/src/routes/routes.dart';

enum Routes {
  home,
  destination,
  map,
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final goRouterProvider = Provider<GoRouter>(
  (ref) {
    return GoRouter(
      navigatorKey: navigatorKey,
      debugLogDiagnostics: true,
      initialLocation: '/home',
      routerNeglect: true,
      routes: [
        GoRoute(
          path: '/home',
          name: Routes.home.name,
          builder: (context, state) => const HomePage(),
          routes: [
            GoRoute(
              path: 'destination',
              name: Routes.destination.name,
              builder: (context, state) => const DestinationPage(),
            ),
            GoRoute(
              path: 'map',
              name: Routes.map.name,
              builder: (context, state) {
                final datas = (state.extra as Extra).datas;
                final pickup = datas[ExtrasKey.pickup] as Place;
                final destination = datas[ExtrasKey.destination] as Place;
                return MapPage(
                  pickup: pickup,
                  destination: destination,
                );
              },
            ),
          ],
        ),
      ],
      errorBuilder: (context, state) => ErrorPage(
        error: state.error,
      ),
    );
  },
);

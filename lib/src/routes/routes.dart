import 'dart:io';

import 'package:go_router/go_router.dart';
import 'package:login_flutter/src/customWidgets/custom_widgets.dart';
import 'package:login_flutter/src/models/peces_model.dart';
import 'package:login_flutter/src/pages/carousel_details.dart';
import 'package:login_flutter/src/pages/home_page.dart';
import 'package:login_flutter/src/pages/login_page.dart';
import 'package:login_flutter/src/pages/registro_page.dart';
import 'package:flutter/material.dart';
import 'package:login_flutter/src/subViews/album_view.dart';
import 'package:login_flutter/src/subViews/details_view.dart';
import 'package:login_flutter/src/subViews/explorer_view.dart';
import 'package:login_flutter/src/subViews/instructions_view.dart';
import 'package:login_flutter/src/subViews/recompensas_view.dart';
import 'package:login_flutter/src/views/camera_view.dart';
import 'package:login_flutter/src/views/home_view.dart';
import 'package:login_flutter/src/views/map_view.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');


// GoRouter configuration
final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: "/",
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
      routes: [
        GoRoute(
          path: 'login',
          builder: (context, state) => LoginPage(),
          ),
        GoRoute(
          path: "registro",
          builder: (context, state) => const RegistroPage(),
          ),
          ShellRoute(
            navigatorKey: _shellNavigatorKey,
            builder: (BuildContext context, GoRouterState state, Widget child) {
          return ScaffoldWithNavBar(child: child);
        },
            routes: [
              GoRoute(
              path: 'home_view',
              builder: (BuildContext context, GoRouterState state) {
                return const HomeView();
              },
              routes: [
                GoRoute(
                  path: "carouselDetails",
                  builder: (BuildContext context, GoRouterState state) {
                      Map<String,dynamic> args =  state.extra as Map<String,dynamic>;
                      Pez carouselImage = args["carouselImage"] as Pez;
                      return CarouselDetails(carouselImages: carouselImage);
                    }),
                GoRoute(
                  path: "explorer",
                  builder: (BuildContext context, GoRouterState state) {
                  return const ExplorerView();
                  },
                  routes: [GoRoute(
                    path: "recompensas",
                    builder: (BuildContext context, GoRouterState state) {
                      Map<String,dynamic> args =  state.extra as Map<String,dynamic>;
                      int points = args["points"] as int;
                      return RecompensasView(points: points,);
                    }
                  )]
                  ),
                GoRoute(
                  path: "album",
                  builder: (BuildContext context, GoRouterState state) {
                  return const AlbumView();
                  }
                  ),
                GoRoute(
                  path: "instructions",
                  builder: (BuildContext context, GoRouterState state) {
                  return const InstructionsView();
                  }
                  ),
              ]
            ),
            GoRoute(
              path: 'camera_view',
              builder: (BuildContext context, GoRouterState state) {
                return const CameraView();
              },
              routes: [
                GoRoute(
                  path: "details",
                  builder: (BuildContext context, GoRouterState state) {
                    Map<String,dynamic> args =  state.extra as Map<String,dynamic>;
                    File image = args["image"] as File; 
                    String fishName = args["name"] as String; 
                    return DetailsView(image: image, fishName: fishName);
                  },
                  )
              ],
            ),
            GoRoute(
              path: 'map_view',
              builder: (BuildContext context, GoRouterState state) {
                return const MapaView();
              },
            ),
            ]
          ),
      ],
    ),
  ],
);
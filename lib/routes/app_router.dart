import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:measurement_book_ui/pages/CreateScreen.dart';
import 'package:measurement_book_ui/pages/ErrorCreateScreen.dart';
import 'package:measurement_book_ui/pages/HomeScreen.dart';
import 'package:measurement_book_ui/pages/MeasureDetailScreen.dart';
import 'package:measurement_book_ui/pages/PreviewPage.dart';
import 'package:measurement_book_ui/pages/SuccessfulCreateScreen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        /// routes go here
        AutoRoute(page: HomeRoute.page, initial: true),
        AutoRoute(
          page: CreateRoute.page,
        ),
        AutoRoute(page: MeasureDetailRoute.page),
        AutoRoute(page: SuccessfulCreateRoute.page),
        AutoRoute(page: ErrorCreateRoute.page),
        AutoRoute(page: PreviewRoute.page)
      ];
}

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    CreateRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CreateScreen(),
      );
    },
    ErrorCreateRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ErrorCreateScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    MeasureDetailRoute.name: (routeData) {
      final args = routeData.argsAs<MeasureDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MeasureDetailScreen(
          key: args.key,
          formData: args.formData,
        ),
      );
    },
    PreviewRoute.name: (routeData) {
      final args = routeData.argsAs<PreviewRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PreviewScreen(
          key: args.key,
          formData: args.formData,
        ),
      );
    },
    SuccessfulCreateRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SuccessfulCreateScreen(),
      );
    },
  };
}

/// generated route for
/// [CreateScreen]
class CreateRoute extends PageRouteInfo<void> {
  const CreateRoute({List<PageRouteInfo>? children})
      : super(
          CreateRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ErrorCreateScreen]
class ErrorCreateRoute extends PageRouteInfo<void> {
  const ErrorCreateRoute({List<PageRouteInfo>? children})
      : super(
          ErrorCreateRoute.name,
          initialChildren: children,
        );

  static const String name = 'ErrorCreateRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MeasureDetailScreen]
class MeasureDetailRoute extends PageRouteInfo<MeasureDetailRouteArgs> {
  MeasureDetailRoute({
    Key? key,
    required Map<String, dynamic>? formData,
    List<PageRouteInfo>? children,
  }) : super(
          MeasureDetailRoute.name,
          args: MeasureDetailRouteArgs(
            key: key,
            formData: formData,
          ),
          initialChildren: children,
        );

  static const String name = 'MeasureDetailRoute';

  static const PageInfo<MeasureDetailRouteArgs> page =
      PageInfo<MeasureDetailRouteArgs>(name);
}

class MeasureDetailRouteArgs {
  const MeasureDetailRouteArgs({
    this.key,
    required this.formData,
  });

  final Key? key;

  final Map<String, dynamic>? formData;

  @override
  String toString() {
    return 'MeasureDetailRouteArgs{key: $key, formData: $formData}';
  }
}

/// generated route for
/// [PreviewScreen]
class PreviewRoute extends PageRouteInfo<PreviewRouteArgs> {
  PreviewRoute({
    Key? key,
    required Map<String, dynamic>? formData,
    List<PageRouteInfo>? children,
  }) : super(
          PreviewRoute.name,
          args: PreviewRouteArgs(
            key: key,
            formData: formData,
          ),
          initialChildren: children,
        );

  static const String name = 'PreviewRoute';

  static const PageInfo<PreviewRouteArgs> page =
      PageInfo<PreviewRouteArgs>(name);
}

class PreviewRouteArgs {
  const PreviewRouteArgs({
    this.key,
    required this.formData,
  });

  final Key? key;

  final Map<String, dynamic>? formData;

  @override
  String toString() {
    return 'PreviewRouteArgs{key: $key, formData: $formData}';
  }
}

/// generated route for
/// [SuccessfulCreateScreen]
class SuccessfulCreateRoute extends PageRouteInfo<void> {
  const SuccessfulCreateRoute({List<PageRouteInfo>? children})
      : super(
          SuccessfulCreateRoute.name,
          initialChildren: children,
        );

  static const String name = 'SuccessfulCreateRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

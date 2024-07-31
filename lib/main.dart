import 'package:flutter/material.dart';
import 'package:digit_ui_components/theme/digit_theme.dart';
import 'package:digit_ui_components/theme/theme.dart';
import 'package:measurement_book_ui/routes/app_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:measurement_book_ui/bloc/measurement_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => MeasurementBloc(),
        child: MaterialApp.router(
          routerConfig: appRouter.config(),
          title: 'Measurement Book',
          theme: DigitTheme.instance.mobileTheme,
        ));
  }
}

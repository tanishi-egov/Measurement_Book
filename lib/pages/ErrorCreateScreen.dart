import 'package:auto_route/auto_route.dart';
import 'package:digit_ui_components/enum/app_enums.dart';
import 'package:digit_ui_components/widgets/atoms/digit_button.dart';
import 'package:flutter/material.dart';
import 'package:measurement_book_ui/constants/header.dart';
import 'package:digit_ui_components/widgets/molecules/panel_cards.dart';

@RoutePage()
class ErrorCreateScreen extends StatefulWidget {
  const ErrorCreateScreen({super.key});

  @override
  State<ErrorCreateScreen> createState() => _ErrorCreateScreenState();
}

class _ErrorCreateScreenState extends State<ErrorCreateScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          const DigitAppBar(),
          Center(
              child: Column(
            children: [
              PanelCard(
                title: "Error",
                type: PanelType.error,
                additionWidgets: [
                  Center(
                    child: Text(
                      "There's some error while creating measurement details",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  )
                ],
              ),
              Padding(padding: EdgeInsets.all(height * 0.1)),
              Button(
                label: "Try Again",
                onPressed: () {
                  AutoRouter.of(context).popUntilRoot();
                },
                type: ButtonType.primary,
                size: ButtonSize.large,
              )
            ],
          )),
        ],
      ),
    );
  }
}

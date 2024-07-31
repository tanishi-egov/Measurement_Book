import 'package:auto_route/auto_route.dart';
import 'package:digit_ui_components/enum/app_enums.dart';
import 'package:digit_ui_components/widgets/atoms/digit_button.dart';
import 'package:flutter/material.dart';
import 'package:measurement_book_ui/constants/header.dart';
import 'package:digit_ui_components/widgets/molecules/panel_cards.dart';

@RoutePage()
class SuccessfulCreateScreen extends StatefulWidget {
  const SuccessfulCreateScreen({super.key});

  @override
  State<SuccessfulCreateScreen> createState() => _SuccessfulCreateScreenState();
}

class _SuccessfulCreateScreenState extends State<SuccessfulCreateScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          const DigitAppBar(),
          Center(
              child: Column(
            children: [
              PanelCard(
                title: "Successful Creation",
                type: PanelType.success,
                additionWidgets: [
                  Center(
                    child: Text(
                      "Your Measurement Details have been added successfully!",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  )
                ],
              ),
              Padding(padding: EdgeInsets.all(height * 0.1)),
              Button(
                label: "Go to Home Page",
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

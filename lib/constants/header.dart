import 'package:auto_route/auto_route.dart';
import 'package:digit_ui_components/theme/ComponentTheme/back_button_theme.dart';
import 'package:digit_ui_components/widgets/atoms/digit_back_button.dart';
import 'package:digit_ui_components/widgets/molecules/digit_header.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const Column(
      children: [DigitAppBar(), BackNavigationBar()],
    );
  }
}

class DigitAppBar extends StatelessWidget {
  const DigitAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomHeaderMolecule(
        type: HeaderType.dark, title: "Measurement Book");
  }
}

class BackNavigationBar extends StatelessWidget {
  const BackNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BackNavigationButton(
          backButtonText: "Back",
          handleBack: () {
            AutoRouter.of(context).back();
          },
          backNavigationButtonThemeData:
              BackNavigationButtonThemeData.defaultTheme(context),
        ),
        Icon(
          Icons.person,
          color: Theme.of(context).colorScheme.secondary,
          size: height * 0.04,
        ),
      ],
    );
  }
}

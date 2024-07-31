import 'package:auto_route/auto_route.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';
import 'package:measurement_book_ui/constants/header.dart';
import 'package:measurement_book_ui/routes/app_router.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  final String title = "Measurement Book";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          const DigitAppBar(),
          Center(
            heightFactor: height * 0.005,
            child: DigitCard(
              margin: EdgeInsets.symmetric(horizontal: width * 0.1),
              cardType: CardType.secondary,
              children: [
                Text(
                  "To add new measurement book entry, Click on the following button",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Button(
                  label: "Create Entry",
                  mainAxisSize: MainAxisSize.max,
                  onPressed: () {
                    AutoRouter.of(context).push(CreateRoute());
                  },
                  type: ButtonType.primary,
                  size: ButtonSize.large,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

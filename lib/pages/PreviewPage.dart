import 'package:auto_route/auto_route.dart';
import 'package:digit_ui_components/enum/app_enums.dart';
import 'package:digit_ui_components/widgets/atoms/digit_button.dart';
import 'package:digit_ui_components/widgets/atoms/labelled_fields.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:measurement_book_ui/bloc/measurement_bloc.dart';
import 'package:measurement_book_ui/constants/header.dart';
import 'package:measurement_book_ui/routes/app_router.dart';
import 'package:digit_ui_components/widgets/atoms/digit_divider.dart';

@RoutePage()
class PreviewScreen extends StatefulWidget {
  final Map<String, dynamic>? formData;

  PreviewScreen({super.key, required this.formData});

  @override
  State<PreviewScreen> createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {
  late ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    TextTheme textTheme = Theme.of(context).textTheme;
    //BLOC BUILDER ADDED
    return BlocBuilder<MeasurementBloc, MeasurementState>(
      builder: (context, state) {
        return BlocListener<MeasurementBloc, MeasurementState>(
          listener: (context, state) {
            if (state == IsLoading()) {
              const CircularProgressIndicator();
            } else if (state == LoadedSuccessfully()) {
              AutoRouter.of(context).push(SuccessfulCreateRoute());
            } else if (state == ErrorLoading()) {
              AutoRouter.of(context).push(ErrorCreateRoute());
            }
          },
          child: Scaffold(
              body: Column(
            children: [
              const Header(),
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: DigitCard(
                      margin: EdgeInsets.symmetric(horizontal: width * 0.1),
                      cardType: CardType.primary,
                      children: [
                        Text(
                          "Measurement Details",
                          style: textTheme.headlineLarge,
                        ),
                        LabeledField(
                            label: "Tenant Id :",
                            child: Text(
                              widget.formData!['tenantId'],
                              style: textTheme.bodyLarge,
                            )),
                        LabeledField(
                            label: "Physical Reference Number :",
                            child: Text(
                              widget.formData!['physicalRefNumber'],
                              style: textTheme.bodyLarge,
                            )),
                        LabeledField(
                            label: "Measurement Number :",
                            child: Text(
                              widget.formData!['measurementNumber'],
                              style: textTheme.bodyLarge,
                            )),
                        LabeledField(
                            label: "Reference Id :",
                            child: Text(
                              widget.formData!['referenceId'],
                              style: textTheme.bodyLarge,
                            )),
                        LabeledField(
                            label: "Is Active :",
                            child: Text(
                              widget.formData!['isActive'],
                              style: textTheme.bodyLarge,
                            )),
                        const DigitDivider(
                          dividerType: DividerType.medium,
                        ),
                        LabeledField(
                            label: "Target Id :",
                            labelStyle: textTheme.bodyLarge,
                            child: Text(
                              widget.formData!['measure']['targetId'] ?? "null",
                              style: textTheme.bodyLarge,
                            )),
                        LabeledField(
                            label: "Length :",
                            child: Text(
                              widget.formData!['measure']['length'],
                              style: textTheme.bodyLarge,
                            )),
                        LabeledField(
                            label: "Breadth :",
                            child: Text(
                              widget.formData!['measure']['breadth'],
                              style: textTheme.bodyLarge,
                            )),
                        LabeledField(
                            label: "Height :",
                            child: Text(
                              widget.formData!['measure']['height'],
                              style: textTheme.bodyLarge,
                            )),
                        LabeledField(
                            label: "Number of Items :",
                            child: Text(
                              widget.formData!['measure']['numItems'],
                              style: textTheme.bodyLarge,
                            )),
                        LabeledField(
                            label: "Current Value :",
                            child: Text(
                              widget.formData!['measure']['currentValue'],
                              style: textTheme.bodyLarge,
                            )),
                        LabeledField(
                            label: "Cumulative Value :",
                            child: Text(
                              widget.formData!['measure']['cumulativeValue'],
                              style: textTheme.bodyLarge,
                            )),
                        LabeledField(
                            label: "Comments :",
                            child: Text(
                              widget.formData!['measure']['comments'],
                              style: textTheme.bodyLarge,
                            )),
                        Padding(
                            padding: EdgeInsets.all(
                                MediaQuery.of(context).size.height * 0.01)),
                        Button(
                          label: "Submit",
                          onPressed: () {
                            print(widget.formData);
                            context
                                .read<MeasurementBloc>()
                                .add(onSubmit(formData: widget.formData ?? {}));
                          },
                          type: ButtonType.primary,
                          size: ButtonSize.large,
                          mainAxisSize: MainAxisSize.max,
                        )
                      ]),
                ),
              ),
            ],
          )),
        );
      },
    );
  }
}

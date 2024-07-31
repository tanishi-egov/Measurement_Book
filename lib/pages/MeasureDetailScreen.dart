import 'package:auto_route/auto_route.dart';
import 'package:digit_ui_components/enum/app_enums.dart';
import 'package:digit_ui_components/widgets/atoms/digit_button.dart';
import 'package:digit_ui_components/widgets/atoms/digit_text_form_input.dart';
import 'package:digit_ui_components/widgets/atoms/labelled_fields.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';
import 'package:measurement_book_ui/constants/header.dart';
import 'package:measurement_book_ui/routes/app_router.dart';
import 'package:reactive_forms/reactive_forms.dart';

@RoutePage()
class MeasureDetailScreen extends StatefulWidget {
  final Map<String, dynamic>? formData;
  const MeasureDetailScreen({super.key, required this.formData});
  @override
  State<MeasureDetailScreen> createState() => _MeasureDetailScreenState();
}

class _MeasureDetailScreenState extends State<MeasureDetailScreen> {
  late FormGroup measureForm;
  @override
  void initState() {
    super.initState();
    measureForm = FormGroup({
      'targetId': FormControl<String>(validators: [Validators.required]),
      'length': FormControl<String>(validators: [Validators.required]),
      'breadth': FormControl<String>(validators: [Validators.required]),
      'height': FormControl<String>(validators: [Validators.required]),
      'numItems': FormControl<String>(validators: [Validators.required]),
      'currentValue': FormControl<String>(validators: [Validators.required]),
      'cumulativeValue': FormControl<String>(validators: [Validators.required]),
      'comments': FormControl<String>(),
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          const Header(),
          Expanded(
            child: SingleChildScrollView(
              child: DigitCard(
                margin: EdgeInsets.symmetric(horizontal: width * 0.1),
                cardType: CardType.primary,
                children: [
                  ReactiveForm(
                    formGroup: measureForm,
                    child: Column(
                      children: [
                        LabeledField(
                          label: "Enter Target Id",
                          isRequired: true,
                          child: ReactiveFormField<String, String>(
                            formControlName: 'targetId',
                            validationMessages: {
                              ValidationMessage.required: (error) =>
                                  'Please enter the target id',
                            },
                            builder: (field) {
                              return DigitTextFormInput(
                                isRequired: true,
                                helpText: "Contract line item id",
                                errorMessage: field.errorText,
                                onChange: (value) => field.didChange(value),
                              );
                            },
                          ),
                        ),
                        LabeledField(
                          label: "Enter length",
                          isRequired: true,
                          child: ReactiveFormField<String, String>(
                            formControlName: 'length',
                            validationMessages: {
                              ValidationMessage.required: (error) =>
                                  'Please enter the length',
                            },
                            builder: (field) {
                              return DigitTextFormInput(
                                isRequired: true,
                                helpText: "e.g: 100",
                                errorMessage: field.errorText,
                                onChange: (value) => field.didChange(value),
                              );
                            },
                          ),
                        ),
                        LabeledField(
                          label: "Enter breadth",
                          isRequired: true,
                          child: ReactiveFormField<String, String>(
                            formControlName: 'breadth',
                            validationMessages: {
                              ValidationMessage.required: (error) =>
                                  'Please enter the breadth',
                            },
                            builder: (field) {
                              return DigitTextFormInput(
                                isRequired: true,
                                helpText: "e.g: 100",
                                errorMessage: field.errorText,
                                onChange: (value) => field.didChange(value),
                              );
                            },
                          ),
                        ),
                        LabeledField(
                          label: "Enter height",
                          isRequired: true,
                          child: ReactiveFormField<String, String>(
                            formControlName: 'height',
                            validationMessages: {
                              ValidationMessage.required: (error) =>
                                  'Please enter the height',
                            },
                            builder: (field) {
                              return DigitTextFormInput(
                                isRequired: true,
                                helpText: "e.g: 100",
                                errorMessage: field.errorText,
                                onChange: (value) => field.didChange(value),
                              );
                            },
                          ),
                        ),
                        LabeledField(
                          label: "Number of items",
                          isRequired: true,
                          child: ReactiveFormField<String, String>(
                            formControlName: 'numItems',
                            validationMessages: {
                              ValidationMessage.required: (error) =>
                                  'Please enter the number of items',
                            },
                            builder: (field) {
                              return DigitTextFormInput(
                                isRequired: true,
                                helpText: "e.g: 5",
                                errorMessage: field.errorText,
                                onChange: (value) => field.didChange(value),
                              );
                            },
                          ),
                        ),
                        LabeledField(
                          label: "Enter Current Value",
                          isRequired: true,
                          child: ReactiveFormField<String, String>(
                            formControlName: 'currentValue',
                            validationMessages: {
                              ValidationMessage.required: (error) =>
                                  'Please enter the current value',
                            },
                            builder: (field) {
                              return DigitTextFormInput(
                                isRequired: true,
                                helpText: "e.g: 50",
                                errorMessage: field.errorText,
                                onChange: (value) => field.didChange(value),
                              );
                            },
                          ),
                        ),
                        LabeledField(
                          label: "Enter Cumulative Value",
                          isRequired: true,
                          child: ReactiveFormField<String, String>(
                            formControlName: 'cumulativeValue',
                            validationMessages: {
                              ValidationMessage.required: (error) =>
                                  'Please enter the cumulative value',
                            },
                            builder: (field) {
                              return DigitTextFormInput(
                                isRequired: true,
                                helpText: "e.g: 10",
                                errorMessage: field.errorText,
                                onChange: (value) => field.didChange(value),
                              );
                            },
                          ),
                        ),
                        LabeledField(
                          label: "Comment",
                          child: ReactiveFormField<String, String>(
                            formControlName: 'comments',
                            builder: (field) {
                              return DigitTextFormInput(
                                helpText: "e.g: Measure Details for 31/07/2024",
                                errorMessage: field.errorText,
                                onChange: (value) => field.didChange(value),
                              );
                            },
                          ),
                        ),
                        Center(
                          child: Button(
                            label: "Preview",
                            onPressed: () {
                              if (measureForm.valid) {
                                final updatedFormData = {
                                  ...widget.formData!,
                                  'measure': measureForm.value
                                };
                                AutoRouter.of(context).push(
                                    PreviewRoute(formData: updatedFormData));
                              } else {
                                measureForm.markAllAsTouched();
                              }
                            },
                            type: ButtonType.primary,
                            size: ButtonSize.large,
                            mainAxisSize: MainAxisSize.max,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

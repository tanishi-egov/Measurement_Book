import 'package:auto_route/auto_route.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/widgets/atoms/digit_divider.dart';
import 'package:flutter/material.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:measurement_book_ui/constants/header.dart';
import 'package:measurement_book_ui/routes/app_router.dart';
import 'package:reactive_forms/reactive_forms.dart';

@RoutePage()
class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});
  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  final form = FormGroup({
    'tenantId': FormControl<String>(validators: [Validators.required]),
    'physicalRefNumber': FormControl<String>(validators: [Validators.required]),
    'measurementNumber': FormControl<String>(validators: [Validators.required]),
    'referenceId': FormControl<String>(validators: [Validators.required]),
    'isActive': FormControl<String>(validators: [Validators.required]),
  });
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Column(
        children: [
          const Header(),
          Center(
            heightFactor: height * 0.0013,
            child: ReactiveForm(
              formGroup: form,
              child: DigitCard(
                margin: EdgeInsets.symmetric(horizontal: width * 0.1),
                cardType: CardType.primary,
                children: [
                  Text(
                    "Add Measurement Details",
                    style: textTheme.headlineMedium,
                  ),
                  const DigitDivider(
                    dividerType: DividerType.medium,
                  ),
                  LabeledField(
                    label: "Enter Tenant Id",
                    isRequired: true,
                    child: ReactiveFormField<String, String>(
                      formControlName: 'tenantId',
                      validationMessages: {
                        ValidationMessage.required: (error) =>
                            'Please enter the tenant id',
                      },
                      builder: (field) {
                        return DigitTextFormInput(
                          helpText: 'e.g. pd.amritsar',
                          isRequired: true,
                          errorMessage: field.errorText,
                          onChange: (value) => field.didChange(value),
                        );
                      },
                    ),
                  ),
                  LabeledField(
                    label: "Enter physical reference number",
                    isRequired: true,
                    child: ReactiveFormField<String, String>(
                      formControlName: 'physicalRefNumber',
                      validationMessages: {
                        ValidationMessage.required: (error) =>
                            'Please enter the physical reference number',
                      },
                      builder: (field) {
                        return DigitTextFormInput(
                          isRequired: true,
                          helpText: "Reference to a real world mBook",
                          errorMessage: field.errorText,
                          onChange: (value) => field.didChange(value),
                        );
                      },
                    ),
                  ),
                  LabeledField(
                    label: "Enter Measurement number",
                    isRequired: true,
                    child: ReactiveFormField<String, String>(
                      formControlName: 'measurementNumber',
                      validationMessages: {
                        ValidationMessage.required: (error) =>
                            'Please enter the measurement number',
                      },
                      builder: (field) {
                        return DigitTextFormInput(
                          isRequired: true,
                          errorMessage: field.errorText,
                          onChange: (value) => field.didChange(value),
                        );
                      },
                    ),
                  ),
                  LabeledField(
                    label: "Enter Reference Id",
                    isRequired: true,
                    child: ReactiveFormField<String, String>(
                      formControlName: 'referenceId',
                      validationMessages: {
                        ValidationMessage.required: (error) =>
                            'Please enter the reference number',
                      },
                      builder: (field) {
                        return DigitTextFormInput(
                          helpText: "Entity Id to which measurement belongs",
                          isRequired: true,
                          errorMessage: field.errorText,
                          onChange: (value) => field.didChange(value),
                        );
                      },
                    ),
                  ),
                  LabeledField(
                    label: "Is Active?",
                    child: ReactiveFormField<String, String>(
                      formControlName: 'isActive',
                      validationMessages: {
                        ValidationMessage.required: (error) =>
                            'Please select whether the measurement is active',
                      },
                      builder: (field) {
                        return RadioList(
                          groupValue:
                              (field.value == "true") ? "true" : "false",
                          radioButtons: [
                            RadioButtonModel(code: "true", name: "True"),
                            RadioButtonModel(code: "false", name: "False"),
                          ],
                          onChanged: (value) => field.didChange(value.code),
                        );
                      },
                    ),
                  ),
                  Center(
                    child: Button(
                      label: "Next",
                      onPressed: () {
                        if (form.valid) {
                          AutoRouter.of(context)
                              .push(MeasureDetailRoute(formData: form.value));
                        } else {
                          form.markAllAsTouched();
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
          ),
        ],
      ),
    );
  }
}

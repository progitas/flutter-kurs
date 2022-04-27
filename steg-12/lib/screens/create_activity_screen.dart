import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:progit_activity_booker/api/API.dart';
import 'package:progit_activity_booker/constants/text_field_decoration.dart';
import 'package:progit_activity_booker/models/activity.dart';
import 'package:progit_activity_booker/router/route_generator.dart';
import 'package:progit_activity_booker/widgets/common/chip_button.dart';
import 'package:progit_activity_booker/widgets/common/show_error_dialog.dart';
import 'package:progit_activity_booker/widgets/common/time_date_input.dart';
import 'package:progit_activity_booker/widgets/layout/screen_widget.dart';

class CreateActivityScreen extends StatefulWidget {
  const CreateActivityScreen({Key? key}) : super(key: key);

  @override
  State<CreateActivityScreen> createState() => _CreateActivityScreenState();
}

class _CreateActivityScreenState extends State<CreateActivityScreen> {
  final _formKey = GlobalKey<FormState>();
  var _loading = false;

  final _formData = {};

  Future<void> _createActivity(BuildContext context) async {
    if (_formKey.currentState == null) {
      return;
    }
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();

    setState(() {
      _loading = true;
    });

    try {
      final activity = Activity.toCreate(
          title: _formData['title'],
          location: _formData['location'],
          time: _formData['time'],
          answerBy: _formData['answerBy'],
          numberOfSlots: int.parse(_formData['numberOfSlots']),
          description: _formData['description'],
          category: _formData['category'] ?? ACTIVITY_CATEGORY.UNKNOWN);
      await API.activity.createActivity(activity);
      Navigator.of(context).pushNamed(TabsRoute.path);
    } catch (e) {
      print(e);
      showErrorDialog(context, e.toString());
    }
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenWidget(
      scrollable: true,
      child: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: Form(
            autovalidateMode: AutovalidateMode.disabled,
            key: _formKey,
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Lag aktivitet',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ...textFormFields
                      .map((formField) => Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: TextFormField(
                                textCapitalization:
                                    TextCapitalization.sentences,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                inputFormatters: [
                                  if (formField.type == FormFieldType.NUMBERS)
                                    FilteringTextInputFormatter.digitsOnly
                                ],
                                minLines:
                                    formField.type == FormFieldType.TEXT_FIELD
                                        ? 3
                                        : 1,
                                maxLines:
                                    formField.type == FormFieldType.TEXT_FIELD
                                        ? 6
                                        : 1,
                                decoration: getFormFieldDecoration(
                                  context,
                                  formField.title,
                                ),
                                textInputAction: TextInputAction.next,
                                keyboardType:
                                    formField.type == FormFieldType.NUMBERS
                                        ? TextInputType.number
                                        : TextInputType.text,
                                validator: (value) =>
                                    formField.validatorFn(value),
                                onSaved: (value) {
                                  _formData[formField.key] = value ?? '';
                                }),
                          ))
                      .toList(),
                  const SizedBox(
                    height: 10,
                  ),
                  TimeDateInput(
                    label: 'Tidspunkt',
                    onDateSelected: (value) => _formData['time'] = value,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TimeDateInput(
                    label: 'Svarfrist',
                    onDateSelected: (value) => _formData['answerBy'] = value,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ChipButton(
                    loading: _loading,
                    label: 'Opprett aktivitet',
                    onClick: () => _createActivity(context),
                  ),
                  const SizedBox(
                    height: 100,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

enum FormFieldType { TEXT, NUMBERS, TEXT_FIELD }

class FormDataValue {
  String key = '';
  String title = '';
  String errorMessage = 'Ugyldig';
  FormFieldType type = FormFieldType.TEXT;

  String? validatorFn(String? value) {
    if (value == null || value.isEmpty) {
      return _getErrorMessage;
    }
    if (type == FormFieldType.NUMBERS && int.parse(value) < 0) {
      return _getErrorMessage;
    }
    return null;
  }

  FormDataValue({
    required this.key,
    required this.title,
    FormFieldType? type,
  }) : type = type ?? FormFieldType.TEXT;

  String get _getErrorMessage {
    return '$errorMessage ${title.toLowerCase()}';
  }
}

List<FormDataValue> textFormFields = [
  FormDataValue(key: 'title', title: 'Navn'),
  FormDataValue(key: 'location', title: 'Sted'),
  FormDataValue(
    key: 'numberOfSlots',
    title: 'Antall plasser',
    type: FormFieldType.NUMBERS,
  ),
  FormDataValue(
    key: 'description',
    title: 'Beskrivelse',
    type: FormFieldType.TEXT_FIELD,
  ),
];

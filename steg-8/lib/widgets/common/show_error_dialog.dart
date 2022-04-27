import 'package:flutter/material.dart';
import 'package:progit_activity_booker/widgets/common/chip_button.dart';

void showErrorDialog(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      title: const Text('Det skjedde en feil'),
      content: Text(message),
      actions: [
        ChipButton(
          label: 'Lukk',
          onClick: () => Navigator.of(ctx).pop(),
        )
      ],
    ),
  );
}

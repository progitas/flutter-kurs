import 'package:flutter/material.dart';
import 'package:progit_activity_booker/constants/app_colors.dart';

class ChipButton extends StatelessWidget {
  final String label;
  final bool large;
  final bool loading;
  final void Function()? onClick;

  const ChipButton({
    required this.label,
    this.large = false,
    this.onClick,
    bool? loading,
    Key? key,
  })  : loading = loading ?? false,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onClick,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: large ? 12.0 : 10.0),
        child: loading
            ? SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 1,
                  color: Theme.of(context).primaryColorLight,
                ),
              )
            : Text(
                label,
                style: TextStyle(
                    color: Theme.of(context).primaryColorLight,
                    fontSize: large ? 18 : 14),
              ),
      ),
      style: TextButton.styleFrom(
        fixedSize: Size.fromHeight(large ? 40 : 30),
        backgroundColor:
            onClick != null ? AppColors.primaryMaterial : Colors.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            large ? 35.0 : 20.0,
          ),
        ),
      ),
    );
  }
}

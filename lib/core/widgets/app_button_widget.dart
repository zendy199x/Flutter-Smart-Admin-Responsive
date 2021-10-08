import 'package:flutter/material.dart';

enum ButtonType { PRIMARY, PLAIN }

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    this.type,
    this.onPressed,
    this.text,
  }) : super(key: key);

  final ButtonType? type;
  final VoidCallback? onPressed;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 45,
        decoration: BoxDecoration(
          color: getButtonColor(context, type!),
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Center(
          child: Text(
            text!,
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: getTextColor(context, type!),
                ),
          ),
        ),
      ),
    );
  }
}

Color getButtonColor(context, ButtonType type) {
  switch (type) {
    case ButtonType.PRIMARY:
      // ignore: deprecated_member_use
      return Theme.of(context).buttonColor;
    case ButtonType.PLAIN:
      return Colors.white;
    default:
      return Theme.of(context).primaryColor;
  }
}

Color getTextColor(context, ButtonType type) {
  switch (type) {
    case ButtonType.PLAIN:
      return Theme.of(context).primaryColor;
    case ButtonType.PRIMARY:
      return Colors.white;
    default:
      // ignore: deprecated_member_use
      return Theme.of(context).buttonColor;
  }
}

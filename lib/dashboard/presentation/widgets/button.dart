import 'package:flutter/material.dart';
import 'package:opticash_mobile/core/utils/colors.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {Key? key,
      required this.onLogin,
      required this.title,
      this.color,
      this.useGradient = false})
      : super(key: key);
  final Function() onLogin;
  final Text title;
  final Color? color;
  final bool? useGradient;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onLogin,
      child: Container(
        width: double.infinity,
        height: 48,
        decoration: BoxDecoration(
          gradient: useGradient!
              ? const LinearGradient(
                  colors: [
                    Color.fromRGBO(163, 203, 0, 1),
                    Color.fromRGBO(221, 218, 76, 1)
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                )
              : null,
          color: color,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(child: title),
      ),
    );
  }
}

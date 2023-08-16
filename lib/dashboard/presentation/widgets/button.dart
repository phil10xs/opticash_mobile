import 'package:flutter/material.dart';
import 'package:opticash_mobile/core/utils/colors.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({Key? key, required this.onLogin, required this.title})
      : super(key: key);
  final Function() onLogin;
  final Text title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onLogin,
      child: Container(
        width: double.infinity,
        height: 48,
        decoration: BoxDecoration(
            color: appColor.black, borderRadius: BorderRadius.circular(5)),
        child: Center(child: title),
      ),
    );
  }
}

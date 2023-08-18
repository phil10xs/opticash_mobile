import 'package:flutter/material.dart';
import 'package:opticash_mobile/core/assets/assets.dart';
import 'package:opticash_mobile/core/utils/colors.dart';
import 'package:opticash_mobile/dashboard/presentation/views/dashboard.dart';
import 'package:opticash_mobile/dashboard/presentation/widgets/button.dart';

mixin DashBoardNotifierMixin on ChangeNotifier {
  handleFailedResponse(BuildContext context, String message) {
    CommonPopup.showError(context,
        message: message, title: "Oops an error occured");
  }

  handleSuccess(BuildContext context) {
    GeneralDialog.show(
      context,
      SuccessResponse(
        onLogin: () => {
          Navigator.of(context).pop(),
          Navigator.of(context).pushNamed(DashBoardScreen.routeName),
        },
      ),
    );
  }

  handleLoginSuccess(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 1)).then(
        (value) => Navigator.of(context).pushNamed(DashBoardScreen.routeName));
  }
}

class SuccessResponse extends StatelessWidget {
  final String? title;
  final String? message;
  final Function onLogin;
  const SuccessResponse(
      {super.key, this.title, this.message, required this.onLogin});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 10,
          ),
          Image.asset(kOpticash),
          SizedBox(
            height: 20,
          ),
          const Text(
            'Account Created Successfully',
            style: TextStyle(
              fontFamily: "Rogerex",
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          PrimaryButton(
            color: appColor.black,
            onLogin: () => onLogin(),
            title: Text("SIGN IN"),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

class CommonPopup {
  static Future showError(
    BuildContext context, {
    bool barrierDismissible = true,
    String? title,
    String? message,
    String buttonText = "CLOSE",
    VoidCallback? onButtonTapped,
    VoidCallback? errorInfoTapped,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Row(
            children: [
              Expanded(
                child: Text(
                  title ?? "",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: appColor.primary, fontFamily: 'SourceSansPro'),
                ),
              ),
            ],
          ),
          content: Text(
            message ?? "",
            style: const TextStyle(fontFamily: 'SourceSansPro'),
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(buttonText,
                  style: const TextStyle(fontFamily: 'SourceSansPro')),
            )
          ],
        );
      },
    );
  }
}

class GeneralDialog extends StatefulWidget {
  final Widget child;

  const GeneralDialog(this.child);

  @override
  State<StatefulWidget> createState() => _GeneralDialog();

  static Future<void> show(BuildContext context, Widget child,
      {bool barrierDismissible = true}) async {
    return await showDialog(
      context: context,
      builder: (context) {
        return GeneralDialog(child);
      },
      barrierDismissible: barrierDismissible,
    );
  }
}

class _GeneralDialog extends State<GeneralDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: widget.child,
    );
  }
}

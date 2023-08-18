import 'package:flutter/material.dart';
import 'package:opticash_mobile/dashboard/presentation/notifier/dash_notifier.dart';
import 'package:provider/provider.dart';

extension BuildContextNotifier on BuildContext {
  DashBaordNotifier get dashnotifier =>
      Provider.of<DashBaordNotifier>(this, listen: false);

  T read<T>() => Provider.of<T>(this, listen: false);

  T watch<T>() => Provider.of<T>(this, listen: true);
}

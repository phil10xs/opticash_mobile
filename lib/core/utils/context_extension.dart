import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

extension BuildContextNotifier on BuildContext {
  // DashBaordNotifier get mynotifier => Provider.of<DashBaordNotifier>(this, listen: false);

  T read<T>() => Provider.of<T>(this, listen: false);

  T watch<T>() => Provider.of<T>(this, listen: true);

  ThemeData get theme => Theme.of(this);

  Size get screenSize => MediaQuery.of(this).size;
}

import 'package:flutter/material.dart';
import '../utils/themes.dart';

AppBar harakaAppBar(
  BuildContext context, {
  String title = '',
  List<Widget>? action,
  bool leading = false,
  VoidCallback? leadingAction,
  ImageProvider? image,
  bool automaticImplyLeading = true,
}) {
  return AppBar(
    centerTitle: true,
    title: Text(
      title,
      style: HarakaFonts(context).appbarTitle,
    ),
    actions: action,
    elevation: 0,
    automaticallyImplyLeading: automaticImplyLeading,
    backgroundColor: Colors.transparent,
    leading: leading
        ? IconButton(
            icon: const Icon(Icons.arrow_back, color: HarakaColors.primary),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        : null,
  );
}

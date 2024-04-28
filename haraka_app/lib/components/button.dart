import 'package:flutter/material.dart';

import '../utils/themes.dart';
import 'hover.dart';

// ignore: must_be_immutable
class Button extends StatelessWidget {
  String? text;
  void Function()? onTap;
  Color? color;
  Color? textColor;
  Widget? child;
  EdgeInsets? padding;
  Border? border;

  Button({
    Key? key,
    this.text,
    this.onTap,
    this.color,
    this.textColor,
    this.child,
    this.padding,
    this.border,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    color ??= HarakaColors.primary;
    textColor ??= Colors.white;
    padding ??= const EdgeInsets.all(16);

    return Hover(
      onTap: onTap ?? () {},
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: padding,
        decoration: BoxDecoration(
          border: border,
          color: onTap != null ? color : HarakaColors.greyStroke,
          borderRadius: BorderRadius.circular(12),
          boxShadow: onTap != null
              ? [
                  BoxShadow(
                    color: color!.withOpacity(0.5),
                    offset: const Offset(0, 4),
                    blurRadius: 12,
                  )
                ]
              : [],
        ),
        child: Center(
          child: child ??
              Text(
                text!,
                style: HarakaFonts(context).boldInter(size: 14).apply(
                      color: onTap != null
                          ? textColor
                          : HarakaColors.black.withOpacity(0.6),
                    ),
              ),
        ),
      ),
    );
  }
}

class AnimatedButtonLogin extends StatefulWidget {
  const AnimatedButtonLogin({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AnimatedButtonLoginState createState() => _AnimatedButtonLoginState();
}

class _AnimatedButtonLoginState extends State<AnimatedButtonLogin> {
  bool _clicked = false;
  @override
  Widget build(BuildContext context) {
    return Hover(
      onTap: () {
        setState(() {
          _clicked = !_clicked;
        });
      },
      child: AnimatedContainer(
        width: _clicked ? 50 : MediaQuery.of(context).size.width,
        height: 50,
        curve: Curves.fastOutSlowIn,
        duration: const Duration(milliseconds: 400),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(_clicked ? 50 : 15),
          gradient: const LinearGradient(
            colors: [
              HarakaColors.secondary,
              HarakaColors.primary,
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Center(
            child: Text(
          'LOGIN',
          style: HarakaFonts(context).boldInter(
            color: HarakaColors.lightPrimary,
            size: 14,
          ),
        )),
      ),
    );
  }
}

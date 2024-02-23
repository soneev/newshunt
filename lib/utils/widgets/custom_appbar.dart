import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  // final String title;
  final Widget title;
  final Widget? leading;
  List<Widget>? actions;
  bool? centerTitle;

  CustomAppBar(
      {super.key,
      required this.title,
      this.leading,
      this.actions,
      this.centerTitle = false});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: centerTitle,
      automaticallyImplyLeading: false,
      elevation: 0,
      title: title,
      backgroundColor: Colors.white,
      leading: leading,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

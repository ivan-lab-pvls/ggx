import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:gg_game/theme/const.dart';

abstract class Dialog {
  void buildDialog(BuildContext context, Widget widget,
      [bool barrierDismissible = false, Color barrierColor = Colors.black38]) {
    AwesomeDialog(
      dialogBorderRadius: borderRadius,
      barrierColor: barrierColor,
      dialogBackgroundColor: Colors.transparent,
      context: context,
      animType: AnimType.scale,
      dialogType: DialogType.noHeader,
      body: widget,
      btnOkOnPress: null,
      dismissOnTouchOutside: barrierDismissible,
    ).show();
  }
}

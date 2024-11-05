import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

void errorSnackBar(BuildContext context, String text) {
  return showTopSnackBar(
    Overlay.of(context),
    CustomSnackBar.error(
      message: text,
    ),
  );
}

void successSnackbar(BuildContext context, String text) {
  return showTopSnackBar(
    Overlay.of(context),
    CustomSnackBar.success(
      message: text,
    ),
  );
}

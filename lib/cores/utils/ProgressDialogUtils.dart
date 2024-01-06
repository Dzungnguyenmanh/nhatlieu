import 'package:flutter/material.dart';
import 'package:nhatlieu/cores/utils/navigator_utils.dart';

class ProgressDialogUtils {
  static bool isProgressVisible = false;

  /// Shows a progress dialog with an adaptive circular progress indicator.
  ///
  /// The dialog will be shown using the current overlay context of the [navigatorKey] defined
  /// in the [NavigatorService] class. The [isCancellable] parameter determines
  /// whether the dialog can be cancelled by tapping outside of it.
  ///
  /// If another progress dialog is already visible, this function will not show
  /// a new one until the previous one is dismissed.
  static void showProgressDialog({isCancellable = false}) async {
    if (!isProgressVisible &&
        NavUtils.navigatorkey.currentState?.overlay?.context != null) {
      showDialog(
          barrierDismissible: isCancellable,
          context: NavUtils.navigatorkey.currentState!.overlay!.context,
          builder: (BuildContext context) {
            return const Center(
              child: CircularProgressIndicator.adaptive(
                strokeWidth: 4,
                valueColor: AlwaysStoppedAnimation<Color>(
                  Colors.white,
                ),
              ),
            );
          });
      isProgressVisible = true;
    }
  }

  /// Hides the progress dialog if it is currently visible.
  static void hideProgressDialog() {
    if (isProgressVisible) {
      Navigator.pop(NavUtils.navigatorkey.currentState!.overlay!.context);
    }
    isProgressVisible = false;
  }
}

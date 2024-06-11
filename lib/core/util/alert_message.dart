// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:yolcu360_kahve/core/res/icons.dart';
import 'package:yolcu360_kahve/core/util/app_dialog.dart';

extension BuildContextEx on BuildContext {
  void showSnackBar(String message,
      {SnackBarAction? action,
      AlertStatus status = AlertStatus.info,
      SnackBarDuration duration = SnackBarDuration.long}) {
    ScaffoldMessenger.of(this)
      ..removeCurrentMaterialBanner()
      ..showSnackBar(SnackBar(
        content: Row(
          children: [
            Icon(
              _getIcon(status),
              color: Colors.white,
              size: 36,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: DefaultTextStyle(
                  style: Theme.of(this)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.white),
                  child: Text(
                    message.toString().trim(),
                  ),
                ),
              ),
            ),
          ],
        ),
        backgroundColor: _getColor(status),
        duration: _getTime(duration),
        action: action,
        behavior: SnackBarBehavior.floating,
        elevation: 0,
      ));
  }

  void showAlertDialog(String title, String message,
      {AlertStatus status = AlertStatus.success,
      Function? done,
      Function? cancel}) {
    showDialog(
        context: this,
        builder: (c) {
          return AppDialog(
            icon: Icon(
              _getIcon(status),
              color: _getColor(status),
              size: 36,
            ),
            title: Text(title),
            subtitle: Text(
              message,
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(c);
                    done?.call();
                  },
                  child: const Text("Okay")),
              TextButton(
                  style: TextButton.styleFrom(foregroundColor: Colors.black),
                  onPressed: () {
                    Navigator.pop(c);
                    cancel?.call();
                  },
                  child: const Text("Cancel"))
            ],
          );
        });
  }
}

class InfoMessage {
  AlertStatus status;
  String? title;
  String? message;
  SnackBarDuration duration;

  InfoMessage(
      {this.status = AlertStatus.success,
      this.title,
      this.message,
      this.duration = SnackBarDuration.long});

  void snack(BuildContext context, {SnackBarAction? action}) {
    ScaffoldMessenger.of(context)
      ..removeCurrentMaterialBanner()
      ..showSnackBar(SnackBar(
        content: Row(
          children: [
            Icon(
              _getIcon(status),
              color: Colors.white,
              size: 36,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (title != null)
                      DefaultTextStyle(
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: Colors.white),
                        child: Text(
                          title!,
                        ),
                      ),
                    if (message != null)
                      DefaultTextStyle(
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Colors.white),
                        child: Text(
                          message.toString().trim(),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
        backgroundColor: _getColor(status),
        duration: _getTime(duration),
        action: action,
        behavior: SnackBarBehavior.floating,
        elevation: 0,
      ));
  }
}

IconData _getIcon(AlertStatus s) {
  switch (s) {
    case AlertStatus.success:
      return AppIcons.success;
    case AlertStatus.error:
      return AppIcons.error;
    case AlertStatus.info:
      return AppIcons.info;
    case AlertStatus.warning:
      return AppIcons.warning;
    default:
      return AppIcons.info;
  }
}

Color _getColor(AlertStatus s) {
  switch (s) {
    case AlertStatus.success:
      return Colors.green;
    case AlertStatus.error:
      return Colors.red;
    case AlertStatus.info:
      return Colors.blue;
    case AlertStatus.warning:
      return Colors.yellow;
    default:
      return Colors.blue;
  }
}

Duration _getTime(SnackBarDuration s) {
  switch (s) {
    case SnackBarDuration.indefinite:
      return const Duration(minutes: 1);
    case SnackBarDuration.long:
      return const Duration(milliseconds: 2750);
    default:
      return const Duration(milliseconds: 1500);
  }
}

enum AlertStatus { success, error, info, warning }

enum SnackBarDuration { indefinite, long, short }

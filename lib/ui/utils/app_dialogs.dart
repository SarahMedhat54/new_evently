import 'package:flutter/material.dart';

showLoading(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      content: Row(
        children: [Text("Loading..."), Spacer(), CircularProgressIndicator()],
      ),
    ),
  );
}

showMessage(
  BuildContext context,
  String message, {
  String? title,
  String? posButtonText,
  Function? onPosClick,
  String? negButtonText,
  Function? onNegButtonClick,
}) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: title != null ? Text(title) : null,
      content: Text(message),
      actions: [
        if (posButtonText != null)
          TextButton(
            child: Text(posButtonText),
            onPressed: () {
              onPosClick?.call();
              Navigator.pop(context);
            },
          ),
        if (negButtonText != null)
          TextButton(
            child: Text(negButtonText),
            onPressed: () {
              if (onNegButtonClick != null) onNegButtonClick();
              Navigator.pop(context);
            },
          ),
      ],
    ),
  );
}

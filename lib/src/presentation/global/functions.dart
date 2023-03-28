import 'package:flutter/material.dart';

void showCustomDialog({
  required BuildContext context,
  String? text,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        icon: const Image(
          image: NetworkImage(
            'https://cdn-icons-png.flaticon.com/512/148/148766.png',
          ),
          height: 60,
        ),
        title: Text(
          text ?? 'Error',
          style: const TextStyle(color: Colors.red),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Ok',
              style: TextStyle(color: Colors.red),
            ),
          )
        ],
      );
    },
  );
}

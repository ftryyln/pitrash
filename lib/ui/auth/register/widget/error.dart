import 'package:final_project/const/color.dart';
import 'package:final_project/const/text_style.dart';
import 'package:flutter/material.dart';

class ErrorWidget extends StatelessWidget {
  final bool isVisible;

  const ErrorWidget({Key? key, required this.isVisible}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: isVisible,
        child: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Row(
            children: [
              Icon(Icons.error_rounded, color: redColor),
              SizedBox(width: 10),
              Text("Data Harus Diisi",
                  style: tiny.copyWith(color: redColor))
            ],
          ),
        ));
  }
}

import 'package:flutter/material.dart';

class CheckboxWithLabel extends StatefulWidget {
  String message;
  double? fontSize = 16;

  CheckboxWithLabel({
    super.key,
    required this.message,
    this.fontSize,
  });

  @override
  State<CheckboxWithLabel> createState() => _CheckboxWithLabelState();
}

class _CheckboxWithLabelState extends State<CheckboxWithLabel> {
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          checked = !checked;
        });
      },
      child: Row(
        children: [
          Checkbox(
            value: checked,
            onChanged: (e) {
              setState(() {
                checked = !checked;
              });
            },
          ),
          Text(
            widget.message,
            style: TextStyle(
              fontSize: widget.fontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

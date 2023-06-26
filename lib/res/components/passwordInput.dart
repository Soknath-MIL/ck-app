import 'package:flutter/material.dart';

class PasswordInput extends StatefulWidget {
  final Function(String)? onChange;
  final String? Function(String?)? validator;
  final bool isError;

  const PasswordInput(
      {super.key, this.onChange, this.validator, required this.isError});

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool _obscureText = true;
  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        print('out of focus 2');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: _focusNode,
      validator: widget.validator,
      onChanged: (value) {
        if (widget.onChange != null) {
          widget.onChange!(value);
        }
      },
      obscureText: _obscureText,
      decoration: InputDecoration(
        errorStyle: TextStyle(
          fontSize: 14,
        ),
        hintText: "Password",
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(
            style: BorderStyle.none,
            width: widget.isError ? 1 : 0,
          ),
        ),
        // labelText: "Password",
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
        ),
      ),
    );
  }
}

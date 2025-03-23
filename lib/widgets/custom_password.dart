import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PasswordInput extends StatefulWidget {
  TextEditingController controller = TextEditingController();
  final bool isPassword;
  final String label;
  final IconData prefixIcon;
  PasswordInput({
    required this.controller,
    required this.label,
    this.isPassword = false,
    required this.prefixIcon,
    super.key,
  });

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: widget.controller,
        obscureText: isObscure,
        decoration:  InputDecoration(
          border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
          label: Text(widget.label),
          prefixIcon:  Icon(widget.prefixIcon),
          suffixIcon: widget.isPassword == true ? GestureDetector(
            onTap: () {
              setState(() {
                isObscure = !isObscure;
              });
            },
            child:  Icon(isObscure ? Icons.visibility_outlined: Icons.visibility_off)):null
        ),
      ),
    );
  }
}
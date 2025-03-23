import 'package:flutter/material.dart';
class CustomFormInput extends StatelessWidget {
  final String labelText;
  final String errorMsg;
  final IconData pIcon;
  final int maxline;
  final TextEditingController controller;
  final TextInputType type;
  const CustomFormInput(
      {super.key,
      required this.labelText,
      required this.pIcon,
      required this.errorMsg,
      required this.controller,
      this.maxline = 1,
      this.type = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        minLines: 1,
        maxLines: maxline,
        keyboardType: type,
        validator: (value) {
          if (value!.isEmpty) {
            return errorMsg;
          }
          return null;
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(25))),
          label: Text(labelText),
          prefixIcon: Icon(pIcon),
        ),
      ),
    );
  }
}

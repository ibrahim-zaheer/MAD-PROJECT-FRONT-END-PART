import 'package:api_demo/views/pallete.dart';
import 'package:flutter/material.dart';

class LoginField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  const LoginField({
    Key? key,
    required this.hintText,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 400,
      ),
      child: TextFormField(
        style: const TextStyle(color: Pallete.whiteColor, fontSize: 20),
        controller: controller,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(25),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Pallete.borderColor,
                width: 3,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Pallete.gradient2,
                width: 3,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            hintText: hintText,
            hintStyle: const TextStyle(color: Pallete.borderColor)),
      ),
    );
  }
}

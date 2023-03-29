import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String)? onSubmitted;

  const TextInputField({
    Key? key,
    required this.controller,
    this.onSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autofocus: true,
      decoration: InputDecoration(
        label: const Text("CityName"),
        suffixIcon: IconButton(
          onPressed: () => onSubmitted!(controller.text),
          icon: const Icon(Icons.search),
        ),
      ),
      onFieldSubmitted: onSubmitted,
      validator: (value) {
        if (value == null || value == "") {
          return "City name is required";
        }
        return null;
      },
    );
  }
}

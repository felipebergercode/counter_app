import 'package:flutter/material.dart';

class Containers extends StatelessWidget {
  final Widget prefIcon;
  final String hText;
  final Color containerColor;
  final String? Function(String?)? theValidator;
  final void Function(String)? onChanged;
  final String? errorText;

  const Containers({
    super.key,
    required this.prefIcon,
    required this.hText,
    required this.containerColor,
    this.theValidator,
    this.onChanged,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextFormField(
        onChanged: onChanged,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: prefIcon,
          hintText: hText,
          errorText: errorText,
        ),
        validator: theValidator,
      ),
    );
  }
}

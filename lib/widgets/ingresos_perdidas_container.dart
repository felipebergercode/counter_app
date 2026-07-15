import 'package:counter_app/styles/colors.dart';
import 'package:flutter/material.dart';

class IngresosPerdidasContainer extends StatelessWidget {
  final String text;
  final String text2;
  final Color color;
  final Color color2;
  const IngresosPerdidasContainer({
    super.key,
    required this.text,
    required this.color,
    required this.text2,
    required this.color2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 190,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            spreadRadius: 0,
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
        color: appColors.containerBackground,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: appColors.containerBorder),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
                color: color,
              ),
            ),
            Text(
              text2,
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.w800,
                color: color2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

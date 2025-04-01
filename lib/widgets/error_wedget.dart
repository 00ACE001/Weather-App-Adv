import 'package:flutter/material.dart';

class ErrorWedget extends StatelessWidget {
  const ErrorWedget({super.key, required this.errorMessage});
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Text(errorMessage);
  }
}

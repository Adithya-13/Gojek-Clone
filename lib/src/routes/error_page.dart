import 'package:flutter/material.dart';

/// [INFO]
/// Show this error when there's an error on navigation
class ErrorPage extends StatelessWidget {
  final Exception? error;

  const ErrorPage({Key? key, this.error}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(error != null ? error.toString() : 'Error'),
      ),
    );
  }
}

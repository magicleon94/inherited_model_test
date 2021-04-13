import 'package:flutter/material.dart';
import 'package:inherited_model_test/home.dart';
import 'package:inherited_model_test/state_wrapper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StateWrapper(
      child: MaterialApp(
        home: Home(),
      ),
    );
  }
}

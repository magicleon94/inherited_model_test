import 'dart:math';

import 'package:flutter/material.dart';
import 'package:inherited_model_test/my_inherited_model.dart';
import 'package:inherited_model_test/notifications.dart';

class StateWrapper extends StatefulWidget {
  final Widget child;

  const StateWrapper({Key? key, required this.child}) : super(key: key);
  @override
  _StateWrapperState createState() => _StateWrapperState();
}

class _StateWrapperState extends State<StateWrapper> {
  var isLoading = false;
  var message = 'foo';

  bool _onNotification(MyNotification notification) {
    if (notification is ToggleIsLoadingNotification) {
      isLoading = !isLoading;
    }
    if (notification is ToggleMessageNotification) {
      message = Random().nextInt(100).toString();
    }
    setState(() {});
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<MyNotification>(
      onNotification: _onNotification,
      child: MyInheritedModel(
        isLoading: isLoading,
        message: message,
        child: widget.child,
      ),
    );
  }
}

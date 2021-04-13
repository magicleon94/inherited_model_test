import 'package:flutter/material.dart';

enum MyStateProperties { isLoading, message }

class MyInheritedModel extends InheritedModel<MyStateProperties> {
  final bool isLoading;
  final String message;
  MyInheritedModel(
      {required this.isLoading, required this.message, required Widget child})
      : super(child: child);

  @override
  bool updateShouldNotify(covariant MyInheritedModel oldWidget) {
    return isLoading != oldWidget.isLoading || message != oldWidget.message;
  }

  @override
  bool updateShouldNotifyDependent(covariant MyInheritedModel oldWidget,
      Set<MyStateProperties> dependencies) {
    if (dependencies.contains(MyStateProperties.isLoading)) {
      return isLoading != oldWidget.isLoading;
    }
    if (dependencies.contains(MyStateProperties.message)) {
      return message != oldWidget.message;
    }
    return false;
  }

  static MyInheritedModel? of(BuildContext context, MyStateProperties aspect) {
    return InheritedModel.inheritFrom<MyInheritedModel>(context,
        aspect: aspect);
  }
}

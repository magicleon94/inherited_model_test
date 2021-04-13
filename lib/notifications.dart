import 'package:flutter/material.dart';

abstract class MyNotification extends Notification {}

class ToggleIsLoadingNotification extends MyNotification {}

class ToggleMessageNotification extends MyNotification {}

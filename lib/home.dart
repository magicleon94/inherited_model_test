import 'package:flutter/material.dart';
import 'package:inherited_model_test/my_inherited_model.dart';
import 'package:inherited_model_test/notifications.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inherited model test'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            LoadingWidget(),
            MessageWidget(),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                ToggleIsLoadingNotification().dispatch(context);
              },
              child: Text('Toggle isLoading'),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                ToggleMessageNotification().dispatch(context);
              },
              child: Text('Toggle message'),
            ),
          ],
        ),
      ),
    );
  }
}

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('Rebuilding LoadingWidget');
    return Text(
      MyInheritedModel.of(context, MyStateProperties.isLoading)
              ?.isLoading
              .toString() ??
          'unknown',
    );
  }
}

class MessageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('Rebuilding MessageWidget');
    return Text(
      MyInheritedModel.of(context, MyStateProperties.message)?.message ??
          'unknown',
    );
  }
}

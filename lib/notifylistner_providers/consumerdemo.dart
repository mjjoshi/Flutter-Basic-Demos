import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:untitled1/notifylistner_providers/my_model.dart';

class MainConsumer extends StatelessWidget {
  const MainConsumer({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    MyModel myModel = Provider.of<MyModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              'Current value :${myModel.value}',
            ),
            Consumer<MyModel>(
              builder: (context, model, child) => Column(
                children: <Widget>[
                  Text(
                    'Incremented Value: ${model.value}',
                  ),
                  ElevatedButton(
                    onPressed: () {
                      model.changeValue();
                    },
                    child: const Text('Increment'),
                  ),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}

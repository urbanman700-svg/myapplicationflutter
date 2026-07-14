import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:torch/torch.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Torch App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TorchPage(),
    );
  }
}

class TorchPage extends StatefulWidget {
  @override
  _TorchPageState createState() => _TorchPageState();
}

class _TorchPageState extends State<TorchPage> {
  bool _isTorchOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Torch App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _isTorchOn =!_isTorchOn;
                  if (_isTorchOn) {
                    Torch.turnOn();
                  } else {
                    Torch.turnOff();
                  }
                });
              },
              child: Text(_isTorchOn? 'Turn Off' : 'Turn On'),
            ),
          ],
        ),
      ),
    );
  }
}

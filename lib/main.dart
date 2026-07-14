import 'package:flutter/material.dart';
import 'package:torch_light/torch_light.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Torch App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const TorchPage(),
    );
  }
}

class TorchPage extends StatefulWidget {
  const TorchPage({Key? key}) : super(key: key);

  @override
  _TorchPageState createState() => _TorchPageState();
}

class _TorchPageState extends State<TorchPage> {
  bool _isTorchOn = false;

  Future<void> _toggleTorch() async {
    try {
      if (_isTorchOn) {
        await TorchLight.disableTorch();
      } else {
        await TorchLight.enableTorch();
      }
      setState(() {
        _isTorchOn = !_isTorchOn;
      });
    } catch (e) {
      _showError('Could not toggle torch: $e');
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Torch App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _toggleTorch,
              child: Text(_isTorchOn ? 'Turn Off' : 'Turn On'),
            ),
          ],
        ),
      ),
    );
  }
}

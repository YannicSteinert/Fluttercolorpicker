import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  double x = 0.0, y = 0.0;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Color Picker'),
      ),
      body: Center(
        child: MouseRegion(
          onHover: (details) {
            setState(() {
              widget.x = details.localPosition.dx;
              widget.y = details.localPosition.dy;
            });
          },
          child: Container(
            width: 300,
            height: 200,
            color: Colors.grey,
            child: Stack(
              children: [
                Positioned(
                  left: widget.x,
                  top: widget.y,
                  child: Icon(
                    Icons.circle,
                    size: 15,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nouva Graphics',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 183, 30, 58)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Nouva Graphics'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      // body: Container(
      //     child: const ModelViewer(
      //       src: 'assets/nouva_graphics.glb',
      //       // autoRotate: true,
      //       backgroundColor: Colors.transparent,
      //       // animationDuration: Duration(milliseconds: 1000),
      //     ),
      body: Container(
        width: MediaQuery.of(context).size.width-100,
        height: MediaQuery.of(context).size.height-100,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.5),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: const ModelViewer(
          src: 'assets/nouva_graphics.glb',
          autoRotate: false,
          rotationPerSecond: "30deg", // Adjust rotation speed as needed
        ),
      ),
    );
  }
}

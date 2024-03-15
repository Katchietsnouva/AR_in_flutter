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
      body: Row(
        children: [
          Expanded(
            child: Container(
              color: Colors.grey.withOpacity(0.5),
              child: const ModelViewer(
                src: 'assets/ct_sas.glb',
                autoRotate: false,
                rotationPerSecond: "30deg", // Adjust rotation speed as needed
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.grey.withOpacity(0.5),
              child: const ModelViewer(
                src: 'assets/nouva_graphics.glb',
                autoRotate: false,
                rotationPerSecond: "30deg", // Adjust rotation speed as needed
              ),
            ),
          ),
        ],
      ),
    );
  }
}

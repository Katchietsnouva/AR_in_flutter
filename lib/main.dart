// class MyHomePage extends StatelessWidget {
//   final String title;

//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(title),
//       ),

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
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 183, 30, 58)),
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
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            // Adjust breakpoint as needed
            // Display as a grid with 4 rows and 4 columns
            return GridView.count(
              crossAxisCount: 4,
              children: List.generate(
                16,
                (index) => Container(
                  width: 150,
                  height: 150,
                  margin: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  padding: EdgeInsets.all(20.0),
                  child: const ModelViewer(
                    src: 'assets/nouva_graphics.glb',
                    autoRotate: true,
                    rotationPerSecond:
                        "30deg", // Adjust rotation speed as needed
                  ),
                ),
              ),
            );
          } else {
            // Display as a single column with a scroll view
            return SingleChildScrollView(
              child: Column(
                children: List.generate(
                  16,
                  (index) => Container(
                    width: double.infinity,
                    height: 200,
                    margin: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    padding: EdgeInsets.all(20.0),
                    child: const ModelViewer(
                      src: 'assets/nouva_graphics.glb',
                      autoRotate: true,
                      rotationPerSecond:
                          "30deg", // Adjust rotation speed as needed
                    ),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

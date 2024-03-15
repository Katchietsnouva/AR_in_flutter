import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nouva Graphics',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 183, 30, 58)),
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
    final screenWidth = MediaQuery.of(context).size.width;

    // Determine the number of items per row based on screen width
    final itemsPerRow = screenWidth >= 600 ? 2 : 1;

    // Calculate the width for each item'
    // final itemWidth = screenWidth / itemsPerRow - 16; // Subtracting padding

    // Calculate the width for each item
    final itemWidth = (screenWidth - 16 * (itemsPerRow + 1)) /itemsPerRow; // Adjusted calculation

    // Build a list of ModelViewer widgets
    final models = List.generate(
    6,
    (index) => Container(
      width: itemsPerRow > 1 ? itemWidth : 300, // Adjusted width for portrait mode
      height: itemsPerRow > 1 ? itemWidth : 300, // Adjusted height for portrait mode
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        child: const ModelViewer(
          src: 'assets/nouva_graphics.glb', // Adjust path as needed
          autoRotate: false,
          rotationPerSecond: "30deg",
        ),
      ),
    ),
  );

    // Wrap the list of ModelViewer widgets in a row if there are more than 1 item per row
        // itemsPerRow > 1 ? Row(children: models) : Column(children: models);
  final view = itemsPerRow > 1 
    ? SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children: models),
      ) 
    : SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: models),
      );

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: view,
      ),
    );
  }
}

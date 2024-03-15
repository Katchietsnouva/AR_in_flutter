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
      body: LayoutBuilder(
        builder: (context, constraints) {
          return FutureBuilder(
            future: _buildContainers(),
            builder: (BuildContext context, AsyncSnapshot<List<Widget>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // Return a placeholder widget while waiting for the future to complete
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                // Handle error case
                return Text('Error: ${snapshot.error}');
              } else {
                // Return the UI based on the future result
                return GridView.count(
                  crossAxisCount: 1,
                  children: snapshot.data!,
                );
              }
            },
          );
        },
      ),
    );
  }

  Future<List<Widget>> _buildContainers() async {
    // Simulate a delay of 1 second
    await Future.delayed(Duration(seconds: 1));
    
    // Build and return the list of Container widgets
    return List.generate(
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
          rotationPerSecond: "30deg", // Adjust rotation speed as needed
        ),
      ),
    );
  }
}

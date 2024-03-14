// import 'package:flutter/material.dart';
// import 'package:model_viewer_plus/model_viewer_plus.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Nouva Graphics ',
//       theme: ThemeData(
//         // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         colorScheme:
//             ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 183, 30, 58)),
//         useMaterial3: true,
//       ),
//       // routes:{
//       //   "/" :(context) => MyHomePage(title: title)
//       // },
//       home: const MyHomePage(title: 'Nouva Graphics'),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }



// class MyHomePage extends StatelessWidget {
//   final String title;

//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(title),
//       ),
//       body: Center(
//         child: Container(
//           width: 300,
//           height: 300,
//           decoration: BoxDecoration(
//             color: Colors.white.withOpacity(0.5), // Adjust opacity as needed
//             borderRadius: BorderRadius.circular(20.0), // Add border radius for rounded corners
//           ),
//           padding: EdgeInsets.all(20.0), // Add padding for spacing
//           child: const ModelViewer(
//             src: 'assets/nouva_graphics.glb',
//             autoRotate: true,
//             rotationPerSecond:  "30deg",
//             backgroundColor: Colors.transparent,
//           ),
//         ),
//       ),
//     );
//   }
// }



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
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.5),
            borderRadius: BorderRadius.circular(20.0),
          ),
          padding: EdgeInsets.all(20.0),
          child: const ModelViewer(
            src: 'assets/nouva_graphics.glb',
            autoRotate: true,
            rotationPerSecond: "30deg", // Adjust rotation speed as needed
          ),
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyPainter(),
    );
  }
}

class MyPainter extends StatelessWidget {
  const MyPainter({super.key});
  final height = 32.0;
  final width = 146.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("CustomPaint"),
      ),
      body: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(20),
          ),
          height: height,
          width: width,
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: ClipPath(
                  clipper: RPSCustomPainter(),
                  child: Container(
                    height: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: const Icon(
                      Icons.logout,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RPSCustomPainter extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(size.width * 0.1, 0);
    path0.lineTo(0, size.height);
    path0.lineTo(size.width, size.height);
    path0.lineTo(size.width, 0);
    path0.close();

    return path0;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}

import 'package:flutter/material.dart';

// Home Screen
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: const CustomBottomNavigationBar(),

      body: const Center(child: Text("Home Screen")),
    );
  }
}

// CustomBottomNavigationBar

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        CustomPaint(
          size: Size(screenWidth, 80),
          painter: BottombarPainter(screenWidth),
        ),
        Positioned(
          left: 10,
          bottom: 10,
          child: IconButton(
            icon: const Icon(Icons.place, color: Colors.white, size: 30),
            onPressed: () {},
          ),
        ),
        Positioned(
          right: 10,
          bottom: 10,
          child: IconButton(
            icon: const Icon(Icons.list, color: Colors.white, size: 30),
            onPressed: () {},
          ),
        ),

        // 🟢 Floating Action Button
        Positioned(
          left: (screenWidth / 2) - 28,
          bottom: 10,
          child: Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [Color(0xFF000000), Color(0xFFFFFFFF)],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(3),
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF7582F4),
                      blurRadius: 20,
                      spreadRadius: 4,
                      offset: Offset(0, -4),
                    ),
                  ],
                ),
                child: FloatingActionButton(
                  elevation: 0,

                  onPressed: () {},
                  backgroundColor: Colors.white,
                  shape: const CircleBorder(),
                  child: const Icon(Icons.add, color: Colors.deepPurple),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}


// Custom Paint Of Bottom Navigation Bar

class BottombarPainter extends CustomPainter {
  final double screenWidth;

  BottombarPainter(this.screenWidth);

  @override
  void paint(Canvas canvas, Size size) {
    // Gradient Background
    final Paint backgroundPaint =
        Paint()
          ..shader = LinearGradient(
            colors: [Color(0xFF3A3A6A), Color(0xFF25244C)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ).createShader(Rect.fromLTRB(0, 0, screenWidth, size.height))
          ..style = PaintingStyle.fill;

    Path backgroundPath = Path();
    backgroundPath.moveTo(0, size.height * 0.12);
    backgroundPath.cubicTo(
      0,
      size.height * 0.15,
      screenWidth * 0.2,
      size.height * 0.28,
      screenWidth * 0.33,
      size.height * 0.32,
    );
    backgroundPath.cubicTo(
      screenWidth * 0.39,
      size.height * 0.34,
      screenWidth * 0.43,
      size.height * 0.35,
      screenWidth * 0.5,
      size.height * 0.35,
    );
    backgroundPath.cubicTo(
      screenWidth * 0.57,
      size.height * 0.35,
      screenWidth * 0.61,
      size.height * 0.34,
      screenWidth * 0.67,
      size.height * 0.32,
    );
    backgroundPath.cubicTo(
      screenWidth * 0.8,
      size.height * 0.28,
      screenWidth,
      size.height * 0.12,
      screenWidth,
      size.height * 0.12,
    );
    backgroundPath.lineTo(screenWidth, size.height);
    backgroundPath.lineTo(0, size.height);
    backgroundPath.close();

    canvas.drawPath(backgroundPath, backgroundPaint);

    // **Only Upper Border of Background Path**
    Path upperBorderPath = Path();
    upperBorderPath.moveTo(0, size.height * 0.12);
    upperBorderPath.cubicTo(
      0,
      size.height * 0.15,
      screenWidth * 0.2,
      size.height * 0.28,
      screenWidth * 0.33,
      size.height * 0.32,
    );
    upperBorderPath.cubicTo(
      screenWidth * 0.39,
      size.height * 0.34,
      screenWidth * 0.43,
      size.height * 0.35,
      screenWidth * 0.5,
      size.height * 0.35,
    );
    upperBorderPath.cubicTo(
      screenWidth * 0.57,
      size.height * 0.35,
      screenWidth * 0.61,
      size.height * 0.34,
      screenWidth * 0.67,
      size.height * 0.32,
    );
    upperBorderPath.cubicTo(
      screenWidth * 0.8,
      size.height * 0.28,
      screenWidth,
      size.height * 0.12,
      screenWidth,
      size.height * 0.12,
    );

    final Paint upperBorderPaint =
        Paint()
          ..color = Color(0xff545cab)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1;

    canvas.drawPath(upperBorderPath, upperBorderPaint);

    // Gradient for Curve Path
    final Paint buttonPaint =
        Paint()
          ..shader = LinearGradient(
            colors: [
              Color(0xFF262C51),
              Color(0xFF3E3F74),
            ], // Blue to Dark Purple
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ).createShader(Rect.fromLTRB(0, 0, screenWidth, size.height))
          ..style = PaintingStyle.fill;

    Path buttonPath = Path();
    buttonPath.moveTo(screenWidth * 0.44, 0);
    buttonPath.lineTo(screenWidth * 0.56, 0);
    buttonPath.cubicTo(
      screenWidth * 0.64,
      0,
      screenWidth * 0.65,
      size.height * 0.20,
      screenWidth * 0.69,
      size.height * 0.55,
    );
    buttonPath.cubicTo(
      screenWidth * 0.71,
      size.height * 0.74,
      screenWidth * 0.74,
      size.height,
      screenWidth * 0.83,
      size.height,
    );
    buttonPath.lineTo(screenWidth * 0.17, size.height);
    buttonPath.cubicTo(
      screenWidth * 0.26,
      size.height,
      screenWidth * 0.29,
      size.height * 0.74,
      screenWidth * 0.31,
      size.height * 0.55,
    );
    buttonPath.cubicTo(
      screenWidth * 0.34,
      size.height * 0.24,
      screenWidth * 0.36,
      0,
      screenWidth * 0.44,
      0,
    );
    buttonPath.close();

    canvas.drawPath(buttonPath, buttonPaint);

    // **Button Path Border**
    final Paint buttonBorderPaint =
        Paint()
          ..color = Color(0xff545cab)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1;

    canvas.drawPath(buttonPath, buttonBorderPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:well_me/check.dart';

class WaveAnimation extends StatefulWidget {
  const WaveAnimation({
    super.key,
    required this.check,
    required this.glassDrank,
    required this.glassLimit,
  });

  final bool check;
  final int glassDrank;
  final int glassLimit;

  @override
  State<WaveAnimation> createState() => _WaveAnimationState();
}

class _WaveAnimationState extends State<WaveAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<List<Offset>> waves;

  int counter = 0;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 5))
          ..repeat(reverse: false);
    waves = controller.drive(TweenWave(100, 20));
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  incrementCounter() {
    setState(() {
      counter = counter + 10;
    });
    if (counter > 100) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.white,
        content: Text(
          'Goal Achieved',
          style: TextStyle(color: Colors.black),
        ),
      ));
      counter = 100;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.check) {
      counter = 0;
    } else {
      counter = widget.glassDrank * 10;
    }

    return Container(
      height: 530,
      child: Stack(
        children: [
          Positioned.fill(
            child: TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: counter.toDouble()),
              duration: const Duration(seconds: 1),
              builder: (context, value, child) {
                return FractionallySizedBox(
                  heightFactor: (value / 100).clamp(0, 1).toDouble(),
                  alignment: Alignment.bottomCenter,
                  child: ClipPath(
                    clipper: WaveClipperDesign(waves),
                    child: CustomPaint(
                      painter: WavePainterDesign(),
                    ),
                  ),
                );
              },
            ),
          ),
          Center(
            child: Text(
              widget.check
                  ? '$counter%'
                  : (widget.glassDrank * 100 / widget.glassLimit).toString() +
                      "%",
              style: const TextStyle(
                fontSize: 120,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          if (widget.check)
            Positioned(
              bottom: 16,
              right: 16,
              child: ElevatedButton.icon(
                onPressed: incrementCounter,
                icon: const Icon(
                  Icons.water_drop,
                  color: Colors.blue,
                ),
                label: const Text(
                  'Add Water',
                  style: TextStyle(color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class WaveClipperDesign extends CustomClipper<Path> {
  WaveClipperDesign(this.waves) : super(reclip: waves);
  Animation<List<Offset>> waves;

  @override
  Path getClip(Size size) {
    var w = size.width;
    var h = size.height;

    final points = waves.value.map((e) => Offset(e.dx * w, e.dy)).toList();
    return Path()
      ..moveTo(0, h) // Move to the bottom left
      ..addPolygon(points, false)
      ..lineTo(w, h) // Ensure a straight line to the bottom right
      ..lineTo(w, h)
      ..lineTo(0, h) // Ensure a straight line to the bottom left
      ..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class WavePainterDesign extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Offset.zero & size;

    // Define the gradients for each layer of waves
    final Gradient gradient1 = LinearGradient(
      colors: [
        Colors.blue.shade700.withOpacity(0.8),
        Colors.blue.shade400.withOpacity(0.7),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );

    final Gradient gradient2 = LinearGradient(
      colors: [
        Colors.blue.shade600.withOpacity(0.8),
        Colors.blue.shade300.withOpacity(0.7),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );

    final Gradient gradient3 = LinearGradient(
      colors: [
        Colors.blue.shade500.withOpacity(0.8),
        Colors.blue.shade200.withOpacity(0.7),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );

    final paint1 = Paint()..shader = gradient1.createShader(rect);
    final paint2 = Paint()..shader = gradient2.createShader(rect);
    final paint3 = Paint()..shader = gradient3.createShader(rect);

    // Draw three layers of waves
    _drawWave(canvas, size, paint1, 0);
    _drawWave(canvas, size, paint2, 10);
    _drawWave(canvas, size, paint3, 20);
  }

  void _drawWave(Canvas canvas, Size size, Paint paint, double offset) {
    final Path path = Path();
    final double width = size.width;
    final double height = size.height;
    final double waveHeight = height / 4;
    final double waveLength = width / 2;

    path.moveTo(0, height);
    for (double x = 0; x <= width; x += waveLength) {
      path.quadraticBezierTo(
        x + waveLength / 4,
        height - waveHeight - offset,
        x + waveLength / 2,
        height,
      );
      path.quadraticBezierTo(
        x + 3 * waveLength / 4,
        height + waveHeight - offset,
        x + waveLength,
        height,
      );
    }
    path.lineTo(width, height);
    path.lineTo(width, 0);
    // path.lineTo(0, width);
    path.lineTo(0, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class TweenWave extends Animatable<List<Offset>> {
  TweenWave(this.count, this.height);

  final int count;
  final double height;
  static const waveCount = 3;
  @override
  List<Offset> transform(double t) {
    return List<Offset>.generate(count, (index) {
      final ratio = index / (count - 1);
      final waveHeight = 1 - (0.5 - ratio).abs() * 2;
      return Offset(
          ratio,
          waveHeight * height * sin(waveCount * (ratio + t) * pi * 2) +
              height * waveHeight);
    }, growable: false);
  }
}

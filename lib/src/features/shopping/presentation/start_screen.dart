import 'package:flutter/material.dart';
import 'dart:math' show pi, sin, cos;
import 'package:my_project_baws/src/features/shopping/presentation/home_screen.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 15)).then((_) => Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen())));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: ShimmeringText('We are here for you !'),
      ),
      body: Stack(
        children: [
          AnimatedBackground(child: AnimatedWawbaws()),
          Positioned(
            right: 16,
            bottom: 16,
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              child: const Text(
                'Go to Home',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ShimmeringText extends StatefulWidget {
  final String text;

  ShimmeringText(this.text);

  @override
  _ShimmeringTextState createState() => _ShimmeringTextState();
}

class _ShimmeringTextState extends State<ShimmeringText> with SingleTickerProviderStateMixin {
  late AnimationController _shimmerController;

  @override
  void initState() {
    super.initState();
    _shimmerController = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _shimmerController,
      builder: (context, child) {
        return ShaderMask(
          shaderCallback: (bounds) {
            return LinearGradient(
              colors: [Colors.white, Colors.blue, Colors.white],
              stops: [0.0, _shimmerController.value, 1.0],
              tileMode: TileMode.clamp,
            ).createShader(bounds);
          },
          child: Text(
            widget.text,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _shimmerController.dispose();
    super.dispose();
  }
}

class AnimatedBackground extends StatefulWidget {
  final Widget child;

  AnimatedBackground({required this.child});

  @override
  _AnimatedBackgroundState createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.lerp(Colors.blue[900], Colors.purple[900], _controller.value)!,
                Color.lerp(Colors.purple[900], Colors.red[900], _controller.value)!,
              ],
            ),
          ),
          child: widget.child,
        );
      },
    );
  }
}

class AnimatedWawbaws extends StatefulWidget {
  const AnimatedWawbaws({Key? key}) : super(key: key);

  @override
  _AnimatedWawbawsState createState() => _AnimatedWawbawsState();
}

class _AnimatedWawbawsState extends State<AnimatedWawbaws> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..repeat();
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildAnimatedText('Welcome', Colors.blue[300]!, 64),
          SizedBox(height: 20),
          _buildAnimatedText('to', Colors.green[300]!, 48),
          SizedBox(height: 20),
          _buildAnimatedText('Wawbaws', Colors.red[300]!, 72),
        ],
      ),
    );
  }

  Widget _buildAnimatedText(String text, Color color, double fontSize) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateX(sin(_animation.value * 2 * pi) * 0.1)
            ..rotateY(cos(_animation.value * 2 * pi) * 0.1),
          alignment: FractionalOffset.center,
          child: Text(
            text,
            style: TextStyle(
              fontSize: fontSize,
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      },
    );
  }
}
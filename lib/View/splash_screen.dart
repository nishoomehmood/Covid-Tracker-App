import 'dart:async';
import 'world_states_screen.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{

  late final AnimationController _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this)..repeat();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

 @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 6), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const WorldStates()));
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:  [
            AnimatedBuilder(
                animation: _controller,
                builder: (BuildContext context, Widget? child)
                {
                  return Transform.rotate(angle: _controller.value * 2.0 * math.pi,
                    child: child,
                  );
                },
                child: Center(
                  child: Container(
                    height: 200,
                    width: 200,
                    child: const Image(image: AssetImage('images/virus.png'),),
                  ),
                )
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.08,),
            const Align(
              alignment: Alignment.center,
              child: Text("Covid-19\nTracker App", textAlign: TextAlign.center, style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),),
            ),
          ],
        ),
      ),
    );
  }
}

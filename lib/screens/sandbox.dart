import 'package:flutter/material.dart';

class SandBox extends StatefulWidget {
  const SandBox({Key? key}) : super(key: key);

  @override
  State<SandBox> createState() => _SandBoxState();
}

class _SandBoxState extends State<SandBox> {
  double opacity = 1;
  double width = 200;
  double margin = 0;
  Color color = Colors.orange;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedOpacity(
        duration: const Duration(seconds: 1),
        opacity: opacity,
        child: AnimatedContainer(
          duration: const Duration(seconds: 1),
          margin: EdgeInsets.all(margin),
          width: width,
          color: color,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      margin = 90.0;
                    });
                  },
                  child: const Text("Animate margin")),
              ElevatedButton(
                  onPressed: () => setState(() => width = 400),
                  child: const Text("Animate width")),
              ElevatedButton(
                onPressed: () => setState(() => color = Colors.teal),
                child: const Text(
                  "Animate Color",
                ),
              ),
              ElevatedButton(
                  onPressed: () => setState(() => opacity = 0),
                  child: const Text('Hide this Container'))
            ],
          ),
        ),
      ),
    );
  }
}

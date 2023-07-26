import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyWidget(),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  Timer? timerr;
  Duration duration = const Duration(seconds: 0);

  bool isRunning = true;

  changetime() {
    timerr = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        int newchange = duration.inSeconds + 1;
        duration = Duration(seconds: newchange);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 29, 27, 27),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(15),
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white),
                    child: Text(
                      duration.inHours.remainder(60).toString().padLeft(2, "0"),
                      style: const TextStyle(
                          fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Text(
                    "Hours",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(15),
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white),
                    child: Text(
                      duration.inMinutes
                          .remainder(60)
                          .toString()
                          .padLeft(2, "0"),
                      style: const TextStyle(
                          fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Text(
                    "minutes",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(15),
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white),
                    child: Text(
                      duration.inSeconds
                          .remainder(60)
                          .toString()
                          .padLeft(2, "0"),
                      style: const TextStyle(
                          fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Text(
                    "Seconds",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          isRunning
              ? ElevatedButton(
                  onPressed: () {
                    changetime();
                    setState(() {
                      isRunning = false;
                    });
                  },
                  child: const Text("Start Timer"),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Color.fromARGB(255, 219, 119, 112))),
                      onPressed: () {
                        setState(() {
                          if (timerr!.isActive) {
                            timerr!.cancel();
                          } else {
                            changetime();
                          }
                        });
                      },
                      child: Text(
                        (timerr!.isActive) ? "Stop Timer" : "Resum",
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Color.fromARGB(255, 219, 119, 112))),
                      onPressed: () {
                        timerr!.cancel();
                        setState(() {
                          duration = const Duration(seconds: 0);
                          isRunning = true;
                        });
                      },
                      child: const Text("Cansel"),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}

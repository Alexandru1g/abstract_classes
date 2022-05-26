import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;

extension Log on Object {
  void log() => devtools.log(toString());
}

enum Animal { cat, dog }

abstract class CanRun {
  final Animal type;
  const CanRun({
    required this.type,
  });

  @mustCallSuper
  void run() {
    "CanRun's run function is called".log();
  }
}

class Cat extends CanRun {
  const Cat() : super(type: Animal.cat);

  @override
  void run() {
    super.run();
    'Cat running'.log();
  }
}

class Dog extends CanRun {
  const Dog() : super(type: Animal.dog);
}

void testIt() {
  const cat = Cat();
  cat.type.log();
  const dog = Dog();
  dog.type.log();
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    testIt();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Homepage(),
    );
  }
}

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Home Page"),
        ),
      ),
    );
  }
}

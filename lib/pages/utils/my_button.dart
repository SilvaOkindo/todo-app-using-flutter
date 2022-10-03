import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {

  final String name;
  VoidCallback onPressed;

  MyButton({Key? key,
    required this.name,
    required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: onPressed,
        child: Text(name),
        color: Theme.of(context).primaryColor,
    );
  }
}

import 'package:flutter/material.dart';

class ButtonOutline extends StatelessWidget {
  const ButtonOutline({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: 120,
      decoration: BoxDecoration(
        color: Colors.indigo[100],
        border: Border.all(color: Colors.indigo),
        borderRadius: BorderRadius.circular(5),
      ),
      child: const Center(child: Text('Meal')),
    );
  }
}

class Button extends StatelessWidget {
  const Button({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: 120,
      decoration: BoxDecoration(
        color: Colors.indigo,
        borderRadius: BorderRadius.circular(5),
      ),
      child: const Center(
        child: Text(
          'Meal',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

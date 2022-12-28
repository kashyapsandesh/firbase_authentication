import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  final VoidCallback onPress;
  const CustomBackButton({super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
              ),
              borderRadius: BorderRadius.circular(10)),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios_sharp),
            onPressed: onPress,
          ),
        ),
      ),
    );
  }
}

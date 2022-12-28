import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final TextEditingController myController;
  final String hintText;
  final bool? isPassword;
  const InputField(
      {super.key,
      required this.myController,
      required this.hintText,
      required this.isPassword});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        keyboardType: isPassword!
            ? TextInputType.visiblePassword
            : TextInputType.emailAddress,
        enableSuggestions: isPassword! ? false : true,
        autocorrect: isPassword! ? false : true,
        obscureText: isPassword ?? true,
        controller: myController,
        decoration: InputDecoration(
            suffixIcon: isPassword!
                ? IconButton(
                    onPressed: () {
                     
                    },
                    icon: Icon(Icons.remove_red_eye),
                  )
                : null,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            fillColor: Color.fromARGB(255, 247, 247, 247),
            filled: true,
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
  
  void setState(Null Function() param0) {}
}

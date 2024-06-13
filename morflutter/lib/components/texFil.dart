import 'package:flutter/material.dart';

class niceTextField extends StatefulWidget {
  final String dataRequired;
  final TextEditingController textController;
  const niceTextField(
      {super.key, required this.dataRequired, required this.textController});

  @override
  State<niceTextField> createState() => _niceTextFieldState();
}

class _niceTextFieldState extends State<niceTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.purple[100], borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: TextField(
            controller: widget.textController,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: widget.dataRequired,
                hintStyle: TextStyle(color: Colors.purple[300])),
          ),
        ),
      ),
    );
  }
}

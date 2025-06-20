import 'package:flutter/material.dart';

class CustomCodeBox extends StatelessWidget {
  final TextEditingController controller;
  final double width;
  final FocusNode focusNode;
  final FocusNode? nextNode;
  final FocusNode? prevNode;

  const CustomCodeBox({
    super.key,
    required this.controller,
    required this.width,
    required this.focusNode,
    this.nextNode,
    this.prevNode,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        textAlign: TextAlign.center,
        maxLength: 1,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          counterText: "",
          border: OutlineInputBorder(),
        ),
        onChanged: (value) {
          if (value.isNotEmpty) {
            if (nextNode != null) {
              FocusScope.of(context).requestFocus(nextNode);
            } else {
              focusNode.unfocus();
            }
          }
        },
        onSubmitted: (_) {
          if (nextNode != null) {
            FocusScope.of(context).requestFocus(nextNode);
          }
        },
        onEditingComplete: () {
          if (controller.text.isEmpty && prevNode != null) {
            FocusScope.of(context).requestFocus(prevNode);
          }
        },
      ),
    );
  }
}

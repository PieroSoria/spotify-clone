import 'package:flutter/material.dart';

class InputCustomFiled extends StatefulWidget {
  final TextEditingController controller;
  final EdgeInsets padding;
  final Widget? icons;
  final bool ispassword;
  final String? label;
  const InputCustomFiled({
    super.key,
    required this.controller,
    required this.padding,
    this.icons,
    this.ispassword = false,
    this.label,
  });

  @override
  State<InputCustomFiled> createState() => _InputCustomFiledState();
}

class _InputCustomFiledState extends State<InputCustomFiled> {
  late bool isvisible;

  @override
  void initState() {
    isvisible = widget.ispassword;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.ispassword ? isvisible : false,
        decoration: InputDecoration(
          label: widget.label != null ? Text(widget.label!) : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(60),
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
          suffixIcon: widget.icons ??
              GestureDetector(
                onTap: () {
                  setState(() {
                    isvisible = !isvisible;
                  });
                },
                child: isvisible
                    ? const Icon(Icons.remove_red_eye_outlined)
                    : const Icon(Icons.visibility_off_outlined),
              ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginTextField extends StatelessWidget {
  const LoginTextField({
    super.key,
    required this.controller,
    required this.hint,
    required this.heightTextField,
    required this.keyboardType,
  });

  final TextEditingController controller;
  final String hint;
  final double heightTextField;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      minLines: null,
      maxLines: null,
      expands: true,
      style: TextStyle(
        color: Colors.black,
        fontFamily: 'poppins',
        fontSize: 15,
        fontWeight: FontWeight.w400,
      ),
      cursorColor: Colors.orange,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 22.h),
        constraints: BoxConstraints(
          minHeight: heightTextField.h,
          maxHeight: heightTextField.h,
        ),
        counterText: "",
        fillColor: Colors.white,
        filled: true,
        hintText: hint,
        hintStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16,
          fontFamily: 'poppins',
          color: Color(0xFF9C9F9E),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(color: Colors.orange, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(color: Colors.orange, width: 2),
        ),
      ),
    );
  }
}

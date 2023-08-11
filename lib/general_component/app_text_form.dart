import 'package:flutter/material.dart';
import 'package:medsur_app/styles/colors.dart';

class AppTextForm extends StatefulWidget {
  const AppTextForm(
      {Key? key,
      this.label,
      this.controller,
      this.hintText,
      this.validator,
      this.onSaved,
      this.type,
      this.maxLength = 130,
      this.textArea})
      : super(key: key);
  final Widget? label;
  final TextEditingController? controller;
  final String? hintText;
  final Function(String?)? validator;
  final Function(String?)? onSaved;
  final String? type;
  final bool? textArea;
  final int maxLength;

  @override
  _AppTextFormState createState() => _AppTextFormState();
}

class _AppTextFormState extends State<AppTextForm> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 8,
      maxLength: widget.maxLength,
      controller: widget.controller,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryGreen, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey7, width: 1.5),
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.grey7, width: 1.5),
        ),
        errorStyle: TextStyle(
          fontSize: 8,
          fontFamily: 'Montserrat',
        ),
        labelStyle: TextStyle(
          color: AppColors.grayColor, fontFamily: 'Montserrat',
          // fontWeight: FontWeight.w500,
          fontSize: 12,
        ),
      ),
      validator: widget.validator as String? Function(String?)?,
      onSaved: widget.onSaved,
      keyboardType: TextInputType.text,
    );
  }
}

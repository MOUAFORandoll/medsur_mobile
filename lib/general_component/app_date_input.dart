import 'package:flutter/material.dart';
import 'package:medsur_app/styles/colors.dart';
import 'package:medsur_app/utils/validators.dart'; 

class AppDateInput extends StatefulWidget {
  final TextEditingController controller;
  final String? Function(String? value)? validator;
  final String label;
  final String? errorText;
  String? placeholder;

  AppDateInput({
    Key? key,
    required this.controller,
    required this.label,
    this.validator,
    this.placeholder,
    this.errorText,
  }) : super(key: key);

  @override
  State<AppDateInput> createState() => _AppDateInputState();
}

class _AppDateInputState extends State<AppDateInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      style: const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 14,
      ),
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        errorText: widget.errorText,
        labelText: widget.label,
        hintText: widget.placeholder,
        suffixIcon: IconButton(
          onPressed: () async {
            final date = await showDatePicker(
                context: context,
                firstDate: DateTime(1900),
                initialDate: DateTime.now(),
                lastDate: DateTime(2100));
            if (date != null) {
              setState(() {
                widget.placeholder = date.year.toString() +
                    "/" +
                    date.month.toString() +
                    "/" +
                    date.day.toString();
              });
            }
          },
          icon: Icon(
            Icons.date_range_rounded,
            color: AppColors.hexToColor("#32325D"),
          ),
        ),
      ),
      validator: (value) {
        return Validators.isValidDate(widget.placeholder);
      },
      keyboardType: TextInputType.datetime,
    );
  }
}

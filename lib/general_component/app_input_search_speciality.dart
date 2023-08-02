import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsur_app/constants/index_common.dart';

class AppInputSearchSpeciality extends StatelessWidget {
  final controller;
  final String? label;
  final String? errorText;
  final bool status;
  final String? placeholder;
  final ValueChanged<String>? onChanged;
  final bool obscureText;
  final bool border;
  final TextInputType? textInputType;
  AppInputSearchSpeciality({
    Key? key,
    this.controller,
    this.label,
    this.placeholder,
    this.status = false,
    this.errorText,
    this.onChanged,
    this.obscureText = false,
    this.border = false,
    this.textInputType,
  });

  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Container(

        // height: kSmHeight,
        decoration: BoxDecoration(
          color: AppColors.whitecolor,
          borderRadius: BorderRadius.circular(10),
          border: border
              ? Border.all(color: AppColors.grey7, width: 1.5)
              : Border.all(),
        ),
        child: TextField(
          // autofocus: false,
          controller: controller,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontFamily: 'Montserrat',
            fontSize: kMdText,
          ),
          onChanged: onChanged,
          decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 2.0, horizontal: 15.0),
              border: OutlineInputBorder(
                gapPadding: 1.0, borderSide: BorderSide.none,
                // borderSide: BorderSide(
                //   color: AppColors.grey2,
                //   width: 0.8,
                //   style: BorderStyle.solid,
                // ),
                borderRadius: BorderRadius.circular(10),
              ),
              errorText: errorText,
              labelText: label,
              hintText: placeholder,
              hintStyle: const TextStyle(
                fontWeight: FontWeight.w500,
                color: AppColors.grey2,
                fontFamily: 'Montserrat',
                fontSize: 12,
              ),
              suffixIcon: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  color: AppColors.grey2,
                ),
              )),
          obscureText: isVisible,
          keyboardType: textInputType,
        ));
  }
}

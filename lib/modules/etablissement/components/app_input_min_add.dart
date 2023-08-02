import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants/index_common.dart';
import 'package:flutter/cupertino.dart';

class AppInputMinAdd extends StatefulWidget {
  final TextEditingController controller;
  final String? Function(String? value)? validator;
  final String label;
  final String? errorText;
  final String? placeholder;
  final ValueChanged<String>? onChanged;
  final bool enableButtonM;
  final TextInputType? textInputType;
  final Icon? icon;
  final remove;
  final add;

  const AppInputMinAdd(
      {Key? key,
      required this.controller,
      required this.label,
      this.validator,
      this.placeholder,
      this.errorText,
      required this.remove,
      required this.add,
      this.onChanged,
      this.enableButtonM = true,
      this.textInputType,
      this.icon})
      : super(key: key);

  @override
  State<AppInputMinAdd> createState() => _AppInputMinAddState();
}

class _AppInputMinAddState extends State<AppInputMinAdd> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: widget.errorText!.length == 0
                    ? AppColors.grey7
                    : AppColors.red,
                width: 1.5),
          ),
          height: 45,
          // width: kWidth / 2.5,
          child: Row(
            children: [
              Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.all(kMarginX / 4),
                  child: InkWell(
                    child: SvgPicture.asset(
                      Assets.squaredminus,
                      width: 30,
                      height: 30,
                      color: widget.enableButtonM
                          ? AppColors.primaryGreen
                          : AppColors.lightGrey,
                    ),
                    onTap: widget.remove,
                  )),
              Container(
                  width: kWidth / 4,
                  // alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(bottom: kMarginY),
                  child: TextFormField(
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(
                          r'^\d+(\.\d+)?$')), // Autoriser uniquement les chiffres
                      LengthLimitingTextInputFormatter(
                          5), // Limiter la longueur maximale à 4 caractères
                      TextInputFormatter.withFunction((oldValue, newValue) {
                        if (newValue.text.length > 5) {
                          // Si la valeur contient plus de 4 caractères
                          final newNumericValue = int.tryParse(newValue.text
                              .substring(
                                  0, 5)); // Récupérer les 3 premiers chiffres
                          return TextEditingValue(
                            text: newNumericValue != null
                                ? newNumericValue.toString()
                                : '', // Si les 3 premiers caractères sont numériques, les conserver, sinon supprimer la valeur
                            selection: TextSelection.collapsed(
                                offset: newNumericValue
                                    .toString()
                                    .length), // Définir la position du curseur à la fin du texte
                          );
                        }
                        return newValue;
                      }),
                    ],
                    autofocus: false,
                    controller: widget.controller,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: kMediumText,
                      fontFamily: 'Montserrat',
                    ),
                    cursorHeight: 20,
                    // expands: true,
                    textAlign: TextAlign.center,
                    onChanged: widget.onChanged,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        enabledBorder:
                            OutlineInputBorder(borderSide: BorderSide.none),
                        // errorText: widget.errorText,
                        // errorStyle: TextStyle(
                        //   fontSize: 8,
                        //   fontFamily: 'Montserrat',
                        // ),
                        labelText: widget.label,
                        labelStyle: TextStyle(
                          color: AppColors.grayColor, fontFamily: 'Montserrat',
                          // fontWeight: FontWeight.w500,
                          fontSize: kSmText,
                        ),
                        hintText: widget.placeholder,
                        suffixIcon: widget.icon),
                    validator: widget.validator,
                    keyboardType: widget.textInputType,
                  )),
              Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.all(kMarginX / 4),
                  child: InkWell(
                    child: SvgPicture.asset(
                      Assets.squaredplus,
                      width: 30,
                      height: 30,
                      color: AppColors.primaryGreen,
                    ),
                    onTap: widget.add,
                  )),
            ],
          )),
      if (widget.errorText!.length != 0)
        Container(
          width: kWidth * .45,
          child: Text(widget.errorText!,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 8,
                color: AppColors.red,
                fontFamily: 'Montserrat',
              )),
        )
    ]);
  }
}

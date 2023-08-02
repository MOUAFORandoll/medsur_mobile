import 'package:flutter/material.dart';
import 'package:medsur_app/styles/colors.dart';
import 'package:medsur_app/styles/dimension.dart';

class AppButton extends StatelessWidget {
  final Color bgColor;
  final Color textColor;
  final String text;
  final Widget? leading;
  final VoidCallback? onTap;
  final bool disabled;
  final bool shadow;
  final double? width;
  final MainAxisSize size;
  final BoxBorder? border;
  AppButton({
    Key? key,
    required this.text,
    this.bgColor = AppColors.primaryGreen,
    this.textColor = Colors.white,
    this.onTap,
    this.leading,
    this.border,
    this.shadow = true,
    this.disabled = false,
    this.width,
    this.size = MainAxisSize.min,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: disabled ? null : onTap,
      child: Container(
        constraints: const BoxConstraints(minHeight: 56),
        width: width,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
            boxShadow: shadow
                ? [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: Offset(0, 1),
                    ),
                  ]
                : null,
            borderRadius: BorderRadius.circular(10),
            color: disabled ? bgColor.withOpacity(.5) : bgColor,
            border: border),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: size,
          children: [
            if (leading != null)
              Padding(
                padding: const EdgeInsets.only(right: 5.0),
                child: leading!,
              ),
            Text(
              text,
              style: TextStyle(
                fontFamily: 'Montserrat',
                color: disabled ? textColor.withOpacity(.5) : textColor,
                fontWeight: FontWeight.w600,
                fontSize: kMediumText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

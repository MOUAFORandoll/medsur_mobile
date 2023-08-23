import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:medsur_app/styles/colors.dart';

Widget buildNoContentListWidget({String? value}) {
  return EmptyList(
    '${value}',
    subTitle: 'Module ${value} seras disponible bientot.',
  );
}

class EmptyList extends StatelessWidget {
  EmptyList(this.title, {this.subTitle});

  final String? subTitle;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Center(
      child: NotifyText(
        title: title,
        subTitle: subTitle,
      ),
    ));
  }
}

class NotifyText extends StatelessWidget {
  final String? subTitle;
  final String? title;
  const NotifyText({Key? key, this.subTitle, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TitleText(title ?? "", fontSize: 20, textAlign: TextAlign.center),
        SizedBox(
          height: 20,
        ),
        TitleText(
          subTitle ?? "",
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppColors.grey1,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class TitleText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final TextOverflow overflow;
  const TitleText(
    this.text, {
    Key? key,
    this.fontSize = 18,
    this.color = AppColors.primaryBlue,
    this.fontWeight = FontWeight.w800,
    this.textAlign = TextAlign.left,
    this.overflow = TextOverflow.visible,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
      textAlign: textAlign,
      overflow: overflow,
    );
  }
}

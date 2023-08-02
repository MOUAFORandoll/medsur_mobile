import 'package:flutter/material.dart';
import 'package:medsur_app/constants/index_common.dart';

// ignore: must_be_immutable
class AppbtnHome extends StatelessWidget {
  String libelle = '';
  var image;
  // var select;
  final bool status;

  var onTap;
  AppbtnHome({
    required this.libelle,
    this.status = false,
    required this.image,
    required this.onTap,
    /*  required this.select */
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: status
          ? Container(
              height: kSmHeight * 1.8,
              width: kSmWidth * .575,
              // padding: EdgeInsets.all(kMarginX / 2),
              margin: EdgeInsets.symmetric(
                  vertical: kMarginY, horizontal: kMarginX * .01),
              decoration: BoxDecoration(
                  // gradient: GradientApp.blueG,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.grayColor.withOpacity(0.3),
                      spreadRadius: 2.9,
                      blurRadius: 2.8,
                      offset: Offset(0, 5),
                    ),
                  ],
                  color: /* select ? AppColors.secondarytext : */ Colors.white,
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: kSmHeight,
                      width: kSmWidth / 4.2,
                      child: Image.asset(image, fit: BoxFit.contain),
                    ),
                    // Container(
                    //     // decoration: BoxDecoration(
                    //     //   color: ColorsApp.greySecond,
                    //     // ),
                    //     //  alignment: Alignment.center,
                    //     padding: EdgeInsets.all(10),
                    //     child: Icon(
                    //       Icons.home,
                    //     )),
                    Container(
                      width: kSmWidth,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(
                        top: kMarginY,
                      ),
                      child: Text(libelle,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: AppColors.secondaryBlue,
                              fontSize: kSmText * .7,
                              fontWeight: FontWeight.bold)),
                    ),
                  ]))
          : SizedBox(height: 0, width: 0),
    );
  }
}

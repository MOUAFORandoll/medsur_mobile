import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsur_app/constants/index_common.dart';
import 'package:medsur_app/styles/dimension.dart';
import '../../../constants/assets.dart';

class DashboxComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.blackcolor, width: 2)),
        padding: EdgeInsets.symmetric(horizontal: kMarginX, vertical: kMarginY),
        //  margin:EdgeInsets.symmetric(horizontal: kMarginX,vertical:  kMarginY)  ,

        child: Column(
          children: [
            //  Container(

            //             margin: EdgeInsets.only(top:kMarginY),
            //             child:     Image.asset(Assets.logoMedium ),
            //          ),
            Text('Dashboard')
          ],
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsur_app/constants/index_common.dart';
import 'package:medsur_app/general_component/app_text_title.dart';
import 'package:medsur_app/general_component/app_text_wrap.dart';
import 'package:medsur_app/styles/dimension.dart';
import '../../../constants/assets.dart';

class AppCarrousselItem extends StatelessWidget {
  var title, description,  image, index = 0;
  AppCarrousselItem(
      {required this.title,
      required this.description,
      required this.image, 
      this.index = 0});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: index == 1 ? AppColors.blue : AppColors.green,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Column(
        children: [
          Container(
            color: Colors.white,
            padding: EdgeInsets.only(
                left: kMarginX * 3, right: kMarginX * 3, top: kMarginX * 2.5),
            // margin: EdgeInsets.symmetric(
            //     vertical: kMarginY, horizontal: kMarginX * 3),
            child: Image.asset(
              image,
              height: kMdHeight / 3,
            ),
          ),
        
          Container(
            decoration: BoxDecoration(
              color: index == 1 ? AppColors.blue : AppColors.green,
              border: Border(top: BorderSide.none),
            ),

            // margin: EdgeInsets.symmetric(
            //     vertical: kMarginY, horizontal: kMarginX * 3),
            child: Column(
              children: [
                Container(
                    padding: EdgeInsets.all(kMarginX),
                    // margin: EdgeInsets.symmetric(
                    //     vertical: kMarginY, horizontal: kMarginX * 3),
                    child: AppTextWrap(
                      text: title,
                      bolder: true,
                    )),
                Container(
                    padding: EdgeInsets.all(kMarginX),
                    // margin: EdgeInsets.symmetric(
                    //     vertical: kMarginY, horizontal: kMarginX * 3),
                    child: Text(description,
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(color: Colors.white, fontSize: kLgText))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

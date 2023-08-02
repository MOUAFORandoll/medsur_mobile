import 'package:get/get.dart';
import 'package:flutter/material.dart'; 
import 'package:medsur_app/general_component/app_text_title_noe.dart';
import 'package:medsur_app/utils/routing.dart';
import '../../../constants/index_common.dart'; 
import 'package:medsur_app/general_component/index_widgets.dart';
import 'package:medsur_app/modules/auth/controller/auth_controller.dart';
 

class SuccessPasswordView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>(); 
    return GetBuilder<AuthController>(
        builder: (authCont) => Container(
            decoration: PageStyle.decoration,
            child: Scaffold(
              appBar: AppBar(
                  
                  backgroundColor: Colors.transparent,
                  elevation: 0),
              body: SafeArea(
                child: Padding(
                  
                  padding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: kMarginX),
                  child: SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Container(
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.symmetric(
                                vertical: kMarginY * 4,
                              ),
                              child: AppTextTitleNoE(
                                text: 'succestitle'.tr,
                                bolder: true,
                                center: true,
                                big: true,
                              )),
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.primaryGreen,
                            
                              borderRadius: BorderRadius.circular(60),
                            ),
                            margin: EdgeInsets.symmetric(
                              vertical: kMarginY * 4,
                            ),
                            padding: EdgeInsets.all(kMarginY * 1.5),
                            child: Icon(Icons.check,
                                color: Colors.white, size: 40.0),
                          ),
                          Container(
                              margin: EdgeInsets.symmetric(
                                vertical: kMarginY * 2,
                              ),
                              child: Text('successdescription'.tr,
                                  textAlign: TextAlign.center,
                                  
                                  style: TextStyle(

                                              fontSize: kMediumText,
                                      
                                      color: AppColors.secondarytext))),
                          Container(
                            margin: EdgeInsets.symmetric(
                              vertical: kMarginY * 6,
                            ),
                            child: AppButton(
                              size: MainAxisSize.max,
                              text: 'connexion'.tr,
                              onTap: () async {
                                Get.offNamedUntil(
                                    AppLinks.LOGIN, (route) => false);
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )));
  }
}

import 'package:get/get.dart';
import 'package:flutter/material.dart'; 
import 'package:medsur_app/general_component/app_text_title_noe.dart';
import 'package:medsur_app/utils/routing.dart';
import '../../../constants/index_common.dart'; 
import 'package:medsur_app/general_component/index_widgets.dart';
import 'package:medsur_app/modules/auth/controller/auth_controller.dart';
 
class SelectAccountView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>(); 
    var _format = new FormatData();
    return GetBuilder<AuthController>(
        builder: (authCont) => Container(
            decoration: PageStyle.decoration,
            child: Scaffold(
              appBar: AppBar(
                  leading: IconButton(
                    icon: Icon(
                      Icons.keyboard_arrow_left_outlined,
                      // color: AppColors.primaryGreen,
                    ),
                    onPressed: () {
                      authCont.cleanA();
                      Get.offNamedUntil(AppLinks.LOGIN, (route) => false);
                    },
                  ),
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
                              vertical: kMarginY,
                            ),
                            child: AppTextTitleNoE(
                              text: 'selectaccount'.tr,
                              bolder: true,
                              big: true,
                            )),
                        Container(
                            margin: EdgeInsets.symmetric(
                              vertical: kMarginY * 5,
                            ),
                            child: Text('selectaccountd'.tr,
                                style: TextStyle(
                                    fontSize: kMediumText,
                                    color: AppColors.secondarytext))),
                        Container(
                          child: SizedBox(
                              height:
                                  kMdHeight * .055 * authCont.listRole.length,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: authCont.listRole.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return RadioListTile<String>(
                                      value: authCont.listRole[index]['user_id']
                                          .toString(),
                                      groupValue: authCont.selectTitle,
                                      title: Text(
                                        _format.capitalizeFirstLetter(
                                            authCont.listRole[index]['titre']),
                                        style: TextStyle(
                                            fontSize: kMediumText,
                                            fontFamily: 'Montserrat'),
                                      ),
                                      activeColor: AppColors.primaryGreen,
                                      onChanged: (val) {
                                          authCont.selectCheck(val);
                                      },
                                    );        })),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: kMarginY * 8,
                          ),
                          child: AppButton(
                            size: MainAxisSize.max,
                            text: 'next'.tr,
                            onTap: () async {
                              Get.toNamed(
                                AppLinks.FNEWPASSWORD,
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )),
            )));
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsur_app/modules/DashBoard/components/dashbox_component.dart';
import 'package:medsur_app/modules/teleconsultation/controller/teleconsultation_controller.dart';

import '../../../constants/index_common.dart';

class TeleconsultationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TeleconsultationController>(
        builder: (authCont) =>
            Container(decoration: PageStyle.decoration, child: Container()));
  }
}

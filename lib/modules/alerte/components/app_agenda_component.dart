import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsur_app/constants/index_common.dart';
import 'package:medsur_app/general_controllers/action_controller.dart';
import 'package:medsur_app/modules/alerte/models/etablissement_model.dart';

class AppAgendaComponent extends StatelessWidget {
  AppAgendaComponent({required this.listAgenda, this.onTap});
  List<Agendas>? listAgenda;
  var onTap;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listAgenda!.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => Container(
              margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      child: Text(
                    Get.find<ActionController>().lang.toLowerCase() == 'en'
                        ? listAgenda![index].libelle_en.toString()
                        : listAgenda![index].libelle.toString(),
                  )),
                  Container(
                      child: Text(
                    listAgenda![index].pivot!.debut.toString() +
                        '-' +
                        listAgenda![index].pivot!.fin.toString(),
                    style: TextStyle(
                      fontSize: kSmText,
                      fontFamily: 'Montserrat',
                      color: AppColors.primaryText,
                    ),
                  )),
                ],
              ),
            ));
  }
}

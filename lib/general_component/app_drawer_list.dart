// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import '../constants/index_common.dart';

enum DrawerSections {
  geolocalisation,
  recommndation,
  diagnostique,
  videoConference,
  chat,
  prescriptionMedicale,
  paiementMobile,
  gestionActivite,
  dashboard,
  parametres,
  deconnexion
}

class AppDrawerList extends StatelessWidget {
  final DrawerSections currentPage;
  const AppDrawerList(
    this.currentPage, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 15,
      ),
      child: ListView(
        // shows the list of menu drawer
        children: [
          MenuItem(
            1,
            "Geolocalisation",
            "assets/images/geolocalisation.png",
            currentPage == DrawerSections.geolocalisation ? true : false,
            onTap: () {
              //Navigator.of(context).push(GeolocalisationPage.route());
            },
          ),
          MenuItem(2, "Recommandation", "assets/images/recommandation.png",
              currentPage == DrawerSections.recommndation ? true : false),
          MenuItem(3, "Diagnostique", "assets/images/diagnostique.png",
              currentPage == DrawerSections.diagnostique ? true : false),
          MenuItem(4, "Video Conférence", "assets/images/video.png",
              currentPage == DrawerSections.videoConference ? true : false),
          MenuItem(5, "Chat", "assets/images/chat.png",
              currentPage == DrawerSections.chat ? true : false),
          MenuItem(
              6,
              "Prescription Medicale",
              "assets/images/prescription.png",
              currentPage == DrawerSections.prescriptionMedicale
                  ? true
                  : false),
          MenuItem(7, "Paiement Mobile", "assets/images/paiement.png",
              currentPage == DrawerSections.paiementMobile ? true : false),
          MenuItem(8, "Gestion D'activité", "assets/images/gestion.png",
              currentPage == DrawerSections.gestionActivite ? true : false),
          MenuItem(9, "Tableaux de Bord", "assets/images/dashboard.png",
              currentPage == DrawerSections.dashboard ? true : false),
          const Divider(
            color: Colors.transparent,
            height: 20,
          ),
          MenuItem(10, "Paramètres", "assets/images/parametres.png",
              currentPage == DrawerSections.parametres ? true : false),
          MenuItem(11, "Deconnexion", "assets/images/exit.png",
              currentPage == DrawerSections.deconnexion ? true : false),
        ],
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final int id;
  final String title;
  final String image;
  final bool selected;
  VoidCallback? onTap;
  MenuItem(
    this.id,
    this.title,
    this.image,
    this.selected, {
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          onTap?.call();
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Image.asset(image),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(
                    color: AppColors.primaryBlue,
                    fontSize: kMdText,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

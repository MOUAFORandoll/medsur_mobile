import 'package:medsur_app/modules/alerte/models/etablissement_model.dart';

import '../modules/alerte/models/user_alert_model.dart';

class FormatData {
  bool present(args) {
    //print(args.toString());
    //print(!args.toString().isEmpty);
    return !args.toString().isEmpty;
  }

  bool phoneNumber(args) {
    //print((args.toString().split('')[0]));
    return (!args.toString().isEmpty &&
        args.toString().length == 9 &&
        (args.toString().split('')[0] == '6' ||
            args.toString().split('')[0] == '2'));
  }

  specialityToText(List data) {
    var speciality = '';
    data.forEach((element) {
      speciality = speciality.length == 0
          ? capitalizeFirstLetter(element.libelle!)
          : speciality + ', ' + capitalizeFirstLetter(element.libelle!);
    });
    return speciality;
  }

  serviceToText(List<Categories> data) {
    var categorie = '';
    data.forEach((element) {
      categorie = categorie.length == 0
          ? element.libelle
          : categorie + ', ' + element.libelle;
    });
    return categorie;
  }

  String capitalizeFirstLetter(String text) {
    if (text.isEmpty) {
      return text;
    }
    return text[0].toUpperCase() + text.substring(1).toLowerCase();
  }
}

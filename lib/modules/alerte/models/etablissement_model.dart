import 'package:medsur_app/modules/alerte/models/user_alert_model.dart';

class EtablissementModel {
  int? id;
  Null? uuid;
  String? name;
  String? name2;
  String? code;
  String? phone;
  String? phone2;
  String? email;
  String? siteweb;
  String? description;
  int? localisationId;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  double? distance;
  bool? garanti;
  bool? authorisation;
  int? specialites_number;
  Localisation? localisation;
  List<Specialites>? specialites;
  List<Categories>? categories;
  List<Notation>? notation;
  List<Agendas>? agendas;

  EtablissementModel(
      {this.id,
      this.uuid,
      this.name,
      this.name2,
      this.code,
      this.phone,
      this.phone2,
      this.email,
      this.siteweb,
      this.description,
      this.localisationId,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.distance,
      this.garanti,
      this.authorisation,
      this.specialites_number,
      this.localisation,
      this.specialites,
      this.categories,
      this.notation,
      this.agendas});

  EtablissementModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uuid = json['uuid'];
    name = json['name'];
    name2 = json['name2'];
    code = json['code'];
    phone = json['phone'];
    phone2 = json['phone2'];
    email = json['email'];
    siteweb = json['siteweb'];
    description = json['description'];
    localisationId = json['localisation_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    garanti = json['garanti'];
    authorisation = json['authorisation'];
    distance = double.parse(json['distance'].toStringAsFixed(2));
    specialites_number = json['specialites_number'];

    localisation = json['localisation'] != null
        ? new Localisation.fromJson(json['localisation'])
        : null;
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    } else {
      categories!.add(new Categories(libelle: 'Aucune', libelle_en: 'Empty'));
    }
    if (json['specialites'] != null) {
      specialites = <Specialites>[];
      json['specialites'].forEach((v) {
        specialites!.add(new Specialites.fromJson(v));
      });
    } else {
      specialites!.add(new Specialites(libelle: 'Aucune', libelle_en: 'Empty'));
    }
    if (json['notation'] != null) {
      notation = <Notation>[];
      json['notation'].forEach((v) {
        notation!.add(new Notation.fromJson(v));
      });
    }
    if (json['agendas'] != null) {
      agendas = <Agendas>[];
      json['agendas'].forEach((v) {
        agendas!.add(new Agendas.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uuid'] = this.uuid;
    data['name'] = this.name;
    data['name2'] = this.name2;
    data['code'] = this.code;
    data['phone'] = this.phone;
    data['phone2'] = this.phone2;
    data['email'] = this.email;
    data['siteweb'] = this.siteweb;
    data['description'] = this.description;
    data['localisation_id'] = this.localisationId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['distance'] = this.distance;
    data['garanti'] = this.garanti;
    data['authorisation'] = this.authorisation;
    data['specialites_number'] = this.specialites_number;
    if (this.localisation != null) {
      data['localisation'] = this.localisation!.toJson();
    }
    if (this.specialites != null) {
      data['specialites'] = this.specialites!.map((v) => v.toJson()).toList();
    }
    if (this.notation != null) {
      data['notation'] = this.notation!.map((v) => v.toJson()).toList();
    }
    if (this.agendas != null) {
      data['agendas'] = this.agendas!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  int? id;
  Null? uuid;
  String libelle_en;
  String libelle;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  Pivot? pivot;

  Categories(
      {this.id,
      this.uuid,
      required this.libelle_en,
      required this.libelle,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.pivot});

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
      id: json["id"],
      libelle: json["libelle"],
      libelle_en: json["libelle_en"],
      uuid: json["uuid"],
      createdAt: json["createdAt"],
      updatedAt: json["updatedAt"],
      deletedAt: json["deletedAt"],
      pivot: json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uuid'] = this.uuid;

    data['libelle_en'] = this.libelle_en;
    data['libelle'] = this.libelle;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    return data;
  }
}

class Localisation {
  int? id;
  Null? uuid;
  String? boitePostale;
  String? pays;
  String? ville;
  String? rue;
  String? description;
  String? longitude;
  String? latitude;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  Localisation(
      {this.id,
      this.uuid,
      this.boitePostale,
      this.pays,
      this.ville,
      this.rue,
      this.description,
      this.longitude,
      this.latitude,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  Localisation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uuid = json['uuid'];
    boitePostale = json['boite_postale'];
    pays = json['pays'];
    ville = json['ville'];
    rue = json['rue'];
    description = json['description'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uuid'] = this.uuid;
    data['boite_postale'] = this.boitePostale;
    data['pays'] = this.pays;
    data['ville'] = this.ville;
    data['rue'] = this.rue;
    data['description'] = this.description;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}

class Notation {
  int? id;
  Null? uuid;
  int? userId;
  int? etablissementId;
  int? qualiteSoins;
  int? tempsAttente;
  int? disponibiliteMedicaments;
  int? examens;
  int? comprehensionSoinsAdministres;
  int? resolutionProbleme;
  int? facture;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  Notation(
      {this.id,
      this.uuid,
      this.userId,
      this.etablissementId,
      this.qualiteSoins,
      this.tempsAttente,
      this.disponibiliteMedicaments,
      this.examens,
      this.comprehensionSoinsAdministres,
      this.resolutionProbleme,
      this.facture,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  Notation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uuid = json['uuid'];
    userId = json['user_id'];
    etablissementId = json['etablissement_id'];
    qualiteSoins = json['qualite_soins'];
    tempsAttente = json['temps_attente'];
    disponibiliteMedicaments = json['disponibilite_medicaments'];
    examens = json['examens'];
    comprehensionSoinsAdministres = json['comprehension_soins_administres'];
    resolutionProbleme = json['resolution_probleme'];
    facture = json['facture'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uuid'] = this.uuid;
    data['user_id'] = this.userId;
    data['etablissement_id'] = this.etablissementId;
    data['qualite_soins'] = this.qualiteSoins;
    data['temps_attente'] = this.tempsAttente;
    data['disponibilite_medicaments'] = this.disponibiliteMedicaments;
    data['examens'] = this.examens;
    data['comprehension_soins_administres'] =
        this.comprehensionSoinsAdministres;
    data['resolution_probleme'] = this.resolutionProbleme;
    data['facture'] = this.facture;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}

class Agendas {
  int? id;
  String? libelle;
  String? libelle_en;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  Pivot0? pivot;

  Agendas(
      {this.id,
      this.libelle,
      this.libelle_en,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.pivot});

  Agendas.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    libelle_en = json['libelle_en'];
    libelle = json['libelle'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    pivot = json['pivot'] != null ? new Pivot0.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['libelle_en'] = this.libelle_en;
    data['libelle'] = this.libelle;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    return data;
  }
}

class Pivot0 {
  int? etablissementId;
  int? agendaId;
  String? fin;
  String? debut;

  Pivot0({this.etablissementId, this.agendaId, this.fin, this.debut});

  Pivot0.fromJson(Map<String, dynamic> json) {
    etablissementId = json['etablissement_id'];
    agendaId = json['agenda_id'];
    fin = json['fin'];
    debut = json['debut'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['etablissement_id'] = this.etablissementId;
    data['agenda_id'] = this.agendaId;
    data['fin'] = this.fin;
    data['debut'] = this.debut;
    return data;
  }
}

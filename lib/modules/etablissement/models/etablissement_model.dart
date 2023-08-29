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
  String? codePhone;
  int? userId;
  int? nmbre_alerte;
  bool? autorisation;
  bool? garanti;
  bool? status;
  String? description;
  String? numero_registre_commerce;
  String? numero_contribuable;
  int? localisationId;
  String? createdAt;
  String? updatedAt;
  String? codeCountry;
  Null? deletedAt;
  Localisation? localisation;
  Logo? logo;
  List<Categories>? categories;
  List<Specialites>? specialites;
  List<Notation>? notation;
  List<Agendas>? agendas;

  EtablissementModel(
      {this.id,
      this.uuid,
      this.name,
      this.name2,
      this.code,
      this.codePhone,
      this.codeCountry,
      this.phone,
      this.numero_registre_commerce,
      this.numero_contribuable,
      this.phone2,
      this.nmbre_alerte,
      this.email,
      this.siteweb,
      this.userId,
      this.logo,
      this.status,
      this.garanti,
      this.autorisation,
      this.description,
      this.localisationId,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.specialites,
      this.localisation,
      this.categories,
      this.notation,
      this.agendas});

  EtablissementModel.fromJson(Map<String?, dynamic> json) {
    id = json['id'];
    uuid = json['uuid'];
    codeCountry = json['codeCountry'];
    name = json['name'];
    name2 = json['name2'];
    nmbre_alerte = json['nmbre_alerte'];
    code = json['code'];
    codePhone = json['codePhone'];
    numero_registre_commerce = json['numero_registre_commerce'];
    numero_contribuable = json['numero_contribuable'];
    phone = json['phone'].toString().trim();
    phone2 = json['phone2'].toString().trim();
    email = json['email'];
    siteweb = json['siteweb'];
    userId = json['user_id'];
    status = json['status'];
    autorisation = json['autorisation'];
    garanti = json['garanti'];
    description = json['description'];
    localisationId = json['localisation_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    logo = json['logo'] != null ? new Logo.fromJson(json['logo']) : null;
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
      List _agenda = json['agendas'];
      _agenda.sort((a, b) => a['id'] - b['id']);

      print(_agenda);
      _agenda.forEach((v) {
        agendas!.add(new Agendas.fromJson(v));
      });
    }
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
    data['id'] = this.id;
    data['uuid'] = this.uuid;
    data['codeCountry'] = this.codeCountry;
    data['name'] = this.name;
    data['nmbre_alerte'] = this.nmbre_alerte;
    data['name2'] = this.name2;
    data['code'] = this.code;
    data['codePhone'] = this.codePhone;
    data['phone'] = this.phone;
    data['phone2'] = this.phone2;
    data['numero_contribuable'] = this.numero_contribuable;
    data['numero_registre_commerce'] = this.numero_registre_commerce;
    data['email'] = this.email;
    data['siteweb'] = this.siteweb;
    data['user_id'] = this.userId;
    data['garanti'] = this.garanti;
    data['status'] = this.status;
    data['autorisation'] = this.autorisation;
    data['description'] = this.description;
    data['localisation_id'] = this.localisationId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    if (this.logo != null) {
      data['logo'] = this.logo!.toJson();
    }
    if (this.localisation != null) {
      data['localisation'] = this.localisation!.toJson();
    }
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
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

class Logo {
  String? name;
  String? path;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  Logo({this.path, this.name, this.createdAt, this.updatedAt, this.deletedAt});

  Logo.fromJson(Map<String?, dynamic> json) {
    path = json['path'];
    name = json['name'];

    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
    data['path'] = this.path;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
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

  Localisation.fromJson(Map<String?, dynamic> json) {
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

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
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

class Categories {
  int? id;
  Null? uuid;
  String libelle_en;
  String libelle;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  Categories({
    this.id,
    this.uuid,
    required this.libelle_en,
    required this.libelle,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
        id: json["id"],
        libelle: json["libelle"],
        libelle_en: json["libelle_en"],
        uuid: json["uuid"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        deletedAt: json["deletedAt"],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uuid'] = this.uuid;

    data['libelle_en'] = this.libelle_en;
    data['libelle'] = this.libelle;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;

    return data;
  }
}

class Agendas {
  int? id;
  String? libelle;
  String? libelleEn;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;
  Agendas(
      {this.id,
      this.libelle,
      this.libelleEn,
      this.createdAt,
      this.updatedAt,
      this.pivot});

  Agendas.fromJson(Map<String?, dynamic> json) {
    id = json['id'];
    libelle = json['libelle'];
    libelleEn = json['libelle_en'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
    data['id'] = this.id;
    data['libelle'] = this.libelle;
    data['libelle_en'] = this.libelleEn;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
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

class Specialites {
  int? id;
  Null? uuid;
  String? libelle_en;
  String? libelle;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  Pivot? pivot;

  Specialites(
      {this.id,
      this.uuid,
      this.libelle_en,
      this.libelle,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.pivot});

  Specialites.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uuid = json['uuid'];
    libelle_en = json["libelle_en"];
    libelle = json['libelle'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uuid'] = this.uuid;

    data['libelle_en'] = this.libelle_en;
    data['libelle'] = this.libelle;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;

    return data;
  }
}

class Pivot {
  int? etablissementId;
  int? id;
  int? agendaId;
  String? fin;
  String? debut;

  Pivot({this.etablissementId, this.agendaId, this.fin, this.debut});

  Pivot.fromJson(Map<String, dynamic> json) {
    etablissementId = json['etablissement_id'];
    agendaId = json['agenda_id'];
    id = json['id'];
    fin = json['fin'];
    debut = json['debut'];
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
    data['etablissement_id'] = this.etablissementId;
    data['agenda_id'] = this.agendaId;
    data['id'] = this.id;
    data['fin'] = this.fin;
    data['debut'] = this.debut;
    return data;
  }
}


/**



Bonjour Mr vous vous portez bien j'espere.
lors de mes recherches pour ameliorer la geolocalisation de l'emplacement de l'etablissement
 j'ai trouve mapbox qui me permet de recuperer la position d'un lieux en fonction du titre
  cde celui-ci l'api apres quelque tests, l'api en question n'a pas une grande precision 
par exemple il retrouve bien bonamoussadi mais  par bonamoussadi santa lucia


 
 * 
 */
class UserAlertModel {
  int? id;
  int? userId;
  int? etablissementId;
  String? nameUser;
  // String? birthdayUser;
  // String? poidsUser;
  // String? tailleUser;
  String? emailUser;
  String? niveauUrgence;
  String? description;
  String? ville;
  String? longitude;
  String? latitude;
  // String? sexeUser;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  Etablissement? etablissement;
  List<Specialites>? specialites;

  UserAlertModel(
      {this.id,
      this.userId,
      this.etablissementId,
      this.nameUser,
      // this.birthdayUser,
      // this.poidsUser,
      // this.tailleUser,
      this.emailUser,
      this.niveauUrgence,
      this.description,
      this.ville,
      this.longitude,
      this.latitude,
      // this.sexeUser,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.etablissement,
      this.specialites});

  UserAlertModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    etablissementId = json['etablissement_id'];
    nameUser = json['name_user'];
    // birthdayUser = json['birthday_user'];
    // poidsUser = json['poids_user'];
    // tailleUser = json['taille_user'];
    emailUser = json['email_user'];
    niveauUrgence = json['niveau_urgence'];
    description = json['description'];
    ville = json['ville'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    // sexeUser = json['sexe_user'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    etablissement = json['etablissement'] != null
        ? new Etablissement.fromJson(json['etablissement'])
        : null;
    if (json['specialites'] != null) {
      specialites = <Specialites>[];
      json['specialites'].forEach((v) {
        specialites!.add(new Specialites.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['etablissement_id'] = this.etablissementId;
    data['name_user'] = this.nameUser;
    // data['birthday_user'] = this.birthdayUser;
    // data['poids_user'] = this.poidsUser;
    // data['taille_user'] = this.tailleUser;
    data['email_user'] = this.emailUser;
    data['niveau_urgence'] = this.niveauUrgence;
    data['description'] = this.description;
    data['ville'] = this.ville;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    // data['sexe_user'] = this.sexeUser;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    if (this.etablissement != null) {
      data['etablissement'] = this.etablissement!.toJson();
    }
    if (this.specialites != null) {
      data['specialites'] = this.specialites!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Etablissement {
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
  Localisation? localisation;

  Etablissement(
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
      this.localisation});

  Etablissement.fromJson(Map<String, dynamic> json) {
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
    localisation = json['localisation'] != null
        ? new Localisation.fromJson(json['localisation'])
        : null;
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
    if (this.localisation != null) {
      data['localisation'] = this.localisation!.toJson();
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
    libelle = json["libelle_en"];
    libelle = json['libelle'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
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
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    return data;
  }
}


class Pivot {
  int? alerteId;
  int? specialiteId;

  Pivot({this.alerteId, this.specialiteId});

  Pivot.fromJson(Map<String, dynamic> json) {
    alerteId = json['alerte_id'];
    specialiteId = json['specialite_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['alerte_id'] = this.alerteId;
    data['specialite_id'] = this.specialiteId;
    return data;
  }
}

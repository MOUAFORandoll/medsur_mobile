 
import 'dart:convert';

Oauth oauthFromJson(String str) => Oauth.fromJson(json.decode(str));

String oauthToJson(Oauth data) => json.encode(data.toJson());

class Oauth {
  Oauth({
    this.tokenType,
    this.expiresIn,
    this.accessToken,
    this.refreshToken,
    this.tokenExpiresAt,
    this.user,
  });

  final String? tokenType;
  final int? expiresIn;
  final String? accessToken;
  final String? refreshToken;
  final DateTime? tokenExpiresAt;
  final User? user;

  factory Oauth.fromJson(Map<String, dynamic> json) => Oauth(
        tokenType: json["token_type"],
        expiresIn: json["expires_in"],
        accessToken: json["access_token"],
        refreshToken: json["refresh_token"],
        tokenExpiresAt: json["token_expires_at"] == null
            ? null
            : DateTime.parse(json["token_expires_at"]),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "token_type": tokenType,
        "expires_in": expiresIn,
        "access_token": accessToken,
        "refresh_token": refreshToken,
        "token_expires_at": tokenExpiresAt?.toIso8601String(),
        "user": user?.toJson(),
      };
}

class User {
  User({
    this.id,
    this.nom,
    this.prenom,
    this.nationalite,
    this.codePostal,
    this.ville,
    this.pays,
    this.telephone,
    this.email,
    this.slug,
    this.isMedicasure,
    this.smsEnvoye,
    this.isNotice,
    this.decede,
    this.slack,
    this.roles,
    this.unreadNotifications,
    this.permissions,
    this.timeSlug,
    this.isEtablissement,
    this.signature,
    this.name,
    this.souscripteur,
    this.patient,
  });

  final int? id;
  final String? nom;
  final String? prenom;
  final String? nationalite;
  final dynamic codePostal;
  final String? ville;
  final String? pays;
  final String? telephone;
  final String? email;
  final String? slug;
  final int? isMedicasure;
  final int? smsEnvoye;
  final int? isNotice;
  final String? decede;
  final dynamic slack;
  final List<Role>? roles;
  final List<dynamic>? unreadNotifications;
  final List<String>? permissions;
  final String? timeSlug;
  final bool? isEtablissement;
  final String? signature;
  final String? name;
  final Souscripteur? souscripteur;
  final Patient? patient;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        nom: json["nom"],
        prenom: json["prenom"],
        nationalite: json["nationalite"],
        codePostal: json["code_postal"],
        ville: json["ville"],
        pays: json["pays"],
        telephone: json["telephone"].toString(),
        email: json["email"],
        slug: json["slug"],
        isMedicasure: json["isMedicasure"],
        smsEnvoye: json["smsEnvoye"],
        isNotice: json["isNotice"],
        decede: json["decede"],
        slack: json["slack"],
        roles: json["roles"] == null
            ? []
            : List<Role>.from(json["roles"]!.map((x) => Role.fromJson(x))),
        unreadNotifications: json["unread_notifications"] == null
            ? []
            : List<dynamic>.from(json["unread_notifications"]!.map((x) => x)),
        permissions: json["permissions"] == null
            ? []
            : List<String>.from(json["permissions"]!.map((x) => x)),
        timeSlug: json["time_slug"],
        isEtablissement: json["isEtablissement"],
        signature: json["signature"],
        name: json["name"],
        souscripteur: json["souscripteur"] == null
            ? null
            : Souscripteur.fromJson(json["souscripteur"]),
        patient:
            json["patient"] == null ? null : Patient.fromJson(json["patient"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nom": nom,
        "prenom": prenom,
        "nationalite": nationalite,
        "code_postal": codePostal,
        "ville": ville,
        "pays": pays,
        "telephone": telephone.toString(),
        "email": email,
        "slug": slug,
        "isMedicasure": isMedicasure,
        "smsEnvoye": smsEnvoye,
        "isNotice": isNotice,
        "time_slug": timeSlug,
        "decede": decede,
        "signature": signature,
        "patient": patient,
        "name": name
      };
}

class Role {
  Role({
    this.id,
    this.name,
  });

  final int? id;
  final String? name;

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class Souscripteur {
  Souscripteur({
    this.userId,
    this.sexe,
    this.dateDeNaissance,
    this.age,
    this.consentement,
    this.createdAt,
    this.updatedAt,
    this.slug,
    this.deletedAt,
  });

  final int? userId;
  final String? sexe;
  final dynamic dateDeNaissance;
  final int? age;
  final int? consentement;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? slug;
  final dynamic deletedAt;

  factory Souscripteur.fromJson(Map<String, dynamic> json) => Souscripteur(
        userId: json["user_id"],
        sexe: json["sexe"],
        dateDeNaissance: json["date_de_naissance"],
        age: json["age"],
        consentement: json["consentement"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        slug: json["slug"],
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "sexe": sexe,
        "date_de_naissance": dateDeNaissance,
        "age": age,
        "consentement": consentement,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "slug": slug,
        "deleted_at": deletedAt,
      };
}

class Patient {
  String? slug;
  int? userId;
  Null? souscripteurId;
  String? dateDeNaissance;
  String? sexe;
  int? age;
  Null? consentement;
  Null? restriction;
  Null? nomContact;
  Null? telContact;
  Null? lienContact;
  Null? deletedAt;
  String? createdAt;
  String? updatedAt;

  Patient(
      {this.slug,
      this.userId,
      this.souscripteurId,
      this.dateDeNaissance,
      this.sexe,
      this.age,
      this.consentement,
      this.restriction,
      this.nomContact,
      this.telContact,
      this.lienContact,
      this.deletedAt,
      this.createdAt,
      this.updatedAt});

  Patient.fromJson(Map<String, dynamic> json) {
    slug = json['slug'];
    userId = json['user_id'];
    souscripteurId = json['souscripteur_id'];
    dateDeNaissance = json['date_de_naissance'];
    sexe = json['sexe'];
    age = json['age'];
    consentement = json['consentement'];
    restriction = json['restriction'];
    nomContact = json['nom_contact'];
    telContact = json['tel_contact'];
    lienContact = json['lien_contact'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['slug'] = this.slug;
    data['user_id'] = this.userId;
    data['souscripteur_id'] = this.souscripteurId;
    data['date_de_naissance'] = this.dateDeNaissance;
    data['sexe'] = this.sexe;
    data['age'] = this.age;
    data['consentement'] = this.consentement;
    data['restriction'] = this.restriction;
    data['nom_contact'] = this.nomContact;
    data['tel_contact'] = this.telContact;
    data['lien_contact'] = this.lienContact;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class UserDB {
  UserDB({
    this.id,
    this.nom,
    this.prenom,
    this.nationalite,
    this.codePostal,
    this.ville,
    this.pays,
    this.telephone,
    this.email,
    this.slug,
    this.isMedicasure,
    this.smsEnvoye,
    this.isNotice,
    this.decede,
    this.slack,
    this.roles,
    this.unreadNotifications,
    this.permissions,
    this.timeSlug,
    this.isEtablissement,
    this.signature,
    this.name,
  });

  final int? id;
  final String? nom;
  final String? prenom;
  final String? nationalite;
  final dynamic codePostal;
  final String? ville;
  final String? pays;
  final String? telephone;
  final String? email;
  final String? slug;
  final int? isMedicasure;
  final int? smsEnvoye;
  final int? isNotice;
  final String? decede;
  final dynamic slack;
  final List<Role>? roles;
  final List<dynamic>? unreadNotifications;
  final List<String>? permissions;
  final String? timeSlug;
  final bool? isEtablissement;
  final String? signature;
  final String? name;

  factory UserDB.fromJson(User json) => UserDB(
        id: json.id,
        nom: json.nom,
        prenom: json.prenom,
        name: json.name,
        nationalite: json.nationalite,
        codePostal: json.codePostal,
        ville: json.ville,
        pays: json.pays,
        telephone: json.telephone.toString(),
        email: json.email,
        slug: json.slug,
        isMedicasure: json.isMedicasure,
        smsEnvoye: json.smsEnvoye,
        isNotice: json.isNotice,
        timeSlug: json.timeSlug,
        signature: json.signature,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nom": nom,
        "prenom": prenom,
        "nationalite": nationalite,
        "code_postal": codePostal,
        "ville": ville,
        "pays": pays,
        "telephone": telephone.toString(),
        "email": email,
        "slug": slug,
        "isMedicasure": isMedicasure,
        "smsEnvoye": smsEnvoye,
        "isNotice": isNotice,
        "time_slug": timeSlug,
        "decede": decede,
        "signature": signature,
        "name": name
      };
}

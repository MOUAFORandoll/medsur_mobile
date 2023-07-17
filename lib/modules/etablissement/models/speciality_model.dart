class SpecialityModel {
  SpecialityModel({
    required this.id,
    required this.libelle,
    required this.libelle_en,
  });

  final int id;
  final String libelle;
  final String libelle_en;
  
  factory SpecialityModel.fromJson(Map<String, dynamic> json) =>
      SpecialityModel(
        id: json["id"],
        libelle: json["libelle"],
        libelle_en: json["libelle_en"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "libelle": libelle,
        "libelle_en": libelle_en,
      };
}

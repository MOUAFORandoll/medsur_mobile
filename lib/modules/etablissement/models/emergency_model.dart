class EmergencyModel {
  final int id;
  final int valeur;
  final description;
  final description_en;
  
  EmergencyModel({
    required this.id,
    required this.valeur,
    this.description,
    this.description_en,
  });
  
  factory EmergencyModel.fromJson(Map<String, dynamic> json) => EmergencyModel(
        id: json["id"],
        valeur: json["valeur"],
        description: json["description"],
        description_en: json["description_en"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "valeur": valeur,
        "description": description,
        "description_en": description_en,
      };
}

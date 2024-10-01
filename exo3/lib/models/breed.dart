import 'package:exo3/models/image.dart';

class Breed {
  late String id;
  late String nom;
  late String description;
  Image? image;

  Breed(this.description, this.id, this.nom);

  Breed.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    nom = json['nom'];
    description = json['description'];
  }

  Map<String, dynamic> toMap() =>
      {'id': id, 'nom': nom, 'description': description};

  @override
  String toString() {
    return nom;
  }

  @override
  bool operator ==(Object other) => id == (other as Breed).id;

  @override
  int get hashCode => id.hashCode;
}

import 'package:exo3/models/image.dart';

class Breed {
  late String id;
  late String name;
  late String? description;
  late Image? image;

  Breed(this.description, this.id);

  Breed.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    // Vérifier si 'image' est non null avant de créer une instance de Image
    image = json['image'] != null ? Image.fromMap(json['image']) : null;
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'nom': name,
        'description': description,
        'image': image != null ? {'id': image!.id, 'url': image!.url} : null
      };

  @override
  String toString() {
    return name;
  }

  @override
  bool operator ==(Object other) => id == (other as Breed).id;

  @override
  int get hashCode => id.hashCode;
}

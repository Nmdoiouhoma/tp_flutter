class breed {
  late String id;
  late String nom;
  late String description;


  breed(this.description, this.id, this.nom);

  breed.fromMap(Map<String, dynamic> json){
    id = json['id'];
    nom = json['nom'];
    description = json['descrioption'];
  }


}
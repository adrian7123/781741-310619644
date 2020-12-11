class UserModel {
  String id;
  String nome;
  String email;
  String sobrenome;
  DateTime createdAt;
  DateTime updatedAt;

  UserModel({
    this.id,
    this.nome,
    this.email,
    this.sobrenome,
    this.createdAt,
    this.updatedAt,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    email = json['email'];
    sobrenome = json['sobrenome'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['email'] = this.email;
    data['sobrenome'] = this.sobrenome;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

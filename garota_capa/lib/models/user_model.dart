class UserModel {
  String id;
  String nome;
  String email;
  String sobrenome;

  UserModel({this.id, this.nome, this.email, this.sobrenome});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    email = json['email'];
    sobrenome = json['sobrenome'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['email'] = this.email;
    data['sobrenome'] = this.sobrenome;
    return data;
  }
}

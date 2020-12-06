class UserModel {
  String nome;
  String email;
  String sobrenome;

  UserModel({this.nome, this.email, this.sobrenome});

  UserModel.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    email = json['email'];
    sobrenome = json['sobrenome'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['email'] = this.email;
    data['sobrenome'] = this.sobrenome;
    return data;
  }
}

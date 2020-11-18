class UserModel {
  String nome;
  String email;
  String token;

  UserModel({this.nome, this.email, this.token});

  UserModel.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    email = json['email'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['email'] = this.email;
    data['token'] = this.token;
    return data;
  }
}

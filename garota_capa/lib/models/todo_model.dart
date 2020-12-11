class TodoModel {
  String id;
  String nome;
  String email;
  DateTime createdAt;
  DateTime updatedAt;

  TodoModel({
    this.id,
    this.nome,
    this.email,
    this.createdAt,
    this.updatedAt,
  });

  TodoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    email = json['email'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['email'] = this.email;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

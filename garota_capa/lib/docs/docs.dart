const String queryTodos = """
query getUsers {
  todos(order_by: {id: asc}) {
    id
    nome
    email
  }
}
""";

const String subscriptionTodos = """
  subscription getTodos {
    todos(order_by: {id: asc}) {
      id
      nome
      email
    }
  }
""";

const String addTodo = """
  mutation AddTodo(\$nome: String, \$email: String) {
    insert_todos(objects: {nome: \$nome, email: \$email}) {
      affected_rows
    }
  }

""";

const String removeTodo = """
  mutation MyMutation(\$id: Int) {
    delete_todos(where: {id: {_eq: \$id}}) {
      affected_rows
    }
  }

""";

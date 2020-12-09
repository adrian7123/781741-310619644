import 'package:flutter/material.dart';
import 'package:garota_capa/docs/docs.dart';
import 'package:garota_capa/pages/home/home_controller.dart';
import 'package:garota_capa/pages/todo/todo_page.dart';
import 'package:garota_capa/widgets/add_user.dart';
import 'package:garota_capa/widgets/card.dart';
import 'package:garota_capa/widgets/texts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class HomePage extends StatelessWidget {
  final HomeController controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(
        documentNode: gql(queryTodos),
        pollInterval: 5,
      ),
      builder: (QueryResult result,
          {VoidCallback refetch, FetchMore fetchMore}) {
        if (result.hasException) {
          return TextP(result.exception.toString());
        }

        if (result.loading) {
          return Scaffold(appBar: AppBar());
        }

        List todos = result.data['todos'];

        return Scaffold(
          appBar: AppBar(
            title: TextH1('nome'),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.account_circle,
                ),
                onPressed: () => Navigator.pushNamed(context, 'perfil'),
              ),
            ],
          ),
          body: ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => TodoPage(
                        nome: todos[index]['nome'],
                        email: todos[index]['email']),
                  ),
                ),
                child: CardWidget(
                  id: todos[index]['id'].toString(),
                  nome: todos[index]['nome'],
                  email: todos[index]['email'],
                  onDimissed: (dir) {
                    var id = todos[index]['id'].toString();
                    controller.delete(id);
                    todos.removeAt(index);
                  },
                ),
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) => SingleChildScrollView(
                          child: Container(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: AddUserWidget(controller.save),
                      )));
            },
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ), // This trail
        );
      },
    );

    // return FutureBuilder(
    //     future: controller.user.getUserData(),
    //     builder: (_, snap) {
    //       if (snap.hasError) {
    //         return Center(
    //           child: TextP("error"),
    //         );
    //       }

    //       if (snap.connectionState == ConnectionState.waiting) {
    //         return Container();
    //       }

    //       UserModel _user = snap.data;

    //       return Scaffold(
    //         appBar: AppBar(
    //           title: TextH1(_user.nome),
    //           actions: [
    //             IconButton(
    //               icon: Icon(
    //                 Icons.account_circle,
    //               ),
    //               onPressed: () => Navigator.pushNamed(context, 'perfil'),
    //             ),
    //           ],
    //         ),
    //         body: Container(
    //           child: Observer(
    //             builder: (_) => StreamBuilder<QuerySnapshot>(
    //               stream: controller.todos.snapshots(),
    //               builder: (_, snapshot) {
    //                 if (snapshot.hasError) {
    //                   return Center(
    //                     child: TextP("error"),
    //                   );
    //                 }
    //                 if (snapshot.connectionState == ConnectionState.waiting) {
    //                   return Center(
    //                     child: CircularProgressIndicator(),
    //                   );
    //                 }
    //                 return ListView(
    //                   children: snapshot.data.docs
    //                       .map((DocumentSnapshot doc) => GestureDetector(
    //                             onTap: () => Navigator.push(
    //                                 context,
    //                                 MaterialPageRoute(
    //                                     builder: (BuildContext context) =>
    //                                         TodoPage(
    //                                             nome: doc.data()['nome'],
    //                                             email: doc.data()['email']))),
    //                             child: CardWidget(
    //                               item: doc.id,
    //                               nome: doc.data()['nome'],
    //                               email: doc.data()['email'],
    //                               onDimissed: controller.remove,
    //                             ),
    //                           ))
    //                       .toList(),
    //                 );
    //               },
    //             ),
    //           ),
    //         ),
    // floatingActionButton: FloatingActionButton(
    //   onPressed: () async {
    //     showModalBottomSheet(
    //         context: context,
    //         isScrollControlled: true,
    //         builder: (context) => SingleChildScrollView(
    //                 child: Container(
    //               padding: EdgeInsets.only(
    //                   bottom: MediaQuery.of(context).viewInsets.bottom),
    //               child: AddUserWidget(controller.increment),
    //             )));
    //   },
    //   tooltip: 'Increment',
    //   child: Icon(Icons.add),
    // ), // This trailing comma makes auto-formatting nicer for build methods.
    //       );
    //     });
  }
}

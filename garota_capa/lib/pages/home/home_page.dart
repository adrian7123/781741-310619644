import 'package:flutter/material.dart';
import 'package:garota_capa/models/todo_model.dart';
import 'package:garota_capa/models/user_model.dart';
import 'package:garota_capa/pages/scaffold_loader/scaffold_loader.dart';
import 'package:garota_capa/pages/todo/todo_page.dart';
import 'package:garota_capa/widgets/add_user.dart';
import 'package:garota_capa/widgets/card.dart';
import 'package:garota_capa/widgets/texts.dart';
import 'package:provider/provider.dart';

import './home_controller.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeController controller = Provider.of<HomeController>(context);
    return StreamBuilder(
        stream: controller.user,
        builder: (_, snap) {
          if (snap.hasError) {
            return Center(
              child: TextP("error"),
            );
          }

          if (snap.connectionState == ConnectionState.waiting) {
            return ScaffoldLoader();
          }

          UserModel _user = snap.data;

          return Scaffold(
            appBar: AppBar(
              title: TextH1(_user.nome),
              actions: [
                IconButton(
                  icon: Icon(
                    Icons.account_circle,
                  ),
                  onPressed: () => Navigator.pushNamed(context, 'perfil'),
                ),
              ],
            ),
            body: Container(
              child: StreamBuilder<List<TodoModel>>(
                stream: controller.todos,
                builder: (_, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: TextP("error ${snapshot.error}"),
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  List<TodoModel> _todo = snapshot.data;

                  return ListView.builder(
                    itemCount: _todo.length,
                    itemBuilder: (_, i) => GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => TodoPage(
                            nome: _todo[i].nome,
                            email: _todo[i].email,
                          ),
                        ),
                      ),
                      child: CardWidget(
                        item: _todo[i].id,
                        nome: _todo[i].nome,
                        email: _todo[i].email,
                        onDimissed: controller.remove,
                      ),
                    ),
                  );
                },
              ),
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
                          child: AddUserWidget(controller.increment),
                        )));
              },
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),
          );
        });
  }
}

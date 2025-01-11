import 'package:flutter/material.dart';
import 'package:flutter_sqlite/database/provider/produto_model.dart';
import 'package:flutter_sqlite/database/provider/produto_widget.dart';
import 'package:flutter_sqlite/database/provider/user_model.dart';
import 'package:provider/provider.dart';

class ProviderPage extends StatelessWidget {
  const ProviderPage({super.key});

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserModel>(context);
    //var imgAvatar = context.select<UserModel, String>(
    //    (userModel) => userModel.imgAvatar); // retorna somente a imagem
    // var user = Provider.of<UserModel>() retorna uma instância e não fica escutando alterações
    // var user = context.watch<UserModel>(); escuta as alterações
    return Provider(
      create: (_) => ProdutoModel(nome: 'Aulas Flutter'),
      child: Scaffold(
        appBar: AppBar(title: const Text('Provider')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                  radius: 100, backgroundImage: NetworkImage(user.imgAvatar)),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(user.name),
                  Text('(${user.birthDate})'),
                ],
              ),
              const ProdutoWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

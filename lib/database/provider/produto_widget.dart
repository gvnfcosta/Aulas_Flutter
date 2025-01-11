import 'package:flutter/material.dart';
import 'package:flutter_sqlite/database/provider/produto_model.dart';
import 'package:provider/provider.dart';

class ProdutoWidget extends StatelessWidget {
  const ProdutoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red.shade100,
      child: Text(context.read<ProdutoModel>().nome),
    );
  }
}

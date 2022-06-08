import 'package:expenses/components/transacao_form.dart';
import 'package:flutter/material.dart';
import 'models/transacao.dart';
import 'dart:math';
import '../components/transacao_form.dart';
import '../components/transacao_lista.dart';

main() => runApp(const ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _transacoes = [
    Transacao(
      id: 't1',
      title: 'Tricologia da Saúde',
      value: 100.00,
      date: DateTime.now(),
    ),
    Transacao(
      id: 't2',
      title: 'Aurículoterapia',
      value: 100.00,
      date: DateTime.now(),
    ),
    Transacao(
      id: 't3',
      title: 'Reflexologia Podal',
      value: 150.00,
      date: DateTime.now(),
    ),
    Transacao(
      id: 't4',
      title: 'Iridologia',
      value: 100.00,
      date: DateTime.now(),
    ),
    Transacao(
      id: 't5',
      title: 'Reavalização química',
      value: 75.00,
      date: DateTime.now(),
    ),
  ];

  _addTransacao(String titulo, double valor) {
    final newTransacao = Transacao(
      id: Random().nextDouble().toString(),
      title: titulo,
      value: valor,
      date: DateTime.now(),
    );

    setState(() {
      _transacoes.add(newTransacao);
    });
  }

  _openFormTransacaoModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TransacaoForm(_addTransacao);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Maura Lozove'), actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () => _openFormTransacaoModal(context),
        )
      ]),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              child: Card(
                color: Colors.blue,
                child: Text('Consultas',
                    style: const TextStyle(color: Colors.white)),
                elevation: 5,
              ),
            ),
            TransacaoLista(_transacoes),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _openFormTransacaoModal(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

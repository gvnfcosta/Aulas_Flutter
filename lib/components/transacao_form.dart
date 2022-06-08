import 'package:flutter/material.dart';

class TransacaoForm extends StatefulWidget {
  final void Function(String, double) onSubmete;

  TransacaoForm(this.onSubmete);

  @override
  State<TransacaoForm> createState() => _TransacaoFormState();
}

class _TransacaoFormState extends State<TransacaoForm> {
  final tituloController = TextEditingController();

  final valorController = TextEditingController();

  _submitForm() {
    final titulo = tituloController.text;
    final valor = double.tryParse(valorController.text) ?? 0.0;

    if (titulo.isEmpty || valor <= 0) {
      return;
    }

    widget.onSubmete(titulo, valor);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Column(
          children: [
            TextField(
              controller: tituloController,
              onSubmitted: (_) => _submitForm(),
              decoration: InputDecoration(
                labelText: 'Título',
              ),
            ),
            TextField(
              controller: valorController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => _submitForm(),
              decoration: InputDecoration(
                labelText: 'Valor (R\$)',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text(
                    'Nova Transação',
                    style: TextStyle(
                      color: Colors.purple,
                    ),
                  ),
                  onPressed: _submitForm,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_sqlite/database/database_sqlite.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    _dataBase();
  }

  void _dataBase() async {
    final database = await DatabaseSqLite().openConnection();

    //database.insert('teste', {'nome': "Gigio D'Costa"});
    //database.delete('teste', where: 'nome = ?', whereArgs: ["Gigio D'Costa"]);
    // database.update('teste', {'nome': 'Academia do Flutter'},
    //     where: 'nome = ?', whereArgs: ["Gigio D`Costa"]);
    // var result = await database.query('teste');
    // debugPrint(result as String?);

    // database.rawInsert('Insert into teste values(null, ?)', ['Patty']);
    // database.rawUpdate('Update teste set nome = ? where id = ?', ['Patty e Gio', 2]);
    // database.rawDelete('delete from teste where id = ?', [5]);
    var result = await database.rawQuery('select * from teste');
    debugPrint(result as String);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Container(),
    );
  }
}

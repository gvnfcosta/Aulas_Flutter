import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseSqLite {
  Future<Database> openConnection() async {
    final databasePath = await getDatabasesPath();
    final databaseFinalPath = join(databasePath, 'SQLITE_EXAMPLE');

   return  await openDatabase(
      databaseFinalPath,
      version: 2,
      onConfigure: (db) async {
        debugPrint('onConfigure sendo chamado');
        await db.execute('PRAGMA foreign_keys = ON');
      },
      // Chamado somente no momento de criação do banco de dados
      // primeira vez que carrega o aplicativo
      onCreate: (Database db, int version) {
        debugPrint('onCreate chamado');
        final batch = db.batch();

        batch.execute('''
          create table teste (
            id Integer primary key autoincrement,
            nome varchar(200))
          ''');
        batch.execute('''
            create table produto (
              id Integer primary key autoincrement,
              nome varchar(200))
            ''');
        // batch.execute('''
        //     create table categoria (
        //       id Integer primary key autoincrement,
        //       nome varchar(200))
        //     ''');
        batch.commit();
      },

      // Será chamado sempre que houver uma alteração no versão incremental (1 -> 2)
      onUpgrade: (Database db, int oldVersion, int version) {
        debugPrint('onUpgrade chamado');
        final batch = db.batch();

        debugPrint(oldVersion.toString());

        if (oldVersion == 1) {
          batch.execute('''
            create table produto (
              id Integer primary key autoincrement,
              nome varchar(200))
            ''');
          // batch.execute('''
          //   create table categoria (
          //     id Integer primary key autoincrement,
          //     nome varchar(200))
          //   ''');
        }

        if (oldVersion == 2) {
          // batch.execute('''
          //   create table categoria (
          //     id Integer primary key autoincrement,
          //     nome varchar(200))
          //   ''');
        }

        batch.commit();
      },
      // Será chamado sempre que houver uma alteração no version decrementa (2 -> 1)
      onDowngrade: (Database db, int oldVersion, int version) {
        debugPrint('onDowngrade chamado');
        final batch = db.batch();

        if (oldVersion == 3) {
          batch.execute('''
         drop table categoria
         ''');
        }
        batch.commit();
      },
    );
  }
}

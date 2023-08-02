import 'dart:io';
import 'dart:async';
import 'package:get/get.dart';
import 'package:medsur_app/modules/auth/models/oauth.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'package:connectivity/connectivity.dart'; 
class DataBaseControllerSave extends GetxController {
  static Database? _database; 
  String bdName = 'a22.db';
  // String bdName = 'b24.db';
  @override
  void onInit() {
    super.onInit();
    initDatabase();
  }

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await initDatabase();
    return _database!;
  }
  
  Future<Database> initDatabase() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), bdName),
      onCreate: (Database db, int version) async {
        await db.execute("""CREATE TABLE IF NOT EXISTS KEYUSER (
      idB INTEGER PRIMARY KEY AUTOINCREMENT,
      idUser INTEGER,
      access_token String,
      expires_in String,
      refresh_token String,
      token_expires_at String,
      token_type String
      )""");
        await db.execute("""CREATE TABLE IF NOT EXISTS USER (
      idB INTEGER PRIMARY KEY AUTOINCREMENT,
      id INTEGER,
      nom String,
      name String,
      prenom String,
      telephone String,
      code_postal String,
      email String,
      nationalite String,
      ville String,
      pays String,
      isMedicasure INTEGER,
      smsEnvoye INTEGER,
      decede String,
      signature String, 
      slug String,  
      isNotice INTEGER
     
      )""");
        await db.execute("""CREATE TABLE IF NOT EXISTS ROLE (
      idB INTEGER PRIMARY KEY AUTOINCREMENT,
      id INTEGER,
      name String
      )""");
        await db.execute("""CREATE TABLE IF NOT EXISTS PERMISSIONS (
      idB INTEGER PRIMARY KEY AUTOINCREMENT,
      name String
      )""");
        await db.execute("""CREATE TABLE IF NOT EXISTS LANG (
      
       id INTEGER,
       
       name String
     
       
      )""");
        await db.execute('ALTER TABLE USER ADD COLUMN time_slug TEXT NULL');
        return;
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        // Traiter les mises à niveau de version de la base de données
        if (oldVersion < 2 && newVersion >= 2) {
          await db.execute(
            'ALTER TABLE USER ADD COLUMN time_slug TEXT NULL',
          );
        }
      },
      version: 2,
    );

    return _database!;
  }

  saveToken(key) async {
    try {
      final db = await this.database;
      var data = await db.rawQuery('SELECT * FROM KEYUSER');

      //  //print(key);
      if (data.isNotEmpty) {
        if (key != null) {
          await db.update(
              "KEYUSER",
              {
                "idUser": key['id'],
                "refresh_token": key['refresh_token'],
                "access_token": key['access_token'],
              },
              where: 'idB= ?',
              whereArgs: [1]);
        }
      } else {
        final db = await this.database;
        await db.insert("KEYUSER", {
          "idB": 1,
          "idUser": key['id'],
          "refresh_token": key['refresh_token'],
          "access_token": key['access_token'],
        });
      }

      return true;
    } catch (e) {
      return false;
    }
  }

  getToken() async {
    final db = await this.database;
    var data = await db.rawQuery('SELECT * FROM KEYUSER');

    //  //print(data);

    if (data.isNotEmpty) {
      return {
        "id": 1,
        "idUser": data[0]['idUser'],
        'access_token': data[0]['access_token'],
        'refresh_token': data[0]['refresh_token']
      };
    } else {
      return {"id": 0, 'access_token': '', "idUser": 0, 'refresh_token': ''};
    }
  }

  saveUserInfo(
    user,
  ) async {
    try {
      final db = await this.database;
      var data = await db.rawQuery('SELECT * FROM USER');
      if (user != null) {
        if (data.isNotEmpty) {
          await db
              .update("USER", user.toJson(), where: 'idB= ?', whereArgs: [1]);
        } else {
          await db.insert("USER", user.toJson());
        }
      }

      return true;
    } catch (e) {
      return false;
    }
  }

  getUserInfo() async {
    final db = await this.database;
    var data = await db.rawQuery('SELECT * FROM USER');

    if (data.isNotEmpty) {
      return data[0];
    } else {
      return {
        "id": 0,
      };
    }
  }

  saveUserRole(Role role) async {
    try {
      final db = await this.database;
      var data = await db.rawQuery('SELECT * FROM ROLE');
      if (role != null) {
        if (data.isNotEmpty && role.name == 'Patient-Alerte') {
          await db
              .update("ROLE", role.toJson(), where: 'idB= ?', whereArgs: [1]);
        } else if (role.name == 'Patient-Alerte') {
          await db.insert("ROLE", role.toJson());
        }
      }

      return true;
    } catch (e) {
      return false;
    }
  }

  getUserRole() async {
    final db = await this.database;
    var data = await db.rawQuery('SELECT * FROM ROLE');
    if (data.isNotEmpty) {
      return data[0];
    } else {
      return {
        "id": 0,
      };
    }
  }

  saveListPermission(List<String> permissions) async {
    try {
      final db = await this.database;
      var data = await db.delete('PERMISSIONS');

      for (var i = 0; i < permissions.length; i++) {
        await db.insert("PERMISSIONS", {'name': permissions[i]});
      }

      return true;
    } catch (e) {
      return false;
    }
  }

  getListPermission() async {
    List _listPermission = [];
    final db = await this.database;
    var permissions = await db.rawQuery('SELECT * FROM PERMISSIONS');
    for (var i = 0; i < permissions.length; i++) {
      _listPermission.add(permissions[i]['name']);
    }
    return _listPermission;
  }

  deleteAll() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, bdName);

    databaseFactory.deleteDatabase(path);
    await initDatabase();
  }
  
  saveLan(String name) async {
    try {
      final db = await this.database;
      var data = await db.rawQuery('SELECT * FROM LANG');
      if (data.isNotEmpty) {
        var a = await db.update(
            "LANG",
            {
              "id": 0,
              "name": name,
            },
            where: 'id= ?',
            whereArgs: [0]);
      } else {
        var a = await db.insert("LANG", {
          "id": 0,
          "name": name,
        });
      }
      var data0 = await db.rawQuery('SELECT * FROM LANG');

      return true;
    } catch (e) {
      return false;
    }
  }

  getLan() async {
    final db = await this.database;

    try {
      var data = await db.rawQuery('SELECT * FROM LANG');

      if (data.isNotEmpty) {
        var name = data[0]['name'].toString();
        return name;
        // Get.find<ActionController>().getLanguage0(name);
      } else {
        return '';
      }
    } catch (e) {}
  }

  getLanIs() async {
    final db = await this.database;

    try {
      var data = await db.rawQuery('SELECT * FROM LANG');

      return data.isNotEmpty;
    } catch (e) {}
  }
  // Future<List<User>> getUsers() async {
  //   final List<Map<String, dynamic>> maps = await  _database!.query('users');
  //   return List.generate(maps.length, (i) {
  //     return User(
  //       id: maps[i]['id'],
  //       name: maps[i]['name'],
  //       age: maps[i]['age'],
  //     );
  //   });
  // }

  // Future<void> insertUser(User user) async {
  //   await  _database!.insert('users', user.toMap(),
  //       conflictAlgorithm: ConflictAlgorithm.replace);
  // }

  // Future<void> updateUser(User user) async {
  //   await _database
  //       .update('users', user.toMap(), where: 'id = ?', whereArgs: [user.id]);
  // }

  // Future<void> deleteUser(int id) async {
  //   await  _database!.delete('users', where: 'id = ?', whereArgs: [id]);
  // }

  // Future<void> syncUsers() async {
  //   try {
  //     final apiUsers = await _userService.getUsers();
  //     final localUsers = await getUsers();

  //     // Compare les données locales avec les données de l'API
  //     for (final apiUser in apiUsers) {
  //       final localUser =
  //           localUsers.firstWhereOrNull((u) => u.id == apiUser.id);

  //       if (localUser != null) {
  //         // Si l'utilisateur existe déjà localement, mettez à jour les données
  //         updateUser(UserLocal(
  //           id: apiUser.id,
  //           name: apiUser.name,
  //           age: apiUser.age,
  //         ));
  //       } else {
  //         // Si l'utilisateur n'existe pas encore localement, insérez-le
  //         insertUser(UserLocal(
  //           id: apiUser.id,
  //           name: apiUser.name,
  //           age: apiUser.age,
  //         ));
  //       }
  //     }

  //     // Supprime les utilisateurs locaux qui ne sont plus présents dans l'API
  //     for (final localUser in localUsers) {
  //       final apiUser = apiUsers.firstWhereOrNull((u) => u.id == localUser.id);

  //       if (apiUser == null) {
  //         deleteUser(localUser.id);
  //       }
  //     }
  //   } catch (e) {
  //     // Gérer les erreurs de connexion
  //     //print('Error syncing users: $e');
  //   }
  // }
}

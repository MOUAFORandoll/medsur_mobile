import 'dart:async';
import 'package:get/get.dart';
import 'package:medsur_app/modules/auth/models/oauth.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseController extends GetxController {
  static Database? _database;
  // String bdName = 'a22.db';
  String bdName = 'b25.db';

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
      access_token TEXT,
      expires_in TEXT,
      refresh_token TEXT,
      token_expires_at TEXT,
      token_type TEXT
      )""");
        await db.execute("""CREATE TABLE IF NOT EXISTS USER (
      idB INTEGER PRIMARY KEY AUTOINCREMENT,
      id INTEGER,
      nom TEXT,
      name TEXT,
      prenom TEXT,
      telephone TEXT,
      code_postal TEXT,
      email TEXT,
      nationalite TEXT,
      ville TEXT,
      pays TEXT,
      isMedicasure INTEGER,
      smsEnvoye INTEGER,
      decede TEXT,
      signature TEXT, 
      slug TEXT,  
      isNotice INTEGER
     
      )""");
        await db.execute("""CREATE TABLE IF NOT EXISTS ROLE (
      idB INTEGER PRIMARY KEY AUTOINCREMENT,
      id INTEGER,
      name TEXT
      )""");
        await db.execute("""CREATE TABLE IF NOT EXISTS PERMISSIONS (
      idB INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT
      )""");
        await db.execute("""CREATE TABLE IF NOT EXISTS LANG (
       id INTEGER,
       name TEXT
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

  Future<bool> saveToken(key) async {
    try {
      final db = await this.database;
      var data = await db.rawQuery('SELECT * FROM KEYUSER');

      if (data.isNotEmpty) {
        if (key != null) {
          await db.update(
            "KEYUSER",
            {
              "idUser": key['id'],
              "refresh_token": key['refresh_token'],
              "access_token": key['access_token'],
              "token_expires_at": key['token_expires_at'],
            },
            where: 'idB = ?',
            whereArgs: [1],
          );
        }
      } else {
        await db.insert("KEYUSER", {
          "idB": 1,
          "idUser": key['id'],
          "refresh_token": key['refresh_token'],
          "access_token": key['access_token'],
          "token_expires_at": key['token_expires_at'],
        });
      }

      return true;
    } catch (e) {
      return false;
    }
  }

  inExpiredToken() async {
    final db = await this.database;
    if (db != null) {
      var data = await db.rawQuery('SELECT * FROM KEYUSER');
      

      if (data.isNotEmpty) {
        print(data[0]);
        String specifiedDate = data[0]['token_expires_at'].toString();

        // Convertir la date spécifiée en DateTime
        DateTime date = DateTime.parse(specifiedDate);

        // Obtenir la date et l'heure actuelles
        DateTime now = DateTime.now();

        // Ajouter un écart de 10 minutes à la date actuelle
        DateTime tenMinutesLater = now.add(Duration(hours: 1, minutes: 10));
        // print(tenMinutesLater);

        // print(date.isAfter(now));
        // print(date.isBefore(tenMinutesLater));
        var diff = date.difference(now);
        print('-now----------$now');
        print('-date----------$date');
        print('-difff---------****${diff.inMinutes}');

        if (diff.inMinutes <= 30) {
          return true;
        } else {
          return false;
        }
        // Vérifier si la date spécifiée se situe entre la date actuelle et 10 minutes plus tard
        // if (date.isAfter(now) && date.isBefore(tenMinutesLater)) {
        //   return true;
        // } else {
        //   return false;
        // }
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  inExpiredTokenNR() async {
    final db = await this.database;
    if (db != null) {
      var data = await db.rawQuery('SELECT * FROM KEYUSER');
       

      if (data.isNotEmpty) {
        String specifiedDate = data[0]['token_expires_at'].toString();
        print('----${specifiedDate}');
        if (specifiedDate != null && specifiedDate != 'null') {
          print(specifiedDate);
          DateTime date = DateTime.parse(specifiedDate);

          DateTime now = DateTime.now();

          var diff = date.difference(now);
          print('-now----------$now');
          print('-date----------$date');
          print('-difff---------****${diff.inMinutes}');

          if (diff.inMinutes <= 0) {
            return true;
          } else {
            return false;
          }
        } else {
          return false;
        }
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  Future<Map<String, dynamic>> getToken() async {
    final db = await this.database;
    if (db != null) {
      var data = await db.rawQuery('SELECT * FROM KEYUSER');

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
    } else {
      return {"id": 0, 'access_token': '', "idUser": 0, 'refresh_token': ''};
    }
  }

  Future<bool> saveUserInfo(user) async {
    try {
      final db = await this.database;
      var data = await db.rawQuery('SELECT * FROM USER');
      if (user != null) {
        if (data.isNotEmpty) {
          await db.update(
            "USER",
            user.toJson(),
            where: 'idB = ?',
            whereArgs: [1],
          );
        } else {
          await db.insert("USER", user.toJson());
        }
      }

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<Map<String, dynamic>> getUserInfo() async {
    final db = await this.database;
    var data = await db.rawQuery('SELECT * FROM USER');

    if (data.isNotEmpty) {
      return data[0];
    } else {
      return {"id": 0};
    }
  }

  Future<bool> saveUserRole(Role role) async {
    try {
      final db = await this.database;
      var data = await db.rawQuery('SELECT * FROM ROLE');
      if (role != null) {
        if (data.isNotEmpty && role.name == 'Patient-Alerte') {
          await db.update(
            "ROLE",
            role.toJson(),
            where: 'idB = ?',
            whereArgs: [1],
          );
        } else if (role.name == 'Patient-Alerte') {
          await db.insert("ROLE", role.toJson());
        }
      }

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<Map<String, dynamic>> getUserRole() async {
    final db = await this.database;
    var data = await db.rawQuery('SELECT * FROM ROLE');
    if (data.isNotEmpty) {
      return data[0];
    } else {
      return {"id": 0};
    }
  }

  Future<bool> saveListPermission(List<String> permissions) async {
    try {
      final db = await this.database;
      await db.delete('PERMISSIONS');

      for (var i = 0; i < permissions.length; i++) {
        await db.insert("PERMISSIONS", {'name': permissions[i]});
      }

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<List<String>> getListPermission() async {
    final db = await this.database;
    List<String> _listPermission = [];
    var permissions = await db.rawQuery('SELECT * FROM PERMISSIONS');
    for (var i = 0; i < permissions.length; i++) {
      _listPermission.add(permissions[i]['name'] as String);
    }
    return _listPermission;
  }

  Future<void> deleteAll() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, bdName);

    await databaseFactory.deleteDatabase(path);
    await initDatabase();
  }

  Future<bool> saveLan(String name) async {
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
          where: 'id = ?',
          whereArgs: [0],
        );
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

  Future<String> getLan() async {
    final db = await this.database;

    try {
      var data = await db.rawQuery('SELECT * FROM LANG');

      if (data.isNotEmpty) {
        var name = data[0]['name'].toString();
        return name;
      } else {
        return '';
      }
    } catch (e) {
      return '';
    }
  }

  Future<bool> getLanIs() async {
    final db = await this.database;

    try {
      var data = await db.rawQuery('SELECT * FROM LANG');

      return data.isNotEmpty;
    } catch (e) {
      return false;
    }
  }
}

import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'history.dart';

const String TableName = 'history';


class DB {
  var _db;

  Future<Database> get database async {
    if ( _db != null ) return _db;
    _db = openDatabase(
      // 데이터베이스 경로를 지정합니다. 참고: `path` 패키지의 `join` 함수를 사용하는 것이
      // 각 플랫폼 별로 경로가 제대로 생성됐는지 보장할 수 있는 가장 좋은 방법입니다.
      join(await getDatabasesPath(), 'history.db'),
      // 데이터베이스가 처음 생성될 때, history를 저장하기 위한 테이블을 생성합니다.
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE history(id INTEGER PRIMARY KEY, content TEXT, result TEXT)",
        );
      },
      // 버전을 설정하세요. onCreate 함수에서 수행되며 데이터베이스 업그레이드와 다운그레이드를
      // 수행하기 위한 경로를 제공합니다.
      version: 1,
    );
    return _db;
  }
  Future<void> insertHistory(History history) async {
    final db = await database;
    await db.insert(
      TableName,
      history.toMap(),
      conflictAlgorithm: ConflictAlgorithm.abort,
    );
  }
  Future<List<History>> history() async {
    final db = await database;

    // 모든 Memo를 얻기 위해 테이블에 질의합니다.
    final List<Map<String, dynamic>> maps = await db.query('history');

    // List<Map<String, dynamic>를 List<Memo>으로 변환합니다.
    return List.generate(maps.length, (i) {
      return History(
        id: maps[i]['id'],
        content: maps[i]['content'],
        result: maps[i]['result'],
      );
    });
  }
  //
  // Future<void> updateMemo(Memo memo) async {
  //   final db = await database;
  //
  //   // 주어진 Memo를 수정합니다.
  //   await db.update(
  //     TableName,
  //     memo.toMap(),
  //     // Memo의 id가 일치하는 지 확인합니다.
  //     where: "id = ?",
  //     // Memo의 id를 whereArg로 넘겨 SQL injection을 방지합니다.
  //     whereArgs: [memo.id],
  //   );
  // }

  Future<void> deleteAllHistory() async {
    final db = await database;
    await db.delete(
      TableName
    );
  }








}

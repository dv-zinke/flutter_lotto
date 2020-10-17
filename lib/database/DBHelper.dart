import 'package:lotto_flutter/model/LottoData.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Future<Database> database() async {
    final dbPath =
        await sql.getDatabasesPath(); // getDatabasesPath()는 경로값을 리턴합니다
    return sql.openDatabase(path.join(dbPath, 'lotto.db'),
        // join() 메서드는 경로와 생성할 DB 파일의 이름을 매개변수로 받아 데이터베이스를 생성합니다
        onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE lotto(id INTEGER PRIMARY KEY AUTOINCREMENT, lottoNumber1 INTEGER, lottoNumber2 INTEGER, lottoNumber3 INTEGER, lottoNumber4 INTEGER, lottoNumber5 INTEGER, lottoNumber6 INTEGER, createdAt TEXT)');
    }, version: 1);
  }

  static Future<void> insertLotto(LottoData lottoData) async {
    final db = await DBHelper.database(); // DBHelper 클래스의 database() 메서드를 실행합니다
    db.insert(
      'lotto', // 추가할 테이블 명
      lottoData.toMap(), //  저장할 데이터, Map 형식으로 추가됩니다
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<LottoData>> getLottoDates() async {
    // 데이터베이스 reference를 얻습니다.
    final db = await DBHelper.database();

    // 모든 Dog를 얻기 위해 테이블에 질의합니다.
    final List<Map<String, dynamic>> maps = await db.query('lotto');

    // List<Map<String, dynamic>를 List<Dog>으로 변환합니다.
    return List.generate(maps.length, (i) {
      return LottoData(
        id: maps[i]['id'],
        lottoNumber1: maps[i]['lottoNumber1'],
        lottoNumber2: maps[i]['lottoNumber2'],
        lottoNumber3: maps[i]['lottoNumber3'],
        lottoNumber4: maps[i]['lottoNumber4'],
        lottoNumber5: maps[i]['lottoNumber5'],
        lottoNumber6: maps[i]['lottoNumber6'],
        createdAt: maps[i]['createdAt']
      );
    });
  }

  static Future<void> deleteLotto(int id) async {
    // 데이터베이스 reference를 얻습니다.
    final db = await DBHelper.database();

    // 데이터베이스에서 Dog를 삭제합니다.
    await db.delete(
      'lotto',
      // 특정 dog를 제거하기 위해 `where` 절을 사용하세요
      where: "id = ?",
      // Dog의 id를 where의 인자로 넘겨 SQL injection을 방지합니다.
      whereArgs: [id],
    );
  }
}

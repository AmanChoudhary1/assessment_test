import 'package:assesments_app/data/data_sources/local/models/reportmodal.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('report.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = p.join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const reportTable = '''
    CREATE TABLE report (
      id INTEGER PRIMARY KEY,
      sys_mm_hg INTEGER,
      dia_mm_hg INTEGER,
      pulse_bpm INTEGER,
      description TEXT,
      createdat TEXT,
      updatedat TEXT
    )
    ''';

    await db.execute(reportTable);
  }

  Future<void> insertReport(Map<String, dynamic> report) async {
    final db = await instance.database;
    await db.insert(
      'report',
      report,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<ReportModal>> getReports() async {
    final db = await instance.database;
    final result = await db.query(
      'report',
      orderBy: 'createdAt DESC',
    );
    return result.map((e) => ReportModal.fromJson(e)).toList();
  }

  Future<void> clearReports() async {
    final db = await instance.database;
    try {
      await db.delete('report');
    } catch (_) {}
  }
}

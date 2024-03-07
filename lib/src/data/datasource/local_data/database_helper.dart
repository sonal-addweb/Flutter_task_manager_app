import 'package:flutter_task_manager_app/src/utils/constants/strings.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../../models/task.dart';

class DatabaseHelper {
  static final instance = DatabaseHelper._instance();
  static Database? db;
  static late DatabaseHelper _databaseHelper;

  DatabaseHelper._instance() {
    initDB();
    _databaseHelper = this;
  }

  factory DatabaseHelper() => instance;

  final tableName = taskManagerTableName;
  final id = 'id';
  final title = 'title';

  Future<Database?> initDB() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = '${documentsDirectory.path}${databaseName}';
    db = await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (db, version) async {
          await db.execute(''' 
        create table $tableName (
        $id integer primary key autoincrement,
        $title text not null
        ) ''');
        });
    return db;
  }

  Future<TaskModel> add(TaskModel task) async {
    task.id = (await db?.insert(tableName, task.toJson()))!;
    return task;
  }

  Future<List<TaskModel>> fetch() async {
    final maps = await db!.query(tableName);

    return List.generate(maps.length, (i) {
      return TaskModel.fromJson(Map<String, dynamic>.from(maps[i]));
    });
  }

  Future<int?> update(TaskModel note) async {
    return await db?.update(tableName, note.toJson(),
        where: '$id = ?', whereArgs: [note.id]);
  }

  Future<List<TaskModel>> delete(int taskId) async {
     await db?.delete(
      tableName,
      where: '$id = ?',
      whereArgs: [taskId],
    );
    return fetch();
  }
}

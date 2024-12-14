import 'dart:developer';

import 'package:myapp/core/helpers/database_helper.dart';
import 'package:myapp/models/moment.dart';

import '../contracts/abs_moment_repository.dart';

class DbMomentRepository extends AbsMomentRepository {
  final DatabaseHelper databaseHelper = DatabaseHelper();

  @override
  Future<void> addMoment(Moment newMoment) async {
    try {
      // Akses database
      final db = await databaseHelper.database;
      // Melakukan operasi insert data
      await db.insert(
        DatabaseHelper.tableMoments,
        newMoment.toMap(),
      );
    } catch (e) {
      log(e.toString(), name: 'DbMomentRepository:addMoment');
    }
  }

  @override
  Future<void> deleteMoment(String momentId) async {
    try {
      // Akses database
      final db = await databaseHelper.database;
      // Melakukan operasi delete data
      await db.delete(
        DatabaseHelper.tableMoments,
        where: 'id = ?',
        whereArgs: [momentId],
      );
    } catch (e) {
      log(e.toString(), name: 'DbMomentRepository:deleteMoment');
    }
  }

  @override
  Future<List<Moment>> getAllMoments() {
    // TODO: implement getAllMoments
    throw UnimplementedError();
  }

  @override
  Future<Moment?> getMomentById(String momentId) {
    // TODO: implement getMomentById
    throw UnimplementedError();
  }

  @override
  Future<void> updateMoment(Moment updateMoment) {
    // TODO: implement updateMoment
    throw UnimplementedError();
  }
}

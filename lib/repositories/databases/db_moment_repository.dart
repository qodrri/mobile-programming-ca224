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
  Future<List<Moment>> getAllMoments() async {
    try {
      // Akses database
      final db = await databaseHelper.database;
      // Melakukan operasi membaca semua data
      final result = await db.query(DatabaseHelper.tableMoments);
      // Mengonversi hasil ke bentuk list object moment
      final moments = result.map((item) => Moment.fromMap(item)).toList();
      // Mengembalikan hasil dalam bentuk list
      return moments;
    } catch (e) {
      log(e.toString(), name: 'DbMomentRepository:getAllMoments');
      return [];
    }
  }

  @override
  Future<Moment?> getMomentById(String momentId) async {
    try {
      // Akses database
      final db = await databaseHelper.database;
      // Melakukan operasi membaca data berdasarkan id
      final result = await db.query(
        DatabaseHelper.tableMoments,
        where: 'id = ?',
        whereArgs: [momentId],
      );
      // Konfirmasi apakah data ditemukan
      if (result.isEmpty) {
        return null;
      }
      // Mengonversi hasil ke bentuk object moment
      final moment = Moment.fromMap(result.first);
      // Mengembalikan hasil dalam bentuk object
      return moment;
    } catch (e) {
      log(e.toString(), name: 'DbMomentRepository:getMomentById');
      return null;
    }
  }

  @override
  Future<void> updateMoment(Moment updateMoment) async {
    try {
      // Akses database
      final db = await databaseHelper.database;
      // Melakukan operasi update data
      await db.update(
        DatabaseHelper.tableMoments,
        updateMoment.toMap(),
        where: 'id = ?',
        whereArgs: [updateMoment.id],
      );
    } catch (e) {
      log(e.toString(), name: 'DbMomentRepository:updateMoment');
    }
  }
}

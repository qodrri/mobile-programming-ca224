import '../../models/moment.dart';

abstract class AbsMomentRepository {
  Future<void> addMoment(Moment newMoment);
  Future<void> updateMoment(Moment updateMoment);
  Future<void> deleteMoment(String momentId);
  Future<Moment?> getMomentById(String momentId);
  Future<List<Moment>> getAllMoments();
}

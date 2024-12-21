import '../../models/moment.dart';
import '../../models/user.dart';

abstract class AbsApiUserDataRepository {
  Future<List<Moment>> getAllMoments([String keyword = '']);
  Future<User?> getSelf();
  Future<List<User>> getAllFollowers([String keyword = '']);
  Future<List<User>> getAllFollowings([String keyword = '']);
  Future<bool> follow(String userId);
  Future<bool> unfollow(String userId);
}

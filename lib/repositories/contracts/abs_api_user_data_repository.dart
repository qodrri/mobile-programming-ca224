import '../../models/moment.dart';
import '../../models/user.dart';

abstract class AbsApiUserDataRepository {
  Future<List<Moment>> getMoments([String keyword = '']);
  Future<List<User>> getFollowers([String keyword = '']);
  Future<List<User>> getFollowing([String keyword = '']);
  Future<bool> follow(String userId);
  Future<bool> unfollow(String userId);
}

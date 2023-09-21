import 'package:deka_mobile/models/entities/profile/profile.dart';
import 'package:floor/floor.dart';

@dao
abstract class ProfileDao {
  @Insert()
  Future<void> insertProfile(ProfileEntity model);

  @delete
  Future<void> deleteProfile(ProfileEntity model);

  @Query('SELECT * FROM profile')
  Future<List<ProfileEntity>> getProfile();

  @Query('DELETE FROM profile')
  Future<void> deleteAll();
}
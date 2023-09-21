import 'dart:async';

import 'package:deka_mobile/models/entities/profile/profile.dart';
import 'package:deka_mobile/models/entities/profile/profile_dao.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

class ProfileDaoImpl extends ProfileDao {
  ProfileDaoImpl(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _profileInsertionAdapter = InsertionAdapter(
            database,
            'profile',
                (ProfileEntity item) => <String, Object?>{
              'userId' : item.userId,
              'nik' : item.nik,
              'username' : item.username,
              'password' : item.password,
              'typeuserCode' : item.typeuserCode,
              'typeuserName' : item.typeuserName,
              'code' : item.code,
              'name' : item.name,
              'address' : item.address,
              'tempatLahir' : item.tempatLahir,
              'tglLahir' : item.tglLahir,
              'tglMasuk' : item.tglMasuk,
              'email' : item.email,
              'phone1' : item.phone1,
              'phone2' : item.phone2,
              'photo' : item.photo,
              'photoKtp' : item.photoKtp,
              'noKtp' : item.noKtp,
              'typeuserId' : item.typeuserId,
              'divisiCode' : item.divisiCode,
              'jabatanCode' : item.jabatanCode,
              'deviceId' : item.deviceId,
              'deviceBrand' : item.deviceBrand,
              'deviceType' : item.deviceType,
              'firebaseId' : item.firebaseId,
              'costCenterCode' : item.costCenterCode,
              'lokasi' : item.lokasi,
              'organizationLevel' : item.organizationLevel,
              'status': item.status,
              'statusKirim': item.statusKirim,
              'createdAt': item.createdAt,
              'updatedAt': item.updatedAt,
            }),
        _profileDeletionAdapter = DeletionAdapter(
            database,
            'profile',
            ['userId'],
                (ProfileEntity item) => <String, Object?>{
              'userId' : item.userId,
              'nik' : item.nik,
              'username' : item.username,
              'password' : item.password,
              'typeuserCode' : item.typeuserCode,
              'typeuserName' : item.typeuserName,
              'code' : item.code,
              'name' : item.name,
              'address' : item.address,
              'tempatLahir' : item.tempatLahir,
              'tglLahir' : item.tglLahir,
              'tglMasuk' : item.tglMasuk,
              'email' : item.email,
              'phone1' : item.phone1,
              'phone2' : item.phone2,
              'photo' : item.photo,
              'photoKtp' : item.photoKtp,
              'noKtp' : item.noKtp,
              'typeuserId' : item.typeuserId,
              'divisiCode' : item.divisiCode,
              'jabatanCode' : item.jabatanCode,
              'deviceId' : item.deviceId,
              'deviceBrand' : item.deviceBrand,
              'deviceType' : item.deviceType,
              'firebaseId' : item.firebaseId,
              'costCenterCode' : item.costCenterCode,
              'lokasi' : item.lokasi,
              'organizationLevel' : item.organizationLevel,
              'status': item.status,
              'statusKirim': item.statusKirim,
              'createdAt': item.createdAt,
              'updatedAt': item.updatedAt,
            });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<ProfileEntity> _profileInsertionAdapter;

  final DeletionAdapter<ProfileEntity> _profileDeletionAdapter;

  @override
  Future<List<ProfileEntity>> getProfile() async {
    return _queryAdapter.queryList('SELECT * FROM profile',
        mapper: (Map<String, Object?> row) => _profileMapper(row)
    );
  }

  @override
  Future<void> insertProfile(ProfileEntity model) async {
    await _profileInsertionAdapter.insert(
        model, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteProfile(ProfileEntity model) async {
    await _profileDeletionAdapter.delete(model);
  }

  @override
  Future<void> deleteAll() async {
    await _queryAdapter.queryNoReturn('DELETE FROM profile');
  }

  ProfileEntity _profileMapper(Map<String, Object?> row) {
    return ProfileEntity(
      userId: row['userId'] as String?,
      nik: row['nik'] as String?,
      username: row['username'] as String?,
      password: row['password'] as String?,
      typeuserCode: row['typeuserCode'] as String?,
      typeuserName: row['typeuserName'] as String?,
      code: row['code'] as String?,
      name: row['name'] as String?,
      address: row['address'] as String?,
      tempatLahir: row['tempatLahir'] as String?,
      tglLahir: row['tglLahir'] as String?,
      tglMasuk: row['tglMasuk'] as String?,
      email: row['email'] as String?,
      phone1: row['phone1'] as String?,
      phone2: row['phone2'] as String?,
      photo: row['photo'] as String?,
      photoKtp: row['photoKtp'] as String?,
      noKtp: row['noKtp'] as String?,
      typeuserId: row['typeuserId'] as String?,
      divisiCode: row['divisiCode'] as String?,
      jabatanCode: row['jabatanCode'] as String?,
      deviceId: row['deviceId'] as String?,
      deviceBrand: row['deviceBrand'] as String?,
      deviceType: row['deviceType'] as String?,
      firebaseId: row['firebaseId'] as String?,
      costCenterCode: row['costCenterCode'] as String?,
      lokasi: row['lokasi'] as String?,
      organizationLevel: row['organizationLevel'] as String?,
      status: row['status'] as int?,
      statusKirim: row['statusKirim'] as int?,
      createdAt: row['createdAt'] as String?,
      updatedAt: row['updatedAt'] as String?,
    );
  }
}
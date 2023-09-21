import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

@Entity(tableName: 'profile', primaryKeys: ['userId'])
class ProfileEntity extends Equatable {
  final String? userId;
  final String? nik;
  final String? username;
  final String? password;
  final String? typeuserCode;
  final String? typeuserName;
  final String? code;
  final String? name;
  final String? address;
  final String? tempatLahir;
  final String? tglLahir;
  final String? tglMasuk;
  final String? email;
  final String? phone1;
  final String? phone2;
  final String? photo;
  final String? photoKtp;
  final String? noKtp;
  final String? typeuserId;
  final String? divisiCode;
  final String? jabatanCode;
  final String? deviceId;
  final String? deviceBrand;
  final String? deviceType;
  final String? firebaseId;
  final String? costCenterCode;
  final String? lokasi;
  final String? organizationLevel;
  final int? status;
  final int? statusKirim;
  final String? createdAt;
  final String? updatedAt;

  ProfileEntity({
    this.username,
    this.password,
    this.typeuserCode,
    this.typeuserName,
    this.userId,
    this.nik,
    this.code,
    this.name,
    this.address,
    this.tempatLahir,
    this.tglLahir,
    this.tglMasuk,
    this.email,
    this.phone1,
    this.phone2,
    this.photo,
    this.photoKtp,
    this.noKtp,
    this.typeuserId,
    this.divisiCode,
    this.jabatanCode,
    this.deviceId,
    this.deviceBrand,
    this.deviceType,
    this.firebaseId,
    this.costCenterCode,
    this.lokasi,
    this.organizationLevel,
    this.status,
    this.statusKirim,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props {
    return [
      username,
      password,
      typeuserCode,
      typeuserName,
      userId,
      nik,
      code,
      name,
      address,
      tempatLahir,
      tglLahir,
      tglMasuk,
      email,
      phone1,
      phone2,
      photo,
      photoKtp,
      noKtp,
      typeuserId,
      divisiCode,
      jabatanCode,
      deviceId,
      deviceBrand,
      deviceType,
      firebaseId,
      costCenterCode,
      lokasi,
      organizationLevel,
      status,
      statusKirim,
      createdAt,
      updatedAt,
    ];
  }
}

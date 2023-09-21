import 'dart:async';

import 'package:deka_mobile/config/migration_scripts.dart';
import 'package:deka_mobile/models/entities/profile/profile.dart';
import 'package:deka_mobile/models/entities/profile/profile_dao.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../models/entities/profile/profile_dao_impl.dart';

part 'database_config_impl.dart';

@Database(version: 5, entities: [ProfileEntity])
abstract class DatabaseConfig extends FloorDatabase {
  ProfileDao get profileDao;
}
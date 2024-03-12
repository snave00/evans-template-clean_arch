import 'package:isar/isar.dart';

import '../../../../utils/extenstions/date_extension.dart';
import '../../../../utils/helpers/isar/isar_helper.dart';
import '../../../../utils/helpers/shared/date_time_helper.dart';
import '../../../domain/entities/user_entity.dart';
import '../../../domain/entities/user_settings_entity.dart';
import 'user_settings_isar_model.dart';

part 'user_isar_model.g.dart';

/// * Isar Model - the DTO (Data transfer object) for local storage
/// We need Entity and Models for clean architecture.
/// We may change database if we decide and the models are just modified
/// Always 'Id id = Isar.autoIncrement;'. This is an integer
/// But in our case we need string id which is not currently supported by isar
/// So we used, a fasthash 'Id get isarId => fastHash(id!);'
/// Link: https://isar.dev/recipes/string_ids.html
/// [file_name.g.dart] must match with the current isar file name.
/// Use 'Index()' to auto sort the object by that property
/// It will also give you additional functions like 'userIdEqualTo()'
/// Use '@Enumerated' for enums
/// * Generate isar files
/// [flutter pub run build_runner build] in terminal to generate.
/// [flutter pub run build_runner watch] in terminal to auto generate.
/// Make sure to save the file first before running command to avoid issues.
/// * Open the Isar database like in [isar_database_service.dart]
/// Add the Schemas (UserIsarModelSchema, TransactionIsarModelSchema..)
/// * freezed - generates [copyWith, equatable, operator ==, hashCode, toString]
/// We currently do not need to make it as freezed
/// As per author freezed is not supported by Isar but there's a workaround
/// A user commented a solution here: https://github.com/isar/isar/issues/197
/// Not sure if wee need Equatable here. But for now it's only neede in Entities
/// Cmd + . / Ctrl + . - to generate equatable, copyWith, toString/stringify
/// Add fromEntity & toEntity if not extended to Entity Object
/// Add toJson & fromJson if from Remote using @JsonSerializable and generate
/// Make sure to add '?' in props [List<Object?>]
/// * Need: copyWith(), empty(), toEntity()

enum Entitlement {
  basic,
  premium,
}

@collection
class UserIsarModel {
  // to use collection.getByYourId(),deleteByYourId() methods
  @Index(unique: true, replace: true)
  final String? userId;

  // to get hash the itemId.
  Id get isarId => fastHash(userId ?? '');

  final String? email;

  final String? name;

  @Enumerated(EnumType.name)
  final Entitlement? entitlement;

  final DateTime? lastUpdated;

  final DateTime? lastAutoSyncDate;

  final UserSettingsIsarModel? userSettings;

  UserIsarModel({
    this.userId,
    this.email,
    this.name,
    this.entitlement,
    this.lastUpdated,
    this.lastAutoSyncDate,
    this.userSettings,
  });

  UserIsarModel copyWith({
    String? userId,
    String? email,
    String? name,
    Entitlement? entitlement,
    DateTime? lastUpdated,
    DateTime? lastAutoSyncDate,
    UserSettingsIsarModel? userSettings,
  }) {
    return UserIsarModel(
      userId: userId ?? this.userId,
      email: email ?? this.email,
      name: name ?? this.name,
      entitlement: entitlement ?? this.entitlement,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      lastAutoSyncDate: lastAutoSyncDate ?? this.lastAutoSyncDate,
      userSettings: userSettings ?? this.userSettings,
    );
  }

  factory UserIsarModel.empty() {
    return UserIsarModel(
      userId: '',
      email: '',
      name: '',
      entitlement: Entitlement.basic,
      lastUpdated: DateTimeHelper.getEmptyDateTime(),
      lastAutoSyncDate: DateTimeHelper.getEmptyDateTime().removeTime,
      userSettings: UserSettingsIsarModel.empty(),
    );
  }

  UserEntity toEntity() => UserEntity(
        userId: userId ?? '',
        email: email ?? '',
        name: name ?? '',
        entitlement: entitlement ?? Entitlement.basic,
        lastUpdated: lastUpdated ?? DateTimeHelper.getEmptyDateTime(),
        lastAutoSyncDate:
            lastAutoSyncDate ?? DateTimeHelper.getEmptyDateTime().removeTime,
        userSettings: userSettings?.toEntity() ?? UserSettingsEntity.empty(),
      );
}

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../utils/helpers/shared/date_time_helper.dart';
import '../isar_models/user_isar_model.dart';
import 'user_settings_model.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

/// * Remote Model - the DTO (Data transfer object) for remote storage
/// We need Entity and Models for clean architecture.
/// We may change database if we decide and the models are just modified
/// Always add [id] property.
/// [file_name.g.dart] must match with the current file name.
/// * freezed - generates [copyWith, equatable, operator ==, hashCode, toString]
/// * https://pub.dev/packages/freezed
/// * Add part 'file_name.freezed.dart'
/// * Follow the code format below especially the [_$UserModel]
/// * To add toJson & froJson, add json_annotation & json_serilizable package
/// * Add part 'file_name.g.dart'
/// * Add 'factory UserEntity.fromJson(Map<String, dynamic> json) => _$UserEntityFromJson(json);'
/// * and generate. This will add toJson & fromJson automatically

// [JsonSerializable] to all model that need to/from Json.
/// [JsonSerializable] with [explicitToJson] to `true` for nested objects.
/// [@JsonKey(name: 'user_id')] to override property key value.
///

/// * Generate code
/// * Make sure to save the file first before running command to avoid issues.
/// * [flutter pub run build_runner build] in terminal to generate.
/// * [flutter pub run build_runner watch] in terminal to auto generate.
/// * To Add Custom Methods => https://youtu.be/dUc95hhAWLo?t=247
/// * Must add private constructor `const UserModel._();` to add custom methods
/// - for toEntity & toHiveModel & toModel to work in free generated
/// - remove const in const factory UserEntity({})
/// * Remove const in const factory ClassName
/// * Custom methods will not work if no private constructor was added
/// * For nested objects add this above `factory UserHiveModel({})`:
/// * @JsonSerializable(explicitToJson: true)
/// * or create a build.yaml ad set `explicit_to_json: true` link below:
/// [https://github.com/google/json_serializable.dart/tree/master/json_serializable#build-configuration]
/// Add UserModel.empty() for empty state
/// Must be nullable keys/fields/params
///
/// Disregard below comments if used freezed
/// Only add Equatable if not extended on it's entity
/// Cmd + . / Ctrl + . - to generate equatable, copyWith, toString/stringify
/// Add fromEntity & toEntity if not extended to Entity Object
/// Add toJson & fromJson if from Remote using @JsonSerializable and generate
///  Make sure to add '?' in props [List<Object?>]

@freezed
class UserModel with _$UserModel {
  UserModel._();

  factory UserModel({
    final String? userId,
    final String? email,
    final String? name,
    final Entitlement? entitlement, // get from Revenue Cat backend
    // final bool? isPremium,
    final DateTime? lastUpdated,
    final UserSettingsModel? userSettings,
  }) = _UserModel;

  factory UserModel.empty() {
    return UserModel(
      userId: '',
      email: '',
      name: '',
      entitlement: Entitlement.basic,
      lastUpdated: DateTimeHelper.getEmptyDateTime(),
      userSettings: UserSettingsModel.empty(),
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

import '../../data/models/isar_models/user_isar_model.dart';
import '../../../utils/extenstions/date_extension.dart';
import '../../../utils/helpers/shared/date_time_helper.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'user_settings_entity.dart';

part 'user_entity.freezed.dart';
part 'user_entity.g.dart';

/// * Entity - outline that app expect whether it came from local/api/firebase.
/// We need Entity and Models for clean architecture.
/// We may change database if we decide and the models are just modified
/// Entities remain the same as domain layer must remain independent
/// [https://youtu.be/ffR-zi7eHL4?t=76] - watch simple explanation here
/// Add Entity.empty() for empty state
/// * freezed - generates [copyWith, equatable, operator ==, hashCode, toString]
/// - https://pub.dev/packages/freezed
/// - Add part 'file_name.freezed.dart'
/// - Follow the code format below especially the [_$UserEntity]
/// * Generate code
/// - [flutter pub run build_runner build] in terminal to generate.
/// - [flutter pub run build_runner watch] in terminal to auto generate.
/// - Make sure to save the file first before running command to avoid issues.
/// * To add toJson & froJson, add json_annotation & json_serilizable package
/// - Add part 'file_name.g.dart'
/// - Add 'factory UserEntity.fromJson(Map<String, dynamic> json) => _$UserEntityFromJson(json);'
/// - and generate again. This will add toJson & fromJson automatically
/// * To Add Custom Methods => https://youtu.be/dUc95hhAWLo?t=247
/// - Must add private constructor `const UserEntity._();` to add custom methods
/// - for toEntity & toHiveModel & toModel to work in free generated
/// - remove const in const factory UserEntity({})
/// * Custom methods will not work if no private constructor was added
/// * For nested objects add this above `class UserEntity with _$UserEntity`:
/// * @JsonSerializable(explicitToJson: true)
/// * @Default('') is equavalent to @JsonKey(defaultValue: ) in json_serializable
/// use @Default('') to set default value if Json data from converting model is null
/// for example, if json data does not have `userId` param, set the Default value
/// Disregard below comments if used freezed
/// You can now not use Equatable since it was already generated in freezed
/// If not using freezed:
/// Cmd + . / Ctrl + . - to generate equatable, copyWith, toString/stringify
///  Make sure to add '?' in props [List<Object?>]
/// to avoid error when extending entity to model
/// * Need: @freezed, empty(), toIsarModel(), toJson and fromJson (auto gen)

@freezed
class UserEntity with _$UserEntity {
  UserEntity._();

  factory UserEntity({
    required final String userId,
    required final String email,
    required final String name,
    // required final bool isEmailVerified, // get isEmailVerified in firebase
    required final Entitlement entitlement, // only get in local and revenue cat
    required final DateTime lastUpdated,
    required final DateTime lastAutoSyncDate,
    required final UserSettingsEntity userSettings,
  }) = _UserEntity;

  factory UserEntity.empty() {
    return UserEntity(
      userId: '',
      email: '',
      name: '',
      entitlement: Entitlement.basic,
      lastUpdated: DateTimeHelper.getEmptyDateTime(),
      lastAutoSyncDate: DateTimeHelper.getEmptyDateTime().removeTime,
      userSettings: UserSettingsEntity.empty(),
    );
  }

  UserIsarModel toIsarModel() => UserIsarModel(
        userId: userId,
        email: email,
        name: name,
        entitlement: entitlement,
        lastUpdated: lastUpdated,
        lastAutoSyncDate: lastAutoSyncDate.removeTime,
        userSettings: userSettings.toIsarModel(),
      );

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);
}

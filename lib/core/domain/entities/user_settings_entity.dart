import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../utils/constants/app_defaults.dart';
import '../../data/models/isar_models/user_settings_isar_model.dart';

part 'user_settings_entity.freezed.dart';
part 'user_settings_entity.g.dart';

@freezed
class UserSettingsEntity with _$UserSettingsEntity {
  UserSettingsEntity._();

  factory UserSettingsEntity({
    required final String language,
    required final ThemeMode themeMode,
    required final DateTime reminderTime,
  }) = _UserSettingsEntity;

  factory UserSettingsEntity.empty() {
    return UserSettingsEntity(
      language: AppDefaults.defaultLanguageString,
      themeMode: AppDefaults.defaultThemeEnum,
      reminderTime: AppDefaults.defaultReminderTime,
    );
  }

  UserSettingsIsarModel toIsarModel() => UserSettingsIsarModel(
        language: language,
        themeMode: themeMode,
        reminderTime: reminderTime,
      );

  factory UserSettingsEntity.fromJson(Map<String, dynamic> json) =>
      _$UserSettingsEntityFromJson(json);
}

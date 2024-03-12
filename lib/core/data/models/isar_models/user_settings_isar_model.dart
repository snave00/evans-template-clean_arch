import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

import '../../../../../utils/constants/app_defaults.dart';
import '../../../domain/entities/user_settings_entity.dart';

part 'user_settings_isar_model.g.dart';

/// * Add embedded for nested objects that's not needed as new collection
@embedded
class UserSettingsIsarModel {
  final String? language;

  @Enumerated(EnumType.name)
  final ThemeMode? themeMode;

  final DateTime? reminderTime; // get time only

  UserSettingsIsarModel({
    this.language,
    this.themeMode,
    this.reminderTime,
  });

  UserSettingsIsarModel copyWith({
    String? language,
    ThemeMode? themeMode,
    DateTime? reminderTime,
  }) {
    return UserSettingsIsarModel(
      language: language ?? this.language,
      themeMode: themeMode ?? this.themeMode,
      reminderTime: reminderTime ?? this.reminderTime,
    );
  }

  factory UserSettingsIsarModel.empty() {
    return UserSettingsIsarModel(
      language: AppDefaults.defaultLanguageString,
      themeMode: AppDefaults.defaultThemeEnum,
      reminderTime: AppDefaults.defaultReminderTime,
    );
  }

  UserSettingsEntity toEntity() => UserSettingsEntity(
        language: language ?? AppDefaults.defaultLanguageString,
        themeMode: themeMode ?? AppDefaults.defaultThemeEnum,
        reminderTime: reminderTime ?? AppDefaults.defaultReminderTime,
      );
}

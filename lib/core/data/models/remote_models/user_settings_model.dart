import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../utils/constants/app_defaults.dart';

part 'user_settings_model.freezed.dart';
part 'user_settings_model.g.dart';

@freezed
class UserSettingsModel with _$UserSettingsModel {
  UserSettingsModel._();

  factory UserSettingsModel({
    // final ThemeMode? themeMode, // app level only
    final DateTime? reminderTime, // get time only
  }) = _UserSettingsModel;

  factory UserSettingsModel.empty() {
    return UserSettingsModel(
      reminderTime: AppDefaults.defaultReminderTime,
    );
  }

  factory UserSettingsModel.fromJson(Map<String, dynamic> json) =>
      _$UserSettingsModelFromJson(json);
}

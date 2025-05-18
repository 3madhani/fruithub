import 'dart:convert';

import '../../feature/auth/data/models/user_model.dart';
import '../../feature/auth/domain/entities/user_entity.dart';
import '../constants/app_const.dart';
import '../services/shared_preferences_singleton.dart';

UserEntity getUserEntity() {
  var jsonString = Prefs.getString(AppConst.userData);
  return UserModel.fromJson(jsonDecode(jsonString));
}

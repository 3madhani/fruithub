import 'dart:convert';

import '../../feature/auth/data/models/user_model.dart';
import '../../feature/auth/domain/entities/user_entity.dart';
import '../constants/app_const.dart';
import '../services/shared_preferences_singleton.dart';

UserEntity getUserEntity() {
  try {
    final jsonString = Prefs.getString(AppConst.userData);

    if (jsonString.trim().isEmpty) {
      return UserModel(uId: '', email: '', name: '');
    }

    final jsonMap = jsonDecode(jsonString);
    return UserModel.fromJson(jsonMap);
  } catch (e) {
    return UserModel(uId: '', email: '', name: '');
  }
}

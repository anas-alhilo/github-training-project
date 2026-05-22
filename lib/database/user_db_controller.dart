import 'package:flutter/cupertino.dart';
import 'package:flutter1_project/database/db_controller.dart';
import 'package:flutter1_project/database/prefs/shared_pref_controller.dart';
import 'package:flutter1_project/l10n/app_localizations.dart';
import 'package:flutter1_project/model/process_response.dart';
import 'package:flutter1_project/model/user.dart';
import 'package:sqflite/sqflite.dart';

class UserDbController {
  final Database _database = DbController().database;

  Future<ProcessResponse> login({
    required String email,
    required String password,
    required bool isRememberMe,
    required BuildContext context,
  }) async {
    List<Map<String, dynamic>> map = await _database.query(
      User.tableName,
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );
    if (map.isNotEmpty) {
      User user = User.fromMap(map.first);
      SharedPrefController().saveLogin(isRememberMe);
      saveEmail(user.id);
      return ProcessResponse(
        message: AppLocalizations.of(context)!.login_successfully,
        success: true,
      );
    }
    return ProcessResponse(
      message: AppLocalizations.of(context)!.credentials_error,
    );
  }

  Future<ProcessResponse> register(User user, BuildContext context) async {
    if (await _isEmailExist(user.email)) {
      return ProcessResponse(
        message: AppLocalizations.of(context)!.email_exist,
      );
    } else {
      int rawInsert = await _database.insert(User.tableName, user.toMap());
      return ProcessResponse(
        message: rawInsert != 0
            ? AppLocalizations.of(context)!.register_success
            : AppLocalizations.of(context)!.register_failed,
        success: rawInsert != 0,
      );
    }
  }

  Future<bool> _isEmailExist(String email) async {
    List<Map<String, dynamic>> map = await _database.rawQuery(
      'SELECT * FROM ${User.tableName} WHERE email = ?',
      [email],
    );
    return map.isNotEmpty;
  }

  void saveLogin(bool isRememberMe) {}

  Future<ProcessResponse> updateUser(User user, BuildContext context) async {
    int rawId = await _database.update(
      User.tableName,
      user.toMap(),
      where: 'id = ?',
      whereArgs: [user.id],
    );

    return ProcessResponse(
      message: AppLocalizations.of(context)!.profile_updated,
      success: rawId != 0,
    );
  }

  Future<User?> getUserById(int id) async {
    List<Map<String, dynamic>> map = await _database.query(
      User.tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
    if (map.isNotEmpty) {
      return User.fromMap(map.first);
    }
  }

  void saveEmail(int id) {
    SharedPrefController().saveId(id);
  }
}

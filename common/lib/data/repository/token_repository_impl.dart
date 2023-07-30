import 'package:common/domain/repository/i_token_repository.dart';
import 'package:dependencies/shared_preferences.dart';

class TokenRepositoryImpl implements ITokenRepository {
  static const _tokenKey = 'token';
  SharedPreferences? _sharedPreferences;

  @override
  Future<String?> getToken() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    return _sharedPreferences!.getString(_tokenKey);
  }

  @override
  Future<void> putToken(String token) async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    _sharedPreferences!.setString(_tokenKey, token);
  }

  @override
  Future<bool> clearToken() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    return await _sharedPreferences!.clear();
  }
}

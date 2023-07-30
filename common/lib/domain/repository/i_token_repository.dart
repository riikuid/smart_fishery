abstract class ITokenRepository {
  Future<void> putToken(String token);
  Future<String?> getToken();
  Future<bool> clearToken();
}

abstract class SessionRepository {
  Future<void> login(var url, var apiKey);

  Future<void> refresh(var url);
}

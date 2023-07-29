class FormatBearerUseCase{
  Map<String , String>format(String token) =>
      {
        "Authorization": "Bearer $token",
      };
}
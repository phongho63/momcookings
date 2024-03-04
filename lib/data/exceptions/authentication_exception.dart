class APIException implements Exception  {
  final String message;
  final int statusCode;
  final String? statusText;

  APIException(this.message, this.statusCode, this.statusText);
}
/// "entityName":"UsernameOrPassword",
/// "errorKey":"Incorrect",
/// "type":"https://malu.company/problem/problem-with-message",
/// "title":"UsernameOrPassword.Incorrect",
/// "status":401,
/// "data":null,
/// "message":"errorUsernameOrPasswordIncorrect",
/// "params":"UsernameOrPassword"}

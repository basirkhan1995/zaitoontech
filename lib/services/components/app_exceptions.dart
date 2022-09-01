
class AppException implements Exception{
  late final String message;
  late final String prefix;
  late final String url;
  AppException(this.message,this.prefix,this.url);
}

class BadRequestException extends AppException{
  BadRequestException([String? message, String? url]) : super(message!, "Bad Request",url!);
}
class FetchDataException extends AppException{
  FetchDataException([String? message, String? url]) : super(message!, "Fetch Data Exception",url!);
}
class ApiNotRespondingException extends AppException{
  ApiNotRespondingException([String? message, String? url]) : super(message!, "Api not responding",url!);
}
class UnAuthorizedException extends AppException{
  UnAuthorizedException([String? message, String? url]) : super(message!, "UnAuthorized Exception",url!);
}

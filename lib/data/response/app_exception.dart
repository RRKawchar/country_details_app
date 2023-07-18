class AppException implements Exception{

  final _message;
  final _prefix;
  AppException([this._message,this._prefix]);

  @override
  String toString(){
    return "$_message$_prefix";
  }

}
class InternetException extends AppException {
  InternetException([String? message]) : super(message, 'No Internet');
}

class RequestTimeOut extends AppException {
  RequestTimeOut([String? message]) : super(message, 'Request Time out');
}

class ServerException extends AppException {
  ServerException([String? message]) : super(message, 'Server Exception');
}

class InvalidUrlException extends AppException {
  InvalidUrlException([String? message]) : super(message, 'Invalid Url ');
}


class FetchDataException extends AppException {
  FetchDataException([String? message]) : super(message, '');
}
class AppException implements Exception{

  String title;
  String msg;

  AppException({required this.title,required this.msg});

  String toErrorMsg(){
    return "$title: $msg";
  }
}

class FetchDataException extends AppException{
  FetchDataException(String errorMsg) : super(title: "Network Error",msg: errorMsg);
}


class BadRequestException extends AppException{
  BadRequestException(String errorMsg) : super(title: "BadRequest",msg: errorMsg);
}

class UnauthorisedException extends AppException{
  UnauthorisedException(String errorMsg) : super(title: "Unauthorised",msg: errorMsg);
}

class InvalidInputException extends AppException{
  InvalidInputException(String errorMsg) : super(title: "InvalidInput",msg: errorMsg);
}

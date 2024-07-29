sealed class ApiResult{}

class Success<T> extends ApiResult{
  T result;

  Success({required this.result});
}

class Failure extends ApiResult{
  String errorMessage;

  Failure({required this.errorMessage});
}
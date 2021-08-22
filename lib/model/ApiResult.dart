class ApiResult<T>{
  late int code;
  late String msg;
  late T data;

  ApiResult(this.code, this.msg, this.data);
}
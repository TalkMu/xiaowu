class ApiResult<T>{
  late int code;
  late String desc;
  late T data;

  ApiResult(this.code, this.desc, this.data);
}
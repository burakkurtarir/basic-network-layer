/// Contains the data and other informations of the response
class ResponseModel {
  const ResponseModel({
    this.data,
    this.statusCode,
    this.statusMessage,
  });

  final dynamic data;
  final int? statusCode;
  final String? statusMessage;
}

class ErrorMessageModel {
  final bool status;
  final int statusCode;
  final String Message;

  ErrorMessageModel(
    this.status,
    this.statusCode,
    this.Message,
  );

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) {
    return ErrorMessageModel(
      json['success'],
      json['status_code'],
      json['status_message'],
    );
  }
}

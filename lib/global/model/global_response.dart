class GlobalResponse {
  GlobalResponse({
    this.message,
    this.error,
    this.code,
  });

  String? message;
  String? error;
  int? code;

  factory GlobalResponse.fromJson(Map<String, dynamic> json) => GlobalResponse(
        message: json["message"],
        error: json["error"] == null ? null : json["errors"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "errors": error,
        "code": code,
      };
}

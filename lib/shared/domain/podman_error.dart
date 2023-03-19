class PodmanError extends Error {
  String cause;
  String message;
  int response;

  PodmanError(this.cause, this.message, this.response);

  factory PodmanError.fromJson(Map<String, dynamic> json) {
    final cause = json['cause'];
    final message = json['message'];
    final response = json['response'];
    return PodmanError(cause, message, response);
  }

  Map<String, dynamic> toJson() {
    return {'cause': cause, 'message': message, 'response': response};
  }
}

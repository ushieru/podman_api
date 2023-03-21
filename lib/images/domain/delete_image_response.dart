class DeleteImageResponse {
  List<String> deleted;
  List<String> untagged;
  int exitCode;
  List<String> errors;

  DeleteImageResponse(this.deleted, this.untagged, this.exitCode, this.errors);

  factory DeleteImageResponse.fromJson(Map<String, dynamic> json) {
    print(json);
    final deleted = json['Deleted'] == null ? [] : json['Deleted'].cast<String>();
    final untagged = json['Untagged'] == null ? [] : json['Untagged'].cast<String>();
    final exitCode = json['ExitCode'];
    final errors = json['Errors'] == null ? [] : json['Errors'].cast<String>();
    return DeleteImageResponse(deleted, untagged, exitCode, errors);
  }

  Map<String, dynamic> toJson() {
    return {
      'Deleted': deleted,
      'Untagged': untagged,
      'ExitCode': exitCode,
      'Errors': errors
    };
  }

  @override
  String toString() {
    return 'DeteleImageResponse(${toJson()})';
  }
}

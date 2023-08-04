class GeneralErrorModel {
  final String? reason;
  final String? description;

  const GeneralErrorModel({
    this.reason,
    this.description,
  });

  factory GeneralErrorModel.fromJson(Map<String, dynamic> json) {
    return GeneralErrorModel(
      reason: json["reason"] as String?,
      description: json["description"] as String?,
    );
  }
}

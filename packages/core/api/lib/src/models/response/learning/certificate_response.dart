import 'package:base/base.dart';
import 'package:json_annotation/json_annotation.dart';

part 'certificate_response.g.dart';

@JsonSerializable(createToJson: false)
class CertificateResponse extends Equatable {
  @JsonKey(name: 'file_name')
  final String? fileName;
  @JsonKey(name: 'base64_data')
  final String? base64Data;

  const CertificateResponse({
    this.fileName,
    this.base64Data,
  });

  @override
  List<Object?> get props => [fileName, base64Data];

  factory CertificateResponse.fromJson(Map<String, dynamic> json) => _$CertificateResponseFromJson(json);
}

import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()

class PartnerConsents {
  
  final String? id;
  @JsonKey(name: 'connection_id')
  final String? connectionId;
  @JsonKey(name: 'customer_id')
  final String? customerId;
  final String? status;
  @JsonKey(name: 'revoked_by')
  final String? revokedBy;
  @JsonKey(name: 'revoked_at')
  final String? revokedAt;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  PartnerConsents(
    this.id,
    this.connectionId,
    this.customerId,
    this.status,
    this.revokedBy,
    this.revokedAt,
    this.createdAt,
    this.updatedAt

  );

  factory PartnerConsents.fromJson(Map<String, dynamic> json){
      return PartnerConsents(
        json['id'] as String? ?? '',
        json['connection_id'] as String? ?? '',
        json['customer_id'] as String? ?? '',
        json['status'] as String? ?? '',
        json['revoked_by'] as String? ?? '',
        json['revoked_at'] as String? ?? '',
        json['created_at'] as String? ?? '',
        json['updated_at'] as String? ?? '',
      );
    }
}
class PartnerConsentsResult {
  final List<PartnerConsents>? partnerConsents;
  final String? error;

  PartnerConsentsResult({this.partnerConsents, this.error});

  bool get isSuccess => partnerConsents != null;
}

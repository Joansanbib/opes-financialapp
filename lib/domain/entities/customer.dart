import 'package:json_annotation/json_annotation.dart';

class Customer{
  
  final String? id;
  final String? identifier;
  final String? secret;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'blocked_at')
  final String? blockedAt;

  Customer({required this.id, required this.identifier, required this.secret, required this.updatedAt, required this.createdAt, required this.blockedAt});

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      id : json['id'] as String? ?? '', 
      identifier : json['identifier'] as String? ?? '',
      secret : json['secret'] as String? ?? '',
      updatedAt: json['updatedAt'] as String? ?? '',
      createdAt : json['createdAt'] as String? ?? '',
      blockedAt:  json['blockedAt'] as String? ?? ''
    );
  }

}
class CustomerResult {
  final List<Customer>? customers;
  final String? error;

  CustomerResult({this.customers, this.error});

  bool get isSuccess => customers != null;
}

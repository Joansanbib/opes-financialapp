import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()

class Provider{
  final String? id;
  final String? code;
  final String? name;
  final String? modes;
  final String? status;
  @JsonKey(name: 'automatic_fetch')
  final bool? automaticFetch;
  @JsonKey(name: 'dynamic_registration_code')
  final String? dynamicRegistrationCode;
  @JsonKey(name: 'group_code')
  final String? groupCode;
  @JsonKey(name: 'group_name')
  final String? groupName;
  final String? hub;
  @JsonKey(name: 'customer_notified_on_sign_in')
  final bool? customerNotifiedOnSignIn;
  final bool? interactive;
  final String? instruction;
  @JsonKey(name: 'home_url')
  final String? homeUrl;
  @JsonKey(name: 'login_url')
  final String? loginUrl;
  @JsonKey(name: 'logo_url')
  final String? logoUrl;
  @JsonKey(name: 'country_code')
  final String? countryCode;
  @JsonKey(name: 'refresh_timeout')
  final int? refreshTimeout;
  @JsonKey(name: 'holder_info')
  final List? holderInfo;
  @JsonKey(name: 'max_consent_days')
  final int? maxConsentDays;
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  final String? timezone;
  @JsonKey(name: 'max_interactive_delay')
  final int? maxInteractiveDelay;
  @JsonKey(name: 'optional_interactivity')
  final bool? optionalInteractivity;
  final bool? regulated;
  @JsonKey(name: 'max_fetch_interval')
  final int? maxFetchInterval;
  @JsonKey(name: 'custom_pendings')
  final bool? customPendings;
  @JsonKey(name: 'custom_pendings_period')
  final int? customPendingsPeriod;
  @JsonKey(name: 'supported_fetch_scopes')
  final List? supportedFetchScopes;
  @JsonKey(name: 'supported_account_extra_fields')
  final List? supportedAccountExtraFields;
  @JsonKey(name: 'supported_transaction_extra_fields')
  final List? supportedTransactionExtraFields;
  @JsonKey(name: 'supported_account_natures')
  final List? supportedAccountNatures;
  @JsonKey(name: 'supported_account_types')
  final List? supportedAccountTypes;
  @JsonKey(name: 'identity_codes')
  final List? identityCodes;
  @JsonKey(name: 'big_codes')
  final List? bigCodes;
  @JsonKey(name: 'supported_iframe_embedding')
  final bool? supportedIframeEmbedding;
  @JsonKey(name: 'payment_templates')
  final List? paymentTemplates;
  @JsonKey(name: 'supported_payment_fields')
  final List? supportedPaymentFields;
  @JsonKey(name: 'required_payment_fields')
  final List? requiredPaymentFields;
  @JsonKey(name: 'no_funds_rejection_supported')
  final bool? noFundsRejectionSupported;


   Provider(
    this.id,
    this.code,
    this.name,
    this.modes,
    this.status,
    this.automaticFetch,
    this.dynamicRegistrationCode,
    this.groupCode,
    this.groupName,
    this.hub,
    this.customerNotifiedOnSignIn,
    this.interactive,
    this.instruction,
    this.homeUrl,
    this.loginUrl,
    this.logoUrl,
    this.countryCode,
    this.refreshTimeout,
    this.holderInfo,
    this.maxConsentDays,
    this.createdAt,
    this.updatedAt,
    this.timezone,
    this.maxInteractiveDelay,
    this.optionalInteractivity,
    this.regulated,
    this.maxFetchInterval,
    this.customPendings,
    this.customPendingsPeriod,
    this.supportedFetchScopes,
    this.supportedAccountExtraFields,
    this.supportedTransactionExtraFields,
    this.supportedAccountNatures,
    this.supportedAccountTypes,
    this.identityCodes,
    this.bigCodes,
    this.supportedIframeEmbedding,
    this.paymentTemplates,
    this.supportedPaymentFields,
    this.requiredPaymentFields,
    this.noFundsRejectionSupported,

   );

   factory Provider.fromJson(Map<String, dynamic> json) {
    return Provider(
      json['id'] as String? ?? '',
      json['code'] as String? ?? '',
      json['name'] as String? ?? '',
      json['modes'] as String? ?? '',
      json['status'] as String? ?? '',
      json['automatic_fetch'] as bool? ?? false,
      json['dynamic_registration_code'] as String? ?? '',
      json['group_code'] as String? ?? '',
      json['group_name'] as String? ?? '',
      json['hub'] as String? ?? '',
      json['customer_notified_on_sign_in'] as bool? ?? false,
      json['interactive'] as bool? ?? false,
      json['instruction'] as String? ?? '',
      json['home_url'] as String? ?? '',
      json['login_url'] as String? ?? '',
      json['logo_url'] as String? ?? '',
      json['country_code'] as String? ?? '',
      json['refresh_timeout'] as int? ?? 0,
      json['holder_info'] as List? ?? [],
      json['max_consent_days'] as int?,
      DateTime.parse(json['created_at'] as String? ?? ''),
      DateTime.parse(json['updated_at'] as String? ?? ''),
      json['timezone'] as String?,
      json['max_interactive_delay'] as int?,
      json['optional_interactivity'] as bool?,
      json['regulated'] as bool?,
      json['max_fetch_interval'] as int?,
      json['custom_pendings'] as bool?,
      json['custom_pendings_period'] as int?,
      json['supported_fetch_scopes'] as List? ?? [],
      json['supported_account_extra_fields'] as List? ?? [],
      json['supported_transaction_extra_fields'] as List? ?? [],
      json['supported_account_natures'] as List? ?? [],
      json['supported_account_types'] as List? ?? [],
      json['identity_codes'] as List? ?? [],
      json['big_codes'] as List? ?? [],
      json['supported_iframe_embedding'] as bool? ?? false,
      json['payment_templates'] as List? ?? [],
      json['supported_payment_fields'] as List? ?? [],
      json['required_payment_fields'] as List? ?? [],
      json['no_funds_rejection_supported'] as bool? ?? false,
    );
  }


}


class ProvidersResult {
  final List<Provider>? providers;
  final String? error;

  ProvidersResult({this.providers, this.error});

  bool get isSuccess => providers != null;
}

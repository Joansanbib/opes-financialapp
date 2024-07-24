import 'package:banking_project/domain/entities/partner_consent.dart';

abstract class PartnerConsentsRepo{

  Future<PartnerConsentsResult> getPartnerConsents();
}
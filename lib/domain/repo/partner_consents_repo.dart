import 'package:banking_project/domain/entities/partner_consents.dart';

abstract class PartnerConsentsRepo{

  Future<PartnerConsentsResult> getPartnerConsents();
}
import 'dart:ffi';

enum Status {
  pending,
  requested,
  approved,
  rejected,
  abandoned
}
enum Scope{
  viewBalance,
  viewPaymentHistory,
  viewOldTransactions,
  confirmTransactions,
  viewCardCredentials,
  activateCard,
  reactivateCard,
  resetCardPin,
  initializePaymentMethod,
  chargePaymentMethod,
  updateIndividualPhoneNumber,
  updateIndividualEmail,
  applePayTokenize,
  applePayWalletExtensionTokenize,
  googlePayTokenize,
  authenticateCardOperation,
  identityVerfication,
  proofOfAdressVerification,


}

class Consent{
  final String id;
  final String individualId;
  late final String status;
  late final Enum scope;
  int limit;
  String sortType;
  // Set<String> sortType = {'ASC', 'DESC'};
  Set<String> statuses = {'pending', 'requested', 'approved', 'rejected', 'abandoned'};
  //Expires at?
  //Login?
  //Falta acabar el consent

  Consent(this.id, this.individualId, String status, String scope, this.limit, this.sortType){
    limit = 10;
    // sortType = {'DESC'};
    sortType = 'DESC';
  }
   

}
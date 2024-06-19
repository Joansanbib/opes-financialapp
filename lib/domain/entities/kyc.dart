
enum PurposeOfAccount {
  salary,
  temporaryIncomeOrSendingMoneyToFamily,
  friendsOrTrading,
  investments,
  dividendOrGeneralSpending,
}

enum MonthlyVolume {
  from0to2500,
  from2501to5000,
  from5001to10000,
  plus10000,
}

class Kyc {
  final String individualId;
  late final String purposeOfAccount;
  late final String anticipatedMonthlyVolume;

  Kyc(
    this.individualId,
    String purposeAccount,
    String monthVolume,
  ){
    purposeOfAccount = handlerPurposeOfAccount(purposeAccount);
    anticipatedMonthlyVolume = handlerMonthlyVolume(monthVolume);
  }

  String handlerPurposeOfAccount(String purpose) {
    switch (purpose) {
      case 'Salary':
        return PurposeOfAccount.salary.toString();
      case 'Temporary income, Sending money to family':
        return PurposeOfAccount.temporaryIncomeOrSendingMoneyToFamily.toString();
      case 'friends, Trading':
        return PurposeOfAccount.friendsOrTrading.toString();
      case 'Investments':
        return PurposeOfAccount.investments.toString();
      case 'Dividend, General Spending':
        return PurposeOfAccount.dividendOrGeneralSpending.toString();
      default:
        throw ArgumentError('Invalid purpose of account');
    }
  }
  String handlerMonthlyVolume(String monthVolume) {
    switch (monthVolume) {
      case 'EUR 0 - 2,500':
        return MonthlyVolume.from0to2500.toString();
      case 'EUR 2,501 - 5,000':
        return MonthlyVolume.from2501to5000.toString();
      case 'EUR 5,001 - 10,000':
        return MonthlyVolume.from5001to10000.toString();
      case 'more than EUR 10,000':
        return MonthlyVolume.plus10000.toString();
      default:
        throw ArgumentError('Invalid monthly volume');
    }
  }
}

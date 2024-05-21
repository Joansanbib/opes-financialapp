
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
  final int individualId;
  late Enum purposeOfAccount;
  late Enum anticipatedMonthlyVolume;

  Kyc(
    this.individualId,
    String purposeAccount,
    String monthVolume,
  ){
    purposeOfAccount = handlerPurposeOfAccount(purposeAccount);
    anticipatedMonthlyVolume = handlerMonthlyVolume(monthVolume);
  }

  PurposeOfAccount handlerPurposeOfAccount(String purpose) {
    switch (purpose) {
      case 'Salary':
        return PurposeOfAccount.salary;
      case 'Temporary income, Sending money to family':
        return PurposeOfAccount.temporaryIncomeOrSendingMoneyToFamily;
      case 'friends, Trading':
        return PurposeOfAccount.friendsOrTrading;
      case 'Investments':
        return PurposeOfAccount.investments;
      case 'Dividend, General Spending':
        return PurposeOfAccount.dividendOrGeneralSpending;
      default:
        throw ArgumentError('Invalid purpose of account');
    }
  }
  MonthlyVolume handlerMonthlyVolume(String monthVolume) {
    switch (monthVolume) {
      case 'EUR 0 - 2,500':
        return MonthlyVolume.from0to2500;
      case 'EUR 2,501 - 5,000':
        return MonthlyVolume.from2501to5000;
      case 'EUR 5,001 - 10,000':
        return MonthlyVolume.from5001to10000;
      case 'more than EUR 10,000':
        return MonthlyVolume.plus10000;
      default:
        throw ArgumentError('Invalid monthly volume');
    }
  }
}

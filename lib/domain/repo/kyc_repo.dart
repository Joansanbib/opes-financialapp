abstract class KycRepository{
  Future<void>questionnaire(var url, var apiKey);

  Future<void>idVerification(var url, var apiKey);
  

}
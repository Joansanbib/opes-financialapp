import 'package:banking_project/data/constants/app_constants.dart';

const baseURL = AppConstants.baseURL;

var loginURL = Uri.https('baseURL', 'auth/login');
var questionnaireURL = Uri.https('baseURL', 'kyc/questionnaire');
var idVerificationURL = Uri.https('baseURL', 'kyc/id_verification');

import 'package:banking_project/data/constants/app_constants.dart';

const baseURL = AppConstants.baseURL;
const bank = 'bank_of_ireland_client_oauth_gb';
/* bank_of_ireland_client_oauth_gb*/
/* rabobank_oauth_client_nl_xf */
//Try with thease two banks


var providersURL = Uri.https(baseURL, '/api/partners/v1/providers/$bank');


import 'package:banking_project/data/constants/app_constants.dart';

const baseURL = AppConstants.baseURL;
const connectionId = AppConstants.connectionId;

var partnerConsentsURL = Uri.https(baseURL,
 '/api/partners/v1/partner_consents?connection_id=$connectionId');

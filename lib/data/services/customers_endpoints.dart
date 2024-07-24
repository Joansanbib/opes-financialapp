import 'package:banking_project/data/constants/app_constants.dart';

const baseURL = AppConstants.baseURL;
const connectionId = AppConstants.connectionId;

var customerURL = Uri.https(baseURL, '/api/partners/v1/customers?connection_id=$connectionId');

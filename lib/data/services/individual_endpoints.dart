import 'package:banking_project/data/constants/app_constants.dart';

const baseURL = AppConstants.baseURL;

var individualsURL = Uri.https('baseURL', '/individuals');
var individualsIdURL = Uri.https('baseURL', '/individuals/{id}');
var individualsOnBoardURL = Uri.https('baseURL', '/individuals/{id}/onboard');

import 'dart:convert';

import 'package:banking_project/data/constants/app_constants.dart';
import 'package:banking_project/domain/repo/session_repo.dart';
import 'package:http/http.dart' as http;


class SessionImplementation extends SessionRepository {
  @override
  Future<void> login(var url, var apiKey) async {
    var response = await http.post(url, body:{
        'api_key' : apiKey,
    });
    if(response.statusCode == 200){
        var credentials = json.decode(response.body);

        final String accesToken = credentials['acces_token'];
        final String refreshToken = credentials['refresh_token'];

        await AppConstants.storage.write(key: 'access_token', value: accesToken);
        await AppConstants.storage.write(key: 'refresh_token', value: refreshToken);
    }
    else if(response.statusCode == 400){
        //Retornar error
    }
  }

  @override
  Future<void> refresh(var url) async {
    var response = await http.post(url, body:{

    });
    if(response.statusCode == 200){
        //refresh_token
    }
    else if(response.statusCode == 400){
        //Retornar error
    }
  }

}

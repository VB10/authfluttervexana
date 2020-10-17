import 'dart:io';

import 'package:authfluttervexana/users/model/credantial.dart';
import 'package:flutter/foundation.dart';
import 'package:vexana/vexana.dart';

class BaseService {
  static BaseService _instance;
  static BaseService get instance {
    if (_instance == null) _instance = BaseService._init();
    return _instance;
  }

  INetworkManager networkManager;

  BaseService._init() {
    networkManager = NetworkManager(
        options: BaseOptions(baseUrl: "http://localhost:3000"),
        onRefreshToken: (error, newService) async {
          final refreshToken = await newService.fetch<Credantial, Credantial>("/token",
              parseModel: Credantial(), method: RequestType.GET);
          error.request.headers = {HttpHeaders.authorizationHeader: "Bearer ${refreshToken.data.token}"};
          return error;
        },
        isEnableLogger: kDebugMode);
  }
}

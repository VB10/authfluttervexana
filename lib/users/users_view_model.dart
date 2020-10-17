import 'package:authfluttervexana/core/network_manager.dart';
import 'package:authfluttervexana/core/network_path.dart';
import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';
import './users.dart';
import 'model/user.dart';

abstract class UsersViewModel extends State<Users> {
  // Add your state and logic here
  User user;
  bool isLoading = false;
  BaseService baseService;
  GlobalKey<ScaffoldState> scaffoldKey;
  double opacity = 0;

  @override
  void initState() {
    super.initState();
    baseService = BaseService.instance;
    scaffoldKey = GlobalKey();
  }

  Future<void> checkUser() async {
    changeLoading();
    final response = await baseService.networkManager
        .fetch<User, User>(NetworkPath.USER.rawValue, parseModel: User(), method: RequestType.GET);

    if (response.data != null) {
      setState(() {
        user = response.data;
      });
    } else {
      scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(response.error.description)));
    }
    changeLoading();
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      opacity = 1;
    });
  }

  void changeLoading() {
    isLoading = !isLoading;
  }
}

import 'package:flutter/material.dart';
import './users_view_model.dart';

class UsersView extends UsersViewModel {
  @override
  Widget build(BuildContext context) {
    // Replace this with your build function
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(),
      body: isLoading ? CircularProgressIndicator() : buildInitialChild(context),
      floatingActionButton: buildFloatingActionButton(),
    );
  }

  Widget buildInitialChild(BuildContext context) {
    return user == null ? Text("Not Found") : buildListTileUserCard(context);
  }

  Widget buildListTileUserCard(BuildContext context) {
    return Center(
      child: AnimatedOpacity(
        opacity: opacity,
        duration: Duration(seconds: 3),
        child: ListTile(
          title: Text(user.name, style: Theme.of(context).textTheme.headline3),
          trailing: SizedBox(
            width: MediaQuery.of(context).size.width * 0.2,
            child: Text(user.date, maxLines: 3),
          ),
          subtitle: Text(user.place),
        ),
      ),
    );
  }

  FloatingActionButton buildFloatingActionButton() {
    return FloatingActionButton(
      child: Icon(Icons.get_app),
      onPressed: () {
        checkUser();
      },
    );
  }
}

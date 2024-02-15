import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:quick_buy/app/controllers/adminside_users_controller.dart';
import 'package:quick_buy/app/utils/constants.dart';

class UsersView extends StatefulWidget {
  const UsersView({super.key});

  @override
  State<UsersView> createState() => _UsersViewState();
}

class _UsersViewState extends State<UsersView> {
  @override
  void initState() {
    Provider.of<AdminSideUsersController>(context, listen: false)
        .fetchAllUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final adminSideUsersController =
        Provider.of<AdminSideUsersController>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: kWhite),
        title: const Text(
          "Users",
          style: TextStyle(color: kWhite),
        ),
      ),
      body: adminSideUsersController.loading
          ? const Center(
              child: SpinKitFadingCircle(
                color: kBlack,
                size: 50.0,
              ),
            )
          : ListView.builder(
              itemCount: adminSideUsersController.users.length,
              itemBuilder: (context, index) {
                final user = adminSideUsersController.users[index];

                return ListTile(
                  title: Text(user.name ?? ''),
                  subtitle: Text(user.email ?? ''),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(user.avatar ?? ''),
                  ),
                );
              },
            ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:task1/Cupits/user_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1/view/screens/userCard.dart';

import '../../models/UserModel.dart';
import 'AddUser.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const String routeName = "homePage";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit()..getUser(),
      child: BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is GetUsersLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is GetUsersSuccess) {
            var userList = state.user.users;
            return Scaffold(
                appBar: AppBar(
                  title: Text("Users"),
                ),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.endFloat,
                floatingActionButton: Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: FloatingActionButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AddUser.routeName);
                    },
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 2.5,
                        )),
                    child: Icon(Icons.add, size: 30),
                  ),
                ),
                body: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: ListView.builder(
                    itemBuilder: (context, index) {
                      return UserCard(
                          userList?[index].id,
                          userList?[index].firstName,
                          userList?[index].lastName);
                    },
                    itemCount: userList?.length,
                  )),
                ));
          } else {
            return SizedBox(
              height: 10,
            );
          }
        },
      ),
    );
  }
}

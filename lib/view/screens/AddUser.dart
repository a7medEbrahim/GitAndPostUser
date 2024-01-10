import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1/Cupits/add_user_cubit.dart';

import '../../Cupits/user_cubit.dart'; // Update with the correct path

class AddUser extends StatelessWidget {
  static const String routeName = 'AddUserPage';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddUserCubit()..postUser(),
      child: BlocConsumer<AddUserCubit, AddUserState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is AddUsersLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is AddUsersSuccess) {
            return Scaffold(
              appBar: AppBar(
                title: Text('Add New User'),
              ),
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: AddUserCubit.get(context).firstNameController,
                      decoration: InputDecoration(labelText: 'First Name'),
                    ),
                    SizedBox(height: 16),
                    TextField(
                      controller: AddUserCubit.get(context).lastNameController,
                      decoration: InputDecoration(labelText: 'Last Name'),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        AddUserCubit.get(context).postUser();
                      },
                      child: Text('Add User'),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}

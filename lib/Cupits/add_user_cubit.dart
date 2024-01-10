import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:task1/network/endpoint/end_point.dart';
import 'package:dio/dio.dart';
import '../models/usermmodel.dart';
import '../network/Dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_user_state.dart';

class AddUserCubit extends Cubit<AddUserState> {
  AddUserCubit() : super(AddUserInitial());
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  static AddUserCubit get(context) => BlocProvider.of(context);

  Future<void> postUser() async {
    emit(AddUsersLoading());
    try {
      var response = await DioHelper.postData(
        endPoints: addUser,
        // Replace with the actual endpoint for posting user data
        data: {
          "firstName": firstNameController.text,
          "lastName": lastNameController.text,
        },
      );
      print('Post User Response: ${response.data}');
      MUser user = MUser.fromJson(response.data);
      emit(AddUsersSuccess(user));
    } catch (error) {
      if (error is DioError) {
        emit(AddUsersError(error.response!.data['message']));
      } else {
        emit(AddUsersError(error.toString()));
      }
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'package:task1/models/usermmodel.dart';
import 'package:task1/network/Dio_helper.dart';
import 'package:dio/dio.dart';

import '../models/UserModel.dart';
import '../network/endpoint/end_point.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());
  List<MUserResponse> userss = [];

  static UserCubit get(context) => BlocProvider.of(context);

  Future<void> getUser() async {
    emit(GetUsersLoading());
    await DioHelper.getData(endPoints: users).then((value) {
      print(value.data);
      MUserResponse user = MUserResponse.fromJson(value.data);
      emit(GetUsersSuccess(user));
    }).catchError((error) {
      if (error is DioError) {
        emit(GetUsersError(error.response!.data['message']));
      } else {
        emit(GetUsersError(error.toString()));
      }
    });
  }
}

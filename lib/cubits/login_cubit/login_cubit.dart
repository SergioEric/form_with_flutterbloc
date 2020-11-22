import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:form_with_flutterbloc/models/models.dart';
import 'package:formz/formz.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState());

  void onChageUserName(String username) {
    assert(username != null);
    //emit a new state and rebuild the widgets that
    //needs to be render again
    emit(
      state.copyWith(
        username: UserName.dirty(value: username),
      ),
    );
  }

  void onChagePassword(String password) {
    assert(password != null);
    emit(
      state.copyWith(
        password: Password.dirty(value: password),
      ),
    );
  }
}

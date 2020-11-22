part of 'login_cubit.dart';

class LoginState extends Equatable {
  final UserName username;
  final Password password;

  final FormzStatus status;

  LoginState({
    this.username,
    this.password,
    this.status,
  });

  @override
  List<Object> get props => [username, password, status];

  // we manage the state as immutable
  LoginState copyWith({
    UserName username,
    Password password,
    FormzStatus status,
  }) {
    return LoginState(
      username: username ?? this.username,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }

  @override
  bool get stringify => true;
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubits/login_cubit/login_cubit.dart';

import 'models/models.dart';

final black = Color(0xff131313);
final red = Colors.redAccent;
final focusColor = Colors.black;

// final size = MediaQuery.of(context).size;
class FormPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("BUILD METHOD EXECUTED JUST ONE TIME");
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            //this is for column get expand all with available
            width: double.infinity,
          ),
          Text("Login "),
          Form(
            child: Column(
              children: [
                UserNameField(),
                SizedBox(
                  height: 12,
                ),
                PasswordField(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class UserNameField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("UserNameField build exe");
    // final state = context.watch<LoginCubit>().state.username;
    final size = MediaQuery.of(context).size;
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) {
        return Container(
          width: size.width * 0.75,
          child: TextFormField(
            // controller: your Controller if you need it,
            cursorColor: Colors.green,
            // focusNode: your FocusNode if you need it,
            keyboardType: TextInputType.text,
            // textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              hintText: "jhon dow",
              labelText: 'Username',
              hintStyle: TextStyle(color: black.withOpacity(0.5)),
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.person),
              errorText: state.username?.error?.asString,
              // errorStyle: TextStyle(color: Colors.purple),
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.redAccent)),
              focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: red, width: 1.5)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: focusColor, width: 2)),
              // icon: Icon(Icons.email)
              // errorText: state.email.invalid ? 'invalido' : null
            ),
            inputFormatters: [FilteringTextInputFormatter.deny(RegExp(r"\s"))],
            style: TextStyle(color: black),
            onChanged: (value) {
              context.read<LoginCubit>().onChageUserName(value);
            },
          ),
        );
      },
    );
  }
}

class PasswordField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("PasswordField build exe");
    // final state = context.watch<LoginCubit>().state.password;
    final size = MediaQuery.of(context).size;
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return Container(
          width: size.width * 0.75,
          child: TextFormField(
            // controller: your Controller if you need it,
            cursorColor: Colors.green,
            // focusNode: your FocusNode if you need it,
            keyboardType: TextInputType.text,
            // textInputAction: TextInputAction.next,
            obscureText: true,
            decoration: InputDecoration(
              hintText: "******",
              labelText: 'Password',
              hintStyle: TextStyle(color: black.withOpacity(0.5)),
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.person),
              errorText: state.password?.error?.asString,
              // errorStyle: TextStyle(color: Colors.purple),
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.redAccent)),
              focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: red, width: 1.5)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: focusColor, width: 2)),
              // icon: Icon(Icons.email)
              // errorText: state.email.invalid ? 'invalido' : null
            ),
            inputFormatters: [FilteringTextInputFormatter.deny(RegExp(r"\s"))],
            style: TextStyle(color: black),
            onChanged: (value) {
              context.read<LoginCubit>().onChagePassword(value);
            },
          ),
        );
      },
    );
  }
}

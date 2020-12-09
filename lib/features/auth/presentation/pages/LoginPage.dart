import 'package:estuduff/core/resource/dimensions.dart';
import 'package:estuduff/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:estuduff/features/auth/presentation/widgets/LoginTabBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:estuduff/core/resource/strings_estuduff.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          print("State is ${state.toString()}");
          if (state is AuthSignedIn) {
            //TODO navigate to other page
          } else if (state is AuthError) {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.message,
                ),
              ),
            );
          }
        },
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is AuthInitial || state is AuthError) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin:
                        Dimensions.getEdgeInsets(context, left: 30, top: 10),
                    child: SvgPicture.asset(
                      StringsEstudUff.logo,
                      width: Dimensions.getConvertedWidthSize(280, context),
                    ),
                  ),
                  LoginTabBarWidget(),
                ],
              );
            } else if (state is AuthLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is AuthSignedIn) {
              return Center(
                child:
                    Text("State is: ${state.toString()}; id: ${state.token}"),
              );
            } else {
              return Center(
                child: Text("State is: ${state.toString()}"),
              );
            }
          },
        ),
      ),
    );
  }
}

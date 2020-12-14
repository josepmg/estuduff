import 'package:estuduff/core/resource/dimensions.dart';
import 'package:estuduff/core/resource/colors_estuduff.dart';
import 'package:estuduff/core/resource/strings_estuduff.dart';
import 'package:estuduff/core/ui/button_estuduff.dart';
import 'package:estuduff/core/ui/input_estuduff.dart';
import 'package:estuduff/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:estuduff/features/profile/presentation/pages/ProfileForm.dart';
import 'package:estuduff/features/program/presentation/bloc/program_bloc.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RegisterFormState();
  }
}

class _RegisterFormState extends State<RegisterForm> {
  final NAME_LABEL = "NAME_LABEL";
  final EMAIL_LABEL = "EMAIL_LABEL";
  final PASSWORD_LABEL = "PASSWORD_LABEL";
  final PROGRAM_LABEL = "PROGRAM_LABEL";
  final _formData = Map<String, dynamic>();

  bool isFormValid = false;

  @override
  void initState() {
    BlocProvider.of<ProgramBloc>(context).add(GetAllEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSignedIn) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ProfileForm(),
            ),
          );
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
      child: BlocListener<ProgramBloc, ProgramState>(
        listener: (context, state) {
          if (state is ProgramError) {
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
            if (state is AuthLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return BlocBuilder<ProgramBloc, ProgramState>(
                builder: (context, state) {
                  if (state is ProgramLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is ProgramLoaded) {
                    return Container(
                      margin:
                          Dimensions.getEdgeInsets(context, top: 15, left: 10),
                      child: Column(
                        children: [
                          InputEstudUff(
                            placeHolder:
                                StringsEstudUff.insert_name_placeholder,
                            suffixIcon: Icon(
                              FeatherIcons.user,
                              color: ColorsEstudUff.mediumGrey,
                              size: Dimensions.getTextSize(18, context),
                              semanticLabel:
                                  StringsEstudUff.user_icon_semantic_label,
                            ),
                            onChanged: (value) {
                              setState(() {
                                _formData[NAME_LABEL] = value;
                              });
                            },
                          ),
                          InputEstudUff(
                            placeHolder:
                                StringsEstudUff.insert_mail_placeholder,
                            suffixIcon: Icon(
                              FeatherIcons.mail,
                              color: ColorsEstudUff.mediumGrey,
                              size: Dimensions.getTextSize(18, context),
                              semanticLabel:
                                  StringsEstudUff.mail_icon_semantic_label,
                            ),
                            onChanged: (value) {
                              setState(() {
                                _formData[EMAIL_LABEL] = value;
                              });
                            },
                          ),
                          InputEstudUff(
                            placeHolder:
                                StringsEstudUff.insert_password_placeholder,
                            isPassword: true,
                            suffixIcon: Icon(
                              FeatherIcons.lock,
                              color: ColorsEstudUff.mediumGrey,
                              size: Dimensions.getTextSize(18, context),
                              semanticLabel:
                                  StringsEstudUff.lock_icon_semantic_label,
                            ),
                            onChanged: (value) {
                              setState(() {
                                _formData[PASSWORD_LABEL] = value;
                              });
                            },
                          ),
                          // ProgramDropDownEstudUff(
                          //   options: state.porgramList,
                          //   placeholder:
                          //       StringsEstudUff.insert_current_course_placeholder,
                          //   onSelected: (value) {
                          //     setState(() {
                          //       _formData[PROGRAM_LABEL] = value;
                          //     });
                          //   },
                          // ),
                          DropdownButton(
                            value: _formData[PROGRAM_LABEL],
                            items: state.porgramList.map((program) {
                              return DropdownMenuItem(
                                value: program.id,
                                child: Text("${program.name}"),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                _formData[PROGRAM_LABEL] = value;
                              });
                            },
                          ),
                          SizedBox(
                            height:
                                Dimensions.getConvertedHeightSize(20, context),
                          ),
                          ButtonEstudUff(
                            text: StringsEstudUff.save_account_button_title
                                .toUpperCase(),
                            onPressed: _submitForm,
                            width: double.infinity,
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              );
            }
          },
        ),
      ),
    );
  }

  _submitForm() {
    if (_formData != null &&
        _formData.isNotEmpty &&
        _formData[NAME_LABEL] != null &&
        _formData[NAME_LABEL] != "" &&
        _formData[EMAIL_LABEL] != null &&
        _formData[EMAIL_LABEL] != "" &&
        _formData[PASSWORD_LABEL] != null &&
        _formData[PASSWORD_LABEL] != "" &&
        _formData[PROGRAM_LABEL] != null) {
      BlocProvider.of<AuthBloc>(context).add(SignUpEvent(
        email: _formData[EMAIL_LABEL],
        password: _formData[PASSWORD_LABEL],
        name: _formData[NAME_LABEL],
        programId: _formData[PROGRAM_LABEL],
      ));
    } else {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Preencha todos os campos",
          ),
        ),
      );
    }
  }
}

import 'package:estuduff/core/resource/arrays_estuduff.dart';
import 'package:estuduff/core/resource/colors_estuduff.dart';
import 'package:estuduff/core/resource/dimensions.dart';
import 'package:estuduff/core/resource/fonts_estuduff.dart';
import 'package:estuduff/core/resource/strings_estuduff.dart';
import 'package:estuduff/core/ui/button_estuduff.dart';
import 'package:estuduff/core/ui/dropdown_estuduff.dart';
import 'package:estuduff/features/environment/presentation/bloc/environment_bloc.dart';
import 'package:estuduff/features/environment/presentation/pages/BaseEnviromentScreen.dart';
import 'package:estuduff/features/profile/domain/entity/study_profile_enum.dart';
import 'package:estuduff/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProfileFormState();
  }
}

class _ProfileFormState extends State<ProfileForm> {
  final String FIRST_ANSWER_LABEL = "FIRST_ANSWER_LABEL";
  final String SECOND_ANSWER_LABEL = "SECOND_ANSWER_LABEL";
  final String THIRD_ANSWER_LABEL = "THIRD_ANSWER_LABEL";
  var _formData = {};
  @override
  Widget build(BuildContext context) {
    return buildBody(context);
  }

  Widget buildBody(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          // go back to login/register
        ],
        title: Text(
          StringsEstudUff.profile_form_title,
          style: TextStyle(color: ColorsEstudUff.mediumGrey),
        ),
        leading: Icon(Icons.chevron_left, color: ColorsEstudUff.mediumGrey),
        elevation: 8.0,
      ),
      body: BlocListener<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state is ErrorProfileState) {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.message,
                ),
              ),
            );
          } else if (state is SettedProfileState) {
            // Retrieve Environmentos from API
            BlocProvider.of<EnvironmentBloc>(context)
                .add(GetByProfileEvent(state.studyProfileEnum));
            // Navigate to profile's environment places page
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => BaseEnviromentScreen(
                      currentProfile: state.studyProfileEnum,
                    )));
          }
        },
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            debugPrint("$state");
            if (state is InitialProfileState) {
              return Container(
                alignment: Alignment.center,
                padding: Dimensions.getEdgeInsetsAll(context, 32),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        margin: Dimensions.getEdgeInsets(context, bottom: 28),
                        child: Text(
                          StringsEstudUff.profile_form_instruction,
                          style: TextStyle(
                            color: ColorsEstudUff.mediumGrey,
                            fontFamily: FontsEstudUff.open_sans,
                            fontSize: Dimensions.getTextSize(14, context),
                          ),
                        ),
                      ),
                      _buildQuestions(
                          StringsEstudUff.profile_form_question_one),
                      DropDownEstudUff(
                        placeholder:
                            StringsEstudUff.profile_form_dropdown_placeholder,
                        options: ArraysEstudUff.profile_form_options,
                        onSelected: (int value) {
                          setState(() {
                            _formData[FIRST_ANSWER_LABEL] = value;
                          });
                        },
                      ),
                      _buildQuestions(
                          StringsEstudUff.profile_form_question_two),
                      DropDownEstudUff(
                        placeholder:
                            StringsEstudUff.profile_form_dropdown_placeholder,
                        options: ArraysEstudUff.profile_form_options,
                        onSelected: (int value) {
                          setState(() {
                            _formData[SECOND_ANSWER_LABEL] = value;
                          });
                        },
                      ),
                      _buildQuestions(
                          StringsEstudUff.profile_form_question_three),
                      DropDownEstudUff(
                        placeholder:
                            StringsEstudUff.profile_form_dropdown_placeholder,
                        options: ArraysEstudUff.profile_form_options,
                        onSelected: (int value) {
                          setState(() {
                            _formData[THIRD_ANSWER_LABEL] = value;
                          });
                        },
                      ),
                      ButtonEstudUff(
                        width: double.infinity,
                        text: StringsEstudUff.send_button_title,
                        onPressed: _submitAnswers,
                      ),
                    ],
                  ),
                ),
              );
            } else if (state is LoadingProfileState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  _submitAnswers() {
    debugPrint("Enviei");
    BlocProvider.of<ProfileBloc>(context).add(AnswerQuizEvent(
      firstAnswer: _formData[FIRST_ANSWER_LABEL],
      secondAnswer: _formData[SECOND_ANSWER_LABEL],
      thirdAnswer: _formData[THIRD_ANSWER_LABEL],
    ));
  }

  Widget _buildQuestions(String question) {
    return Container(
      margin: Dimensions.getEdgeInsets(context, bottom: 28),
      child: Text(
        question,
        style: TextStyle(
          color: Colors.black,
          fontFamily: FontsEstudUff.open_sans,
          fontSize: Dimensions.getTextSize(14, context),
        ),
      ),
    );
  }
}

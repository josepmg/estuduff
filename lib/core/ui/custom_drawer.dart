import 'package:estuduff/core/resource/colors_estuduff.dart';
import 'package:estuduff/core/resource/dimensions.dart';
import 'package:estuduff/core/resource/routes_estuduff.dart';
import 'package:estuduff/core/resource/strings_estuduff.dart';
import 'package:estuduff/core/resource/styles_estuduff.dart';
import 'package:estuduff/features/auth/data/datasource/auth_local_data_source.dart';
import 'package:estuduff/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:estuduff/features/environment/presentation/bloc/environment_bloc.dart';
import 'package:estuduff/features/environment/presentation/pages/BaseEnviromentScreen.dart';
import 'package:estuduff/features/environment/presentation/pages/FilterByTypeScreen.dart';
import 'package:estuduff/features/profile/domain/entity/study_profile_enum.dart';
import 'package:estuduff/features/profile/presentation/pages/SelectProfilePage.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key key}) : super(key: key);

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  bool showSubItems = false;

  @override
  void initState() {
    super.initState();
    debugPrint("Initstate");
    // BlocProvider.of<AuthBloc>(context).add(GetUserDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    //TODO Add BLoC listener/builder to dsplay user's data
    return Drawer(
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Container(
              margin: Dimensions.getEdgeInsets(context, bottom: 15),
              padding: Dimensions.getEdgeInsets(context,
                  bottom: 10, top: 55, left: 15),
              alignment: Alignment.topLeft,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: Dimensions.getConvertedHeightSize(1, context),
                    style: BorderStyle.solid,
                    color: ColorsEstudUff.spacerGray,
                  ),
                ),
              ),
              child: BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  if (state is AuthLoading) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                      ],
                    );
                  } else if (state is AuthUserLoaded) {
                    String userName = state.user.name.split(" ")[0];
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //TODO Get user name
                        Text(
                          "${StringsEstudUff.greeting_drawer_title} $userName",
                          style: StylesEstudUff.drawerTitleTextStyle(context),
                        ),
                        SizedBox(
                          height: Dimensions.getConvertedHeightSize(5, context),
                        ),
                        //TODO Get user e-mail
                        Text(
                          "${state.user.email}",
                          style:
                              StylesEstudUff.drawerSubtitleTextStyle(context),
                        ),
                      ],
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ),
            // Items
            DrawerItem(
              text: StringsEstudUff.home_drawer_item,
              iconData: FeatherIcons.home,
              onTapFunction: () async {
                //TODO: Implementar perfil de estudo de acordo com o escolhido pelo user
                StudyProfileEnum studyProfile = await GetIt.I
                    .get<AuthLocalDataSource>()
                    .getUserStudyProfile();

                BlocProvider.of<EnvironmentBloc>(context)
                    .add(GetByProfileEvent(studyProfile));

                Navigator.of(context).pop();

                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => BaseEnviromentScreen(
                      profile: studyProfile,
                    ),
                  ),
                );
              },
            ),
            DrawerItem(
              text: StringsEstudUff.available_environments_drawer_item,
              iconData: FeatherIcons.heart,
              onTapFunction: () {
                BlocProvider.of<EnvironmentBloc>(context).add(GetAllEvent());
                Navigator.of(context).pop();

                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => BaseEnviromentScreen(
                      profile: StudyProfileEnum.AVAILABLE,
                    ),
                  ),
                );
              },
            ),
            DrawerItem(
              text: StringsEstudUff.filter_environments_drawer_item,
              iconData: FeatherIcons.search,
              onTapFunction: () {
                setState(() {
                  this.showSubItems = !this.showSubItems;
                });
              },
            ),
            showSubItems
                ? Container(
                    padding: Dimensions.getEdgeInsets(context, left: 60),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DrawerItem(
                          text: StringsEstudUff.type_filter_drawer_item,
                          onTapFunction: () {
                            Navigator.of(context).pop();

                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => FilterByTypeScreen(),
                              ),
                            );
                          },
                        ),
                        DrawerItem(
                          text:
                              StringsEstudUff.study_profile_filter_drawer_item,
                          onTapFunction: () {
                            Navigator.of(context).pop();

                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => SelectProfilePage(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  )
                : Container(),
            DrawerItem(
              text: StringsEstudUff.change_study_profile_drawer_item,
              iconData: FeatherIcons.edit,
              onTapFunction: () {
                Navigator.of(context).pop();

                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        SelectProfilePage(shouldChangeProfile: true),
                  ),
                );
              },
            ),
            DrawerItem(
              text: StringsEstudUff.sign_out_item,
              iconData: FeatherIcons.logOut,
              onTapFunction: () {
                Navigator.of(context).pop();

                BlocProvider.of<AuthBloc>(context).add(SignOutEvent());
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(Routes.start_page, (r) => false);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final String text;
  final Function onTapFunction;
  final IconData iconData;
  const DrawerItem({Key key, this.text, this.onTapFunction, this.iconData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return iconData != null
        ? ListTile(
            leading: Icon(
              iconData,
              color: ColorsEstudUff.mediumGrey,
            ),
            title: Text(
              text,
              style: StylesEstudUff.drawerItemTextStyle(context),
            ),
            onTap: onTapFunction,
          )
        : ListTile(
            title: Text(
              text,
              style: StylesEstudUff.drawerItemTextStyle(context),
            ),
            onTap: onTapFunction,
          );
  }
}

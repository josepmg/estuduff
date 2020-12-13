import 'package:estuduff/core/resource/colors_estuduff.dart';
import 'package:estuduff/core/resource/dimensions.dart';
import 'package:estuduff/core/resource/strings_estuduff.dart';
import 'package:estuduff/core/resource/styles_estuduff.dart';
import 'package:estuduff/features/environment/presentation/pages/BaseEnviromentScreen.dart';
import 'package:estuduff/features/environment/presentation/pages/FilterByTypeScreen.dart';
import 'package:estuduff/features/profile/domain/entity/study_profile_enum.dart';
import 'package:estuduff/features/profile/presentation/pages/SelectProfilePage.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key key}) : super(key: key);

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  bool showSubItems = false;
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
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${StringsEstudUff.greeting_drawer_title} Bárbara",
                    style: StylesEstudUff.drawerTitleTextStyle(context),
                  ),
                  SizedBox(
                    height: Dimensions.getConvertedHeightSize(5, context),
                  ),
                  Text(
                    "bramos@id.uff.br",
                    style: StylesEstudUff.drawerSubtitleTextStyle(context),
                  ),
                ],
              ),
            ),
            // Items
            DrawerItem(
              text: StringsEstudUff.home_drawer_item,
              iconData: FeatherIcons.home,
              onTapFunction: () {
                //TODO: Implementar perfil de estudo de acordo com o escolhido pelo user
                Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: (context) => BaseEnviromentScreen(
                      profile: StudyProfileEnum.LONELY_WOLF,
                    ),
                  ),
                );
              },
            ),
            DrawerItem(
              text: StringsEstudUff.available_environments_drawer_item,
              iconData: FeatherIcons.heart,
              onTapFunction: () {
                Navigator.of(context).push(
                  CupertinoPageRoute(
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
                            Navigator.of(context).push(
                              CupertinoPageRoute(
                                builder: (context) => FilterByTypeScreen(),
                              ),
                            );
                          },
                        ),
                        DrawerItem(
                          text:
                              StringsEstudUff.study_profile_filter_drawer_item,
                          onTapFunction: () {
                            Navigator.of(context).push(
                              CupertinoPageRoute(
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
                Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: (context) => SelectProfilePage(),
                  ),
                );
              },
            ),
            DrawerItem(
              text: StringsEstudUff.edit_account_item,
              iconData: FeatherIcons.settings,
              onTapFunction: () {
                //TODO Implement onTap function
              },
            ),
            DrawerItem(
              text: StringsEstudUff.sign_out_item,
              iconData: FeatherIcons.logOut,
              onTapFunction: () {
                //TODO Implement onTap function
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

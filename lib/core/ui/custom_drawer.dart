import 'package:estuduff/core/resource/dimensions.dart';
import 'package:estuduff/core/resource/estuduff_colors.dart';
import 'package:estuduff/core/resource/estuduff_strings.dart';
import 'package:estuduff/core/resource/estuduff_styles.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
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
                    color: EstudUffColors.spacerGray,
                  ),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${EstudUffStrings.greeting_drawer_title} Bárbara",
                    style: EstudUffStyles.drawerTitleTextStyle(context),
                  ),
                  SizedBox(
                    height: Dimensions.getConvertedHeightSize(5, context),
                  ),
                  Text(
                    "bramos@id.uff.br",
                    style: EstudUffStyles.drawerSubtitleTextStyle(context),
                  ),
                ],
              ),
            ),
            // Items
            DrawerItem(
              text: EstudUffStrings.home_drawer_item,
              iconData: FeatherIcons.home,
              onTapFunction: () {
                //TODO Implement onTap function
              },
            ),
            DrawerItem(
              text: EstudUffStrings.available_environments_drawer_item,
              iconData: FeatherIcons.heart,
              onTapFunction: () {
                //TODO Implement onTap function
              },
            ),
            DrawerItem(
              text: EstudUffStrings.filter_environments_drawer_item,
              iconData: FeatherIcons.search,
              onTapFunction: () {
                setState(() {
                  this.showSubItems = !this.showSubItems;
                  //TODO Implement onTap function
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
                          text: EstudUffStrings.type_filter_drawer_item,
                          onTapFunction: () {
                            //TODO Implement onTap function
                            setState(() {
                              this.showSubItems = !this.showSubItems;
                            });
                          },
                        ),
                        DrawerItem(
                          text:
                              EstudUffStrings.study_profile_filter_drawer_item,
                          onTapFunction: () {
                            //TODO Implement onTap function
                            setState(() {
                              this.showSubItems = !this.showSubItems;
                            });
                          },
                        ),
                      ],
                    ),
                  )
                : Container(),
            DrawerItem(
              text: EstudUffStrings.change_study_profile_drawer_item,
              iconData: FeatherIcons.edit,
              onTapFunction: () {
                //TODO Implement onTap function
              },
            ),
            DrawerItem(
              text: EstudUffStrings.edit_account_item,
              iconData: FeatherIcons.settings,
              onTapFunction: () {
                //TODO Implement onTap function
              },
            ),
            DrawerItem(
              text: EstudUffStrings.sign_out_item,
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
              color: EstudUffColors.inputPlaceHolder,
            ),
            title: Text(
              text,
              style: EstudUffStyles.drawerItemTextStyle(context),
            ),
            onTap: onTapFunction,
          )
        : ListTile(
            title: Text(
              text,
              style: EstudUffStyles.drawerItemTextStyle(context),
            ),
            onTap: onTapFunction,
          );
  }
}

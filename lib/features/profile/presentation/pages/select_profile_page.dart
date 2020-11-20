import 'package:estuduff/core/resource/dimensions.dart';
import 'package:estuduff/core/resource/estuduff_colors.dart';
import 'package:estuduff/core/resource/estuduff_strings.dart';
import 'package:estuduff/core/resource/estuduff_styles.dart';
import 'package:estuduff/core/ui/custom_drawer.dart';
import 'package:estuduff/features/profile/presentation/widgets/profile_tile.dart';
import 'package:flutter/material.dart';

class SelectProfilePage extends StatelessWidget {
  const SelectProfilePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 8,
        iconTheme: IconThemeData(
          color: EstudUffColors.inputPlaceHolder,
        ),
        title: Text(
          EstudUffStrings.select_profile_app_bar_title,
          style: EstudUffStyles.appbarTextStyle(context),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: ProfileTile(
                tileMarginColor: EstudUffColors.primaryBlue,
                tileTitle: EstudUffStrings.lonely_wolf_title,
                tileSubtitle: EstudUffStrings.lonely_wolf_subtitle,
                tileIcon: EstudUffStrings.lonely_wolf_icon,
                onTapFunction: () {},
              ),
            ),
            Expanded(
              flex: 1,
              child: ProfileTile(
                tileMarginColor: EstudUffColors.primaryGreen,
                tileTitle: EstudUffStrings.jack_of_all_trades_title,
                tileSubtitle: EstudUffStrings.jack_of_all_trades_subtitle,
                tileIcon: EstudUffStrings.jack_of_all_trades_icon,
                onTapFunction: () {},
              ),
            ),
            Expanded(
              flex: 1,
              child: ProfileTile(
                tileMarginColor: EstudUffColors.primaryRed,
                tileTitle: EstudUffStrings.outgoing_title,
                tileSubtitle: EstudUffStrings.outgoing_subtitle,
                tileIcon: EstudUffStrings.outgoing_icon,
                onTapFunction: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:extra_staff/utils/constants.dart';
import 'package:flutter/material.dart';

import 'package:extra_staff/controllers/login_c.dart';
import 'package:extra_staff/controllers/page_controller_c.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class IntroView extends StatelessWidget {
  IntroView(this.title, this.pcc);

  final LoginController loginController = LoginController();

  final String title;
  final double circleHeight = 275;
  final PageControllerController pcc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: AnimatedOpacity(
          opacity: 1.0,
          duration: const Duration(milliseconds: 100000),
          child: Column(
            children: [
              Spacer(),
              Container(
                height: circleHeight,
                width: circleHeight,
                padding: EdgeInsets.all(32),
                decoration: BoxDecoration(
                  border: Border.all(color: MyColors.blueAccent),
                  borderRadius: BorderRadius.all(
                    Radius.circular(circleHeight / 2),
                  ),
                ),
                child: CircleAvatar(
                  backgroundImage: AssetImage('lib/images/profile.png'),
                ),
              ),
              Spacer(),
              Text(
                AppLocalizations.of(context)!.key_HowTo + title,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Container(
                margin: EdgeInsets.fromLTRB(32, 0, 32, 0),
                child: Text(
                  pcc.data[title]!.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                ),
              ),
              Spacer(),
              Container(
                height: 74,
                width: 74,
                decoration: BoxDecoration(
                  color: MyColors.blueAccent,
                  border: Border.all(color: MyColors.blueAccent),
                  borderRadius: BorderRadius.all(
                    Radius.circular(37),
                  ),
                ),
                child: IconButton(
                  icon: Icon(Icons.arrow_forward),
                  color: MyColors.white,
                  iconSize: 35,
                  onPressed: () => pcc.onChange(),
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

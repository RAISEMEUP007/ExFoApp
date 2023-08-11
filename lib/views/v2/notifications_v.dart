import 'package:extra_staff/utils/ab.dart';
import 'package:extra_staff/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class V2NotificationsView extends StatefulWidget {
  const V2NotificationsView({Key? key}) : super(key: key);

  @override
  _V2NotificationsViewState createState() => _V2NotificationsViewState();
}

class _V2NotificationsViewState extends State<V2NotificationsView> {
  bool _isLoading = false;
  int _selectedIndex = 3;
  List<bool> _isVisibleList = [
    true,
    true,
    true
  ]; // Example list of Boolean values
  List<String> _titleList = [
    'Time off Approved/Rejected Lorem Ipsum Sit dolor para cambres on',
    'Sent to email',
    'Availability was updated to lorem ipsum sit dolor on the specific date'
  ]; // Example list of titles
  List<String> _subtitleList = [
    '2 minutes ago',
    '5 minutes ago',
    '13 minutes ago'
  ]; // Example list of subtitles

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    abV2GotoBottomNavigation(index, 3);
  }

  Widget getContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'v2_notifications_view_appbar_title'.tr,
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromRGBO(0, 69, 141, 1),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  'Mark all as read',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color.fromRGBO(0, 69, 141, 1),
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
        ),
        for (int i = 0; i < _isVisibleList.length; i++) // Iterate over the list
          AnimatedCrossFade(
            duration: Duration(milliseconds: 400),
            crossFadeState: _isVisibleList[i]
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            firstChild: Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey,
                    width: 0.5,
                  ),
                ),
              ),
              child: ListTile(
                title: Text(
                  _titleList[i], // Use the title from the list
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromRGBO(0, 69, 141, 1),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Container(
                  margin: EdgeInsets.only(top: 12),
                  child:
                      Text(_subtitleList[i]), // Use the subtitle from the list
                ),
                trailing: IconButton(
                  onPressed: () {
                    setState(() {
                      _isVisibleList[i] =
                          false; // Set the visibility of the current list tile to false
                    });
                  },
                  icon: Icon(
                    Icons.close,
                    size: 20,
                  ),
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              ),
            ),
            secondChild: Opacity(
                opacity: 0,
                child: SizedBox
                    .shrink()), // Use an empty SizedBox for hidden titles
          ),
      ],
    );
  }

  PreferredSizeWidget getAppBar() {
    return abV2AppBar(context, '');
  }

  @override
  Widget build(BuildContext context) {
    return abV2MainWidgetWithLoadingOverlayScaffoldScrollView(
        context, _isLoading,
        appBar: getAppBar(),
        content: getContent(),
        bottomNavigationBar:
            abV2BottomNavigationBarA(_selectedIndex, _onItemTapped));
  }
}

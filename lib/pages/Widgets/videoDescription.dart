import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class videoDescription extends StatelessWidget {
  // Full dimensions of an action
  static const double ActionWidgetSize = 60.0;
  // The size of the icon showen for Social Actions
  static const double ActionIconSize = 35.0;

// The size of the share social icon
  static const double ShareActionIconSize = 25.0;

// The size of the profile image in the follow Action
  static const double ProfileImageSize = 25.0;

// The size of the plus icon under the profile image in follow action
  static const double PlusIconSize = 10.0;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 120.0,
        padding: EdgeInsets.only(left: 10.0, bottom: 20),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: [
                  _getFollowAction(),
                  Text(
                    '@firstjonny',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Segoe',
                        fontSize: 16),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    child: new Image.asset(
                      'assets/images/verified.png',
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      height: 23,
                      width: 85,
                      child: RaisedButton(
                        onPressed: () {},
                        color: Color(0xFF02E3D4).withOpacity(0.3),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Text("Follow +"),
                      ))
                ],
              ),
              InkWell(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => AppleSignUpExample()));
                  //   Navigator.push(context,
                  // MaterialPageRoute(builder: (context) => Sample()));
                },
                child: Text(
                  'Video title and some other stuff',
                  style: TextStyle(fontFamily: 'Segoe'),
                ),
              ),
              // Text('#minilive #new #video...'),
              Row(children: [
                // Icon(
                //   Icons.music_note,
                //   size: 15.0,
                //   color: Colors.white,
                // ),
                Container(
                  child: new Image.asset(
                    'assets/images/melody1.png',
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text('Artist name - Album name - song',
                    style: TextStyle(fontSize: 12.0)),
              ]),
            ]));
  }

  Widget _getFollowAction({String pictureUrl}) {
    return Container(
        margin: EdgeInsets.symmetric(
            // vertical: 10.0,
            ),
        width: 35.0,
        height: 30.0,
        child: Stack(
            children: [_borderImage(), _getProfilePicture(), _getPlusIcon()]));
  }

  Widget _getPlusIcon() {
    return Positioned(
      bottom: 0,
      left: ((ActionWidgetSize / 4) - (PlusIconSize / 3)),
      child: Container(
          width: PlusIconSize, // PlusIconSize = 20.0;
          height: PlusIconSize, // PlusIconSize = 20.0;
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 43, 84),
              borderRadius: BorderRadius.circular(15.0)),
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 10.0,
          )),
    );
  }

  Widget _borderImage() {
    return Container(
      padding: EdgeInsets.all(.0), // Add 1.0 point padding to create border
      height: ProfileImageSize * 2, // ProfileImageSize = 50.0;
      width: ProfileImageSize * 2,
      child: Image.asset("assets/images/profileborder.png"),
    );
  }

  Widget _getProfilePicture() {
    return Positioned(
        left: (ActionWidgetSize / 7) - (ProfileImageSize / 7),
        top: 3,
        child: Container(
            padding:
                EdgeInsets.all(2.0), // Add 1.0 point padding to create border
            height: ProfileImageSize, // ProfileImageSize = 50.0;
            width: ProfileImageSize, // ProfileImageSize = 50.0;
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(ProfileImageSize / 2)),
            // import 'package:cached_network_image/cached_network_image.dart'; at the top to use CachedNetworkImage
            child: CachedNetworkImage(
              imageUrl:
                  "https://secure.gravatar.com/avatar/ef4a9338dca42372f15427cdb4595ef7",
              placeholder: (context, url) => new CircularProgressIndicator(),
              errorWidget: (context, url, error) => new Icon(Icons.error),
            )));
  }
}

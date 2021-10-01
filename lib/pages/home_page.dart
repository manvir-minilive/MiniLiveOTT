import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'Widgets/actionsToolBar.dart';
import 'Widgets/content_screen.dart';
import 'Widgets/videoDescription.dart';

class HomePage extends StatelessWidget {
  final List<String> videos = [
    // 'http://www.exit109.com/~dnn/clips/RW20seconds_1.mp4',
    // 'http://www.exit109.com/~dnn/clips/RW20seconds_2.mp4',
    'https://assets.mixkit.co/videos/preview/mixkit-young-mother-with-her-little-daughter-decorating-a-christmas-tree-39745-large.mp4',
    'https://assets.mixkit.co/videos/preview/mixkit-mother-with-her-little-daughter-eating-a-marshmallow-in-nature-39764-large.mp4',
    'https://assets.mixkit.co/videos/preview/mixkit-girl-in-neon-sign-1232-large.mp4',
    'https://assets.mixkit.co/videos/preview/mixkit-taking-photos-from-different-angles-of-a-model-34421-large.mp4',
    'https://assets.mixkit.co/videos/preview/mixkit-winter-fashion-cold-looking-woman-concept-video-39874-large.mp4',
    'https://assets.mixkit.co/videos/preview/mixkit-womans-feet-splashing-in-the-pool-1261-large.mp4',
    'https://assets.mixkit.co/videos/preview/mixkit-a-girl-blowing-a-bubble-gum-at-an-amusement-park-1226-large.mp4'
  ];

  AnimationController _animationController;

  Widget get topSection => Container(
        padding: EdgeInsets.only(right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: 40,
                    left: 10,
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text('NearBy',
                            style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        SizedBox(
                          width: 7,
                        ),
                        Container(
                          color: Colors.white,
                          height: 15,
                          width: 1.5,
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Text('Following',
                            style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        SizedBox(
                          width: 7,
                        ),
                        Container(
                          color: Colors.white,
                          height: 15,
                          width: 1.5,
                        ),
                        // SizedBox(
                        //   width: 7,
                        // ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.search,
                              color: Colors.white,
                            )),
                      ]),
                ),
                Container(
                    margin: EdgeInsets.only(bottom: 15),
                    height: 25,
                    width: 70,
                    child: RaisedButton(
                      onPressed: () {},
                      color: Color(0xFF02E3D4),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          //Live dot option
                          Container(
                            width: 7,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 20,
                            ),
                          ),
                          Text(" Live")
                        ],
                      ),
                    )),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              // padding: EdgeInsets.only(top: 20),
              child: Image.asset(
                'assets/images/coin1.png',
                width: 40,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            // Text(
            //   "COINS",
            //   style:
            //       TextStyle(color: Colors.white54, fontWeight: FontWeight.bold),
            // )
          ],
        ),
      );

  Widget get middleSection => Expanded(
          child: Container(
        // decoration: BoxDecoration(
        //     color: Colors.amber,
        //     image: DecorationImage(
        //       image: NetworkImage(
        //           "https://images.unsplash.com/photo-1558507652-2d9626c4e67a?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cG9ydHJhaXRzfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80"),
        //       fit: BoxFit.cover,
        //     )),
        child: Stack(
          // mainAxisSize: MainAxisSize.max,
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            shortVideo(),
            Positioned(
              child: topSection,
            ),
            Positioned(
              right: 0,
              bottom: 10,
              child: ActionsToolBar(),
            ),
            Positioned(
              // left: 0,
              bottom: 0,
              child: videoDescription(),
            ),
            // videoDescription(),
            // ActionsToolBar(),
          ],
        ),
      ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:
          //  shortVideo()
          Column(
        children: [
          middleSection,
          // BottomToolBar(),
        ],
      ),

      // body: SafeArea(
      //   child: Container(
      //     child: Stack(
      //       fit: StackFit.expand,
      //       children: [
      //         //We need swiper for every content
      //         Swiper(
      //           itemBuilder: (BuildContext context, int index) {
      //             return ContentScreen(
      //               src: videos[index],
      //             );
      //           },
      //           itemCount: videos.length,
      //           scrollDirection: Axis.vertical,
      //         ),
      //         Padding(
      //           padding: const EdgeInsets.all(8.0),
      //           child: Column(
      //             children: [
      //               Row(
      //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                 children: [
      //                   Row(
      //                     children: [
      //                       Text(
      //                         'Nearby | ',
      //                         style: TextStyle(
      //                           fontSize: 16,
      //                           fontWeight: FontWeight.bold,
      //                         ),
      //                       ),
      //                       Text(
      //                         'Following |',
      //                         style: TextStyle(
      //                           fontSize: 16,
      //                           fontWeight: FontWeight.bold,
      //                         ),
      //                       ),
      //                       IconButton(
      //                           onPressed: () {},
      //                           icon: Icon(
      //                             Icons.search,
      //                             size: 20,
      //                           ))
      //                     ],
      //                   ),
      //                   Container(
      //                       margin: EdgeInsets.all(25),
      //                       child: ElevatedButton(
      //                           child: Text("Live".toUpperCase(),
      //                               style: TextStyle(fontSize: 12)),
      //                           style: ButtonStyle(
      //                               shape: MaterialStateProperty.all<
      //                                       RoundedRectangleBorder>(
      //                                   RoundedRectangleBorder(
      //                             borderRadius: BorderRadius.circular(18.0),
      //                             // side: BorderSide(color: Colors.red)
      //                           ))),
      //                           onPressed: () => null)),
      //                 ],
      //               ),
      //               Row(
      //                 children: [
      //                   Column(
      //                     children: [
      //                       IconButton(
      //                         icon: Image.asset('assets/images/logo.png'),
      //                         iconSize: 50,
      //                         onPressed: () {},
      //                       ),
      //                       Text("Coin")
      //                     ],
      //                   ),
      //                 ],
      //               )
      //             ],
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }

  Widget shortVideo() {
    return Container(
      color: Colors.black,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return ContentScreen(
            src: videos[index],
          );
        },
        itemCount: videos.length,
        scrollDirection: Axis.vertical,
      ),
    );
  }
}

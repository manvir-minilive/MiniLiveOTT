import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:netflix_clone/json/video_detail_json.dart';
import 'package:netflix_clone/pages/video_player.dart';
import 'package:video_player/video_player.dart';

class VideoDetailPage extends StatefulWidget {
  final String videoUrl;

  const VideoDetailPage({Key key, this.videoUrl}) : super(key: key);
  @override
  _VideoDetailPageState createState() => _VideoDetailPageState();
}

class _VideoDetailPageState extends State<VideoDetailPage> {
  int activeEpisode = 0;

  // for video player
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoUrl)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {
          _controller.play();
        });
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // appBar: getAppBar(),
      body: getBody(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      backgroundColor: Colors.black,
      elevation: 0,
      leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 20,
          ),
          onPressed: () {
            Navigator.pop(context);
          }),
      actions: [
        IconButton(
            icon: Icon(
              Icons.collections_bookmark,
              size: 28,
            ),
            onPressed: () {}),
        IconButton(
            icon: Image.asset(
              "assets/images/profile.jpeg",
              fit: BoxFit.cover,
              width: 26,
              height: 26,
            ),
            onPressed: () {}),
      ],
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      child: Column(
        children: [
          _controller.value.isInitialized
              ? Container(
                  height: 220,
                  width: size.width,
                  child: Stack(
                    children: [
                      // AspectRatio(
                      //   aspectRatio: _controller.value.aspectRatio,
                      //   child: VideoPlayer(_controller),
                      // ),
                      Container(
                        child: VideoPlayer(_controller),
                      ),
                      Container(
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.2))),
                      AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: Center(
                          child: IconButton(
                            icon: Icon(
                              _controller.value.isPlaying
                                  ? null
                                  : Icons.play_arrow,
                              size: 50,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                _controller.value.isPlaying
                                    ? _controller.pause()
                                    : _controller.play();
                              });
                            },
                          ),
                        ),
                      ),
                      Positioned(
                        top: 10,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15, top: 20),
                              child: Row(
                                children: [
                                  Icon(Icons.arrow_back_ios_new),
                                  Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: Text(
                                      "Back",
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 5,
                        bottom: 20,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                right: 13, left: 13, top: 8, bottom: 8),
                            child: Row(
                              children: [
                                // Text(
                                //   "Preview",
                                //   style: TextStyle(
                                //       fontSize: 16,
                                //       fontWeight: FontWeight.w600,
                                //       color: Colors.white),
                                // )
                              ],
                            ),
                          ),
                        ),
                      ),
                      // Positioned(
                      //   right: 5,
                      //   bottom: 20,
                      //   child: Container(
                      //     width: 25,
                      //     height: 25,
                      //     decoration: BoxDecoration(
                      //         color: Colors.black, shape: BoxShape.circle),
                      //     child: Center(
                      //       child: Icon(
                      //         Icons.volume_mute,
                      //         color: Colors.white,
                      //       ),
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
                )
              : Container(
                  height: 220,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/images/banner.webp"),
                                fit: BoxFit.cover)),
                      ),
                    ],
                  ),
                ),
          Container(
            // color: Colors.amber,
            height: size.height - 250,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20, bottom: 10),
                      child: Text(
                        "Adventure Infinity",
                        style: TextStyle(
                          fontSize: 22,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Action",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            "  |  ",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            "Adventure",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            "  |  ",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            "Sci fi",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            "  |  ",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            "Fiction",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              "4.0",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 30),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            RatingBar.builder(
                              initialRating: 4,
                              minRating: 1,
                              itemSize: 25,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding:
                                  EdgeInsets.symmetric(horizontal: 0.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Considered a fool and unfit to lead, Nobunaga rises to power as the head of the Oda clan, spurring dissent among those in his family vying for control.",
                      style: TextStyle(
                          height: 1.4, color: Colors.white.withOpacity(0.9)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // Text(
                    //   "Cast: Masayoshi Haneda, Masami Kosaka, Hideaki Ito... more",
                    //   style: TextStyle(
                    //       fontSize: 13,
                    //       height: 1.4,
                    //       color: Colors.grey.withOpacity(0.9)),
                    // ),
                    // Container(
                    //   padding: EdgeInsets.only(left: 20, right: 20),
                    //   child: Text(
                    //       "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available."),
                    // ),
                    // SizedBox(
                    //   height: 20,
                    // ),
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            // width: size.width / 3,
                            // height: 38,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 05),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.tealAccent),
                            child: InkWell(
                              onTap: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (_) =>
                                //             VideoPlayer(_controller)));
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => SampleVideoPlayer(
                                              videoUrl:
                                                  "assets/videos/video_3.mp4",
                                            )));
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.play_arrow,
                                    color: Colors.black,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "COUNTINUE WATCHING",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // Text(
                    //   "Watch Season 1 Now",
                    //   style: TextStyle(
                    //       color: Colors.white.withOpacity(0.9),
                    //       fontWeight: FontWeight.bold,
                    //       fontSize: 17),
                    // ),
                    // SizedBox(
                    //   height: 12,
                    // ),
                    // Container(
                    //   width: size.width,
                    //   height: 38,
                    //   decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(4),
                    //       color: Colors.white),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //       Icon(
                    //         Icons.play_arrow,
                    //         color: Colors.black,
                    //       ),
                    //       SizedBox(
                    //         width: 5,
                    //       ),
                    //       Text(
                    //         "Resume",
                    //         style: TextStyle(
                    //             color: Colors.black,
                    //             fontWeight: FontWeight.bold,
                    //             fontSize: 16),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 12,
                    // ),
                    // Container(
                    //   width: size.width,
                    //   height: 38,
                    //   decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(4),
                    //       color: Colors.grey.withOpacity(0.3)),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //       Icon(
                    //         Icons.file_download,
                    //         color: Colors.white,
                    //       ),
                    //       SizedBox(
                    //         width: 5,
                    //       ),
                    //       Text(
                    //         "Download",
                    //         style: TextStyle(
                    //             color: Colors.white,
                    //             fontWeight: FontWeight.bold,
                    //             fontSize: 16),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    // Text(
                    //   "S1:E1 The Rise of Nobunaga",
                    //   style: TextStyle(
                    //       color: Colors.white.withOpacity(0.9),
                    //       fontWeight: FontWeight.bold,
                    //       fontSize: 17),
                    // ),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Container(
                    //       width: (size.width - 30) * 0.75,
                    //       child: Stack(
                    //         children: [
                    //           Container(
                    //             width: (size.width - 30) * 0.75,
                    //             height: 2.5,
                    //             decoration: BoxDecoration(
                    //                 borderRadius: BorderRadius.circular(5),
                    //                 color: Colors.grey.withOpacity(0.5)),
                    //           ),
                    //           Container(
                    //             width: (size.width - 30) * 0.2,
                    //             height: 2.5,
                    //             decoration: BoxDecoration(
                    //                 borderRadius: BorderRadius.circular(5),
                    //                 color: Colors.red.withOpacity(0.8)),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //     Text(
                    //       "35m remaining",
                    //       style: TextStyle(color: Colors.grey, fontSize: 10),
                    //     )
                    //   ],
                    // ),
                    // SizedBox(
                    //   height: 8,
                    // ),
                    // Text(
                    //   "Considered a fool and unfit to lead, Nobunaga rises to power as the head of the Oda clan, spurring dissent among those in his family vying for control.",
                    //   style: TextStyle(
                    //       height: 1.4, color: Colors.white.withOpacity(0.9)),
                    // ),
                    // SizedBox(
                    //   height: 8,
                    // ),
                    // Text(
                    //   "Cast: Masayoshi Haneda, Masami Kosaka, Hideaki Ito... more",
                    //   style: TextStyle(
                    //       fontSize: 13,
                    //       height: 1.4,
                    //       color: Colors.grey.withOpacity(0.9)),
                    // ),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 30),
                    //   child: Row(
                    //     children: List.generate(likesList.length, (index) {
                    //       return Padding(
                    //         padding: const EdgeInsets.only(right: 50),
                    //         child: Column(
                    //           children: [
                    //             Icon(
                    //               likesList[index]['icon'],
                    //               size: 25,
                    //               color: Colors.white.withOpacity(0.9),
                    //             ),
                    //             SizedBox(
                    //               height: 5,
                    //             ),
                    //             Text(likesList[index]['text'],
                    //                 style: TextStyle(
                    //                     fontSize: 12,
                    //                     height: 1.4,
                    //                     color: Colors.grey.withOpacity(0.9)))
                    //           ],
                    //         ),
                    //       );
                    //     }),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 20,
                    // ),
                    // SingleChildScrollView(
                    //   scrollDirection: Axis.horizontal,
                    //   child: Row(
                    //     children: List.generate(episodesList.length, (index) {
                    //       return GestureDetector(
                    //         onTap: () {
                    //           setState(() {
                    //             activeEpisode = index;
                    //           });
                    //         },
                    //         child: Padding(
                    //           padding: const EdgeInsets.only(right: 25),
                    //           child: Column(
                    //             children: [
                    //               Container(
                    //                 decoration: BoxDecoration(
                    //                     border: Border(
                    //                         top: BorderSide(
                    //                             width: 4,
                    //                             color: activeEpisode == index
                    //                                 ? Colors.red
                    //                                     .withOpacity(0.8)
                    //                                 : Colors.transparent))),
                    //                 child: Padding(
                    //                   padding: const EdgeInsets.only(top: 12),
                    //                   child: Text(
                    //                     episodesList[index],
                    //                     style: TextStyle(
                    //                         fontSize: 16,
                    //                         color: activeEpisode == index
                    //                             ? Colors.white.withOpacity(0.9)
                    //                             : Colors.white.withOpacity(0.5),
                    //                         fontWeight: FontWeight.bold),
                    //                   ),
                    //                 ),
                    //               )
                    //             ],
                    //           ),
                    //         ),
                    //       );
                    //     }),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 30,
                    // ),
                    Text(
                      "Episodes",
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(movieList.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    // color: Colors.amber,
                                    width: (size.width) * 0.90,
                                    height: 100,
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 150,
                                          child: Stack(
                                            children: [
                                              Container(
                                                width: 150,
                                                height: 90,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                            movieList[index]
                                                                ['img']),
                                                        fit: BoxFit.cover)),
                                              ),
                                              Container(
                                                width: 150,
                                                height: 90,
                                                decoration: BoxDecoration(
                                                    color: Colors.black
                                                        .withOpacity(0.3)),
                                              ),
                                              Positioned(
                                                top: 30,
                                                left: 57,
                                                child: Container(
                                                  width: 38,
                                                  height: 38,
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                          width: 2,
                                                          color: Colors.white),
                                                      color: Colors.black
                                                          .withOpacity(0.4)),
                                                  child: Center(
                                                    child: Icon(
                                                      Icons.play_arrow,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          // color: Colors.blue,
                                          width: (size.width) * 0.50,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  movieList[index]['title'],
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      height: 1.3,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.white
                                                          .withOpacity(0.9)),
                                                ),
                                                SizedBox(
                                                  height: 3,
                                                ),
                                                Text(
                                                  movieList[index]['duration'],
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.white
                                                          .withOpacity(0.5)),
                                                ),
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .file_download_outlined,
                                                      color: Colors.tealAccent
                                                          .withOpacity(0.7),
                                                    ),
                                                    SizedBox(
                                                      width: 05,
                                                    ),
                                                    Text(
                                                      "Download",
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          height: 1.3,
                                                          color: Colors
                                                              .tealAccent
                                                              .withOpacity(
                                                                  0.9)),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              // SizedBox(
                              //   height: 5,
                              // ),
                              // Text(
                              //   movieList[index]['description'],
                              //   style: TextStyle(
                              //       height: 1.4,
                              //       color: Colors.white.withOpacity(0.5)),
                              // ),
                            ],
                          ),
                        );
                      }),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

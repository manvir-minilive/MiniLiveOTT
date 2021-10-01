import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:netflix_clone/json/home_json.dart';
import 'package:netflix_clone/pages/person_details.dart';
import 'package:netflix_clone/pages/video_detail_page.dart';
import 'package:netflix_clone/pages/video_player.dart';

class ViewHomePage extends StatefulWidget {
  @override
  _ViewHomePageState createState() => _ViewHomePageState();
}

class _ViewHomePageState extends State<ViewHomePage> {
  String actorImg = "assets/images/dptop.jpg";
  String actorName = "John Doe";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: size.height - 80,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 350,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/images/banner.webp"),
                                fit: BoxFit.cover)),
                      ),
                      Container(
                          height: 350,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                Colors.black.withOpacity(0.85),
                                Colors.black.withOpacity(0.0),
                              ],
                                  end: Alignment.topCenter,
                                  begin: Alignment.bottomCenter))),
                      Container(
                        // color: Colors.amber,
                        height: 350,
                        width: size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Image.asset(
                            //   "assets/images/title_img.webp",
                            //   width: 300,
                            // ),

                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => VideoDetailPage(
                                              videoUrl:
                                                  "assets/videos/video_1.mp4",
                                            )));
                              },
                              child: Container(),
                              // Container(
                              //   width: 70,
                              //   height: 70,
                              //   decoration: BoxDecoration(
                              //     color: Colors.white,
                              //     borderRadius: BorderRadius.circular(50),
                              //   ),
                              //   child: Padding(
                              //     padding: const EdgeInsets.only(
                              //         right: 10, left: 8, top: 2, bottom: 2),
                              //     child: Row(
                              //       mainAxisAlignment: MainAxisAlignment.center,
                              //       crossAxisAlignment:
                              //           CrossAxisAlignment.center,
                              //       children: [
                              //         // play button here
                              //         Icon(
                              //           Icons.play_arrow,
                              //           color: Colors.black,
                              //           size: 50,
                              //         ),
                              //         // play button here
                              //         // SizedBox(
                              //         //   width: 5,
                              //         // ),
                              //         // Text(
                              //         //   "Play",
                              //         //   style: TextStyle(
                              //         //       fontSize: 16,
                              //         //       fontWeight: FontWeight.w600,
                              //         //       color: Colors.black),
                              //         // )
                              //       ],
                              //     ),
                              //   ),
                              // ),
                            ),

                            SizedBox(
                              height: 15,
                            ),
                            // Text(
                            //   "Excting - Sci-Fi Drama - Sci-Fi Adventure",
                            //   style: TextStyle(
                            //     fontSize: 11,
                            //   ),
                            // )
                          ],
                        ),
                      ),
                      Container(
                        height: 320,
                        width: size.width,
                        margin: EdgeInsets.only(left: 20),
                        // color: Colors.amber,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                          ],
                        ),
                      )
                    ],
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
                            itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
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
                      // GestureDetector(
                      //   onTap: () {
                      //     Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //             builder: (_) => VideoDetailPage(
                      //                   videoUrl: "assets/videos/video_1.mp4",
                      //                 )));
                      //   },
                      //   child: Container(
                      //     decoration: BoxDecoration(
                      //       color: Colors.white,
                      //       borderRadius: BorderRadius.circular(4),
                      //     ),
                      //     child: Padding(
                      //       padding: const EdgeInsets.only(
                      //           right: 13, left: 8, top: 2, bottom: 2),
                      //       child: Row(
                      //         children: [
                      //           Icon(
                      //             Icons.play_arrow,
                      //             color: Colors.black,
                      //             size: 30,
                      //           ),
                      //           SizedBox(
                      //             width: 5,
                      //           ),
                      //           Text(
                      //             "Play",
                      //             style: TextStyle(
                      //                 fontSize: 16,
                      //                 fontWeight: FontWeight.w600,
                      //                 color: Colors.black),
                      //           )
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      // Column(
                      //   children: [
                      //     Icon(
                      //       Icons.info_outline,
                      //       size: 25,
                      //     ),
                      //     SizedBox(
                      //       height: 5,
                      //     ),
                      //     Text(
                      //       "Info",
                      //       style: TextStyle(fontWeight: FontWeight.w600),
                      //     )
                      //   ],
                      // ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                        "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available."),
                  ),
                  SizedBox(
                    height: 20,
                  ),
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
                                  "Watch Now",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          // width: size.width / 3,
                          // height: 38,
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 05),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.pinkAccent),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => VideoDetailPage(
                                            videoUrl:
                                                "assets/videos/video_1.mp4",
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
                                  "Watch trailer",
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
                    height: 40,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, bottom: 15),
                        child: Text(
                          "Cast",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: GestureDetector(
                          // onTap: () {
                          //   Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //           builder: (_) => PersonDetails(
                          //                 imgUrl: actorImg,
                          //                 actorName: actorName,
                          //               )));
                          // },
                          child: Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Row(
                              children: List.generate(mylist.length, (index) {
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      print("on tab is working");
                                      actorImg = actor[index]['img'];
                                      actorName = actor[index]['title'];
                                      print(actorImg);
                                      print(actorName);
                                    });
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => PersonDetails(
                                                  imgUrl: actorImg,
                                                  actorName: actorName,
                                                )));
                                  },
                                  child: Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(right: 8),
                                        width: 110,
                                        height: 160,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    actor[index]['img']),
                                                fit: BoxFit.cover)),
                                      ),
                                      Container(
                                        child: Text(
                                          actor[index]['title'],
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              }),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Text(
                          "Recommended",
                          style: TextStyle(
                              color: Colors.tealAccent,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => VideoDetailPage(
                                        videoUrl:
                                            "assets/videos/video_2.mp4")));
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Row(
                              children:
                                  List.generate(popularList.length, (index) {
                                return Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 8),
                                      width: 110,
                                      height: 160,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  popularList[index]['img']),
                                              fit: BoxFit.cover)),
                                    ),
                                    Container(
                                      child: Text(
                                        popularList[index]['title'],
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                );
                              }),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Text(
                          "Trending Now",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => VideoDetailPage(
                                        videoUrl:
                                            "assets/videos/video_1.mp4")));
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Row(
                              children:
                                  List.generate(trendingList.length, (index) {
                                return Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 8),
                                      width: 110,
                                      height: 160,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  trendingList[index]['img']),
                                              fit: BoxFit.cover)),
                                    ),
                                    Container(
                                      child: Text(
                                        trendingList[index]['title'],
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                );
                              }),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Text(
                          "MiniLive Originals",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => VideoDetailPage(
                                        videoUrl:
                                            "assets/videos/video_1.mp4")));
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Row(
                              children:
                                  List.generate(originalList.length, (index) {
                                return Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 8),
                                      width: 165,
                                      height: 300,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  originalList[index]['img']),
                                              fit: BoxFit.cover)),
                                    ),
                                    Container(
                                      child: Text(
                                        originalList[index]['title'],
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                );
                              }),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Text(
                          "Anime",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => VideoDetailPage(
                                        videoUrl:
                                            "assets/videos/video_1.mp4")));
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Row(
                              children:
                                  List.generate(animeList.length, (index) {
                                return Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 8),
                                      width: 110,
                                      height: 160,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  animeList[index]['img']),
                                              fit: BoxFit.cover)),
                                    ),
                                    Container(
                                      child: Text(
                                        animeList[index]['title'],
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                );
                              }),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              child: SafeArea(
                child: Column(
                  children: [
                    Row(
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
                              // Image.asset(
                              //   "assets/images/logo.ico",
                              //   width: 35,
                              //   fit: BoxFit.cover,
                              // )
                            ],
                          ),
                        ),
                        // Row(
                        //   children: [
                        //     IconButton(
                        //         icon: Icon(
                        //           Icons.collections_bookmark,
                        //           size: 28,
                        //         ),
                        //         onPressed: () {}),
                        //     IconButton(
                        //         icon: Image.asset(
                        //           "assets/images/profile.jpeg",
                        //           fit: BoxFit.cover,
                        //           width: 26,
                        //           height: 26,
                        //         ),
                        //         onPressed: () {}),
                        //   ],
                        // )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //   children: [
                    //     Text(
                    //       "TV Shows",
                    //       style: TextStyle(
                    //           fontSize: 15, fontWeight: FontWeight.w500),
                    //     ),
                    //     Text(
                    //       "Movies",
                    //       style: TextStyle(
                    //           fontSize: 15, fontWeight: FontWeight.w500),
                    //     ),
                    //     Row(
                    //       children: [
                    //         Text(
                    //           "Categories",
                    //           style: TextStyle(
                    //               fontSize: 15, fontWeight: FontWeight.w500),
                    //         ),
                    //         SizedBox(
                    //           width: 3,
                    //         ),
                    //         Icon(Icons.keyboard_arrow_down)
                    //       ],
                    //     )
                    //   ],
                    // )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
// import 'package:netflix_clone/common/languageChip.dart';
import 'package:netflix_clone/json/home_json.dart';
import 'package:netflix_clone/pages/video_detail_page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:netflix_clone/pages/view_home_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OTTHomePage extends StatefulWidget {
  @override
  _OTTHomePageState createState() => _OTTHomePageState();
}

class _OTTHomePageState extends State<OTTHomePage> {
  bool _isSelected;
  List<String> _choices;
  int _choiceIndex;
  int activeIndex = 0;
  static const miniPinkColor = Colors.transparent;
  final imgPath = [
    "assets/images/title_1.png",
    "assets/images/title_2.png"
        "assets/images/title_3.jpgs"
  ];
  @override
  void initState() {
    super.initState();
    _isSelected = false;
    _choiceIndex = 0;
    _choices = ["Movies", "Tv Series", "Comedy", "Family"];
  }

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
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => ViewHomePage(
                                          // videoUrl: "assets/videos/video_1.mp4",
                                          )));
                            },
                            child: CarouselSlider(
                              items: [
                                BannerImg("assets/images/title_1.png"),
                                BannerImg("assets/images/title_2.png"),
                                BannerImg("assets/images/title_3.jpg")
                              ],
                              options: CarouselOptions(
                                height: 500,
                                viewportFraction: 1,
                                autoPlay: false,
                                enlargeCenterPage: true,
                                enableInfiniteScroll: true,
                                scrollDirection: Axis.horizontal,
                                onPageChanged: (index, reson) =>
                                    setState(() => activeIndex = index),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          buildIndicator(),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  tabBar(),
                  SizedBox(
                    height: 30,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Watching",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            GestureDetector(
                              onTap: () {
                                print("pressed");
                              },
                              child: Text(
                                "see all",
                                style: TextStyle(
                                  color: Colors.tealAccent,
                                  fontSize: 12,
                                ),
                              ),
                            )
                          ],
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
                                    builder: (_) => ViewHomePage(
                                        // videoUrl: "assets/videos/video_1.mp4",
                                        )));
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Row(
                              children: List.generate(mylist.length, (index) {
                                return Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 12),
                                      width: 110,
                                      height: 140,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.white
                                                  .withOpacity(0.5)),
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  mylist[index]['img']),
                                              fit: BoxFit.cover)),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.01,
                                    ),
                                    Container(
                                      child: Text(
                                        mylist[index]['title'],
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Featured",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            GestureDetector(
                              onTap: () {
                                print("pressed");
                              },
                              child: Text(
                                "see all",
                                style: TextStyle(
                                  color: Colors.tealAccent,
                                  fontSize: 12,
                                ),
                              ),
                            )
                          ],
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
                                    builder: (_) => ViewHomePage(
                                        // videoUrl:
                                        //     "assets/videos/video_2.mp4"
                                        )));
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Row(
                              children:
                                  List.generate(popularList.length, (index) {
                                return Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 12),
                                      width: 110,
                                      height: 140,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.white
                                                  .withOpacity(0.5)),
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  popularList[index]['img']),
                                              fit: BoxFit.cover)),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.01,
                                    ),
                                    Container(
                                      child: Text(
                                        popularList[index]['title'],
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Recent Release",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            GestureDetector(
                              onTap: () {
                                print("pressed");
                              },
                              child: Text(
                                "see all",
                                style: TextStyle(
                                  color: Colors.tealAccent,
                                  fontSize: 12,
                                ),
                              ),
                            )
                          ],
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
                                    builder: (_) => ViewHomePage(
                                        // videoUrl:
                                        //     "assets/videos/video_1.mp4"
                                        )));
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Row(
                              children:
                                  List.generate(trendingList.length, (index) {
                                return Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 12),
                                      width: 110,
                                      height: 140,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.white
                                                  .withOpacity(0.5)),
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  trendingList[index]['img']),
                                              fit: BoxFit.cover)),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.01,
                                    ),
                                    Container(
                                      child: Text(
                                        trendingList[index]['title'],
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
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
                          padding: const EdgeInsets.only(left: 10),
                          child: Row(
                            children: [
                              IconButton(
                                  icon: Icon(
                                    Icons.arrow_back,
                                    size: 28,
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  }),
                            ],
                          ),
                        ),
                        // Row(
                        //   children: [
                        //     IconButton(
                        //         icon: Image.asset(
                        //           "assets/images/share.png",
                        //           color: Colors.white,
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget BannerImg(String imgPath) {
    return Container(
      height: 400,
      decoration: BoxDecoration(
          image:
              DecorationImage(image: AssetImage(imgPath), fit: BoxFit.cover)),
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: 3,
        effect: JumpingDotEffect(
            spacing: 8.0,
            radius: 4.0,
            dotWidth: 9.0,
            dotHeight: 8.0,
            paintStyle: PaintingStyle.stroke,
            strokeWidth: 1.5,
            dotColor: Colors.grey,
            activeDotColor: Colors.tealAccent),
      );

  Widget tabBar() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        width: MediaQuery.of(context).size.width * 5,
        height: MediaQuery.of(context).size.width * 0.1,
        decoration: BoxDecoration(color: Colors.black),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            _choices.length,
            (index) {
              return Row(
                children: [
                  ChoiceChip(
                    label: Text(_choices[index]),
                    selected: _choiceIndex == index,
                    selectedColor: Colors.tealAccent.withOpacity(0.3),
                    onSelected: (bool selected) {
                      setState(() {
                        _choiceIndex = selected ? index : 0;
                      });
                    },
                    backgroundColor: Colors.black,
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  _choices.length == index + 1 ? Text("") : Text("|")
                ],
              );
            },
          ),
        ));
  }
}

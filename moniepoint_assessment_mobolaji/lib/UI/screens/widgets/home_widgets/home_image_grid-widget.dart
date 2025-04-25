import 'package:flutter/material.dart';

import 'home_buttons_slide_widget.dart';

class HomeImageGridwidget extends StatefulWidget {
  const HomeImageGridwidget({Key? key}) : super(key: key);

  @override
  _HomeImageGridwidgetState createState() => _HomeImageGridwidgetState();
}

class _HomeImageGridwidgetState extends State<HomeImageGridwidget> {
  @override
  void initState() {
    super.initState();

    // Preload images into cache
    Future.microtask(() {
      precacheImage(const AssetImage('assets/images/pexels-fotoaibe-1571460.jpg'), context);
      precacheImage(const AssetImage('assets/images/home1.jpg'), context);
      precacheImage(const AssetImage('assets/images/home2.jpg'), context);
      precacheImage(const AssetImage('assets/images/home3.jpg'), context);
      precacheImage(const AssetImage('assets/images/home4.jpg'), context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: _theme.scaffoldBackgroundColor,
          width: 10,
        ),
        color: _theme.scaffoldBackgroundColor,
      ),
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 5 / 2.5,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/images/pexels-fotoaibe-1571460.jpg',
                      ),
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                const Positioned(
                  right: 10,
                  left: 10,
                  bottom: 9,
                  child: HomeButtonSlideExpandWidget(
                    title: 'GladKova St, 25',
                    isverticalContainer: false,
                    animationDelayTime: 1000,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    AspectRatio(
                      aspectRatio: 2.5 / 5.15,
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/images/home2.jpg'),
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          const Positioned(
                            right: 10,
                            left: 10,
                            bottom: 9,
                            child: HomeButtonSlideExpandWidget(
                              title: 'Sedova St, 11',
                              isverticalContainer: true,
                              animationDelayTime: 1520,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  children: [
                    AspectRatio(
                      aspectRatio: 2 / 2,
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/images/home4.jpg'),
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          const Positioned(
                            right: 10,
                            left: 10,
                            bottom: 9,
                            child: HomeButtonSlideExpandWidget(
                              title: 'Gubina St, 9',
                              isverticalContainer: true,
                              animationDelayTime: 1100,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    AspectRatio(
                      aspectRatio: 2 / 2,
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/images/home3.jpg'),
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          const Positioned(
                            right: 10,
                            left: 10,
                            bottom: 9,
                            child: HomeButtonSlideExpandWidget(
                              title: 'Trefola St, 1',
                              isverticalContainer: true,
                              animationDelayTime: 1500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

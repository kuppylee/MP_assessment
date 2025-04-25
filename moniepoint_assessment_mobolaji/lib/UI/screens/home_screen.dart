import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:moniepoint_assessment_mobolaji/utils/estensions.dart';

import '../../utils/screen_size.dart';
import 'widgets/home_widgets/home_widgets.dart';
import 'widgets/home_widgets/home_image_grid-widget.dart';

class HomePageTab extends StatefulWidget {
  const HomePageTab({super.key});

  @override
  State<HomePageTab> createState() => _HomePageTabState();
}

class _HomePageTabState extends State<HomePageTab>
    with SingleTickerProviderStateMixin {
  int _numValue1 = 0;
  int _numValue2 = 0;
  bool _expandText = false;
  bool _hideCircleRow = false;
  bool overlayExpanded = false;
  late Animation<double> _animation;
  late AnimationController _controller;

  double _scrollPosition = 0.0;

  bool isExpanded = false;

  @override
  void initState() {
    numbersFunction();
    animateWidth();
    hideCircleWidget();
    _controller = AnimationController(
        vsync: this, duration: 1200.ms, reverseDuration: 500.ms);

    _controller.addStatusListener((listener) {
      overlayExpanded = true;
      if (listener == AnimationStatus.dismissed) {}
    });

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    if (mounted) {
      _controller.forward();
    }

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void numbersFunction() {
    Future.delayed(const Duration(milliseconds: 1800), () {
      if (mounted) {
        setState(() {
          _numValue1 = 1034;
          _numValue2 = 2212;
        });
      }
    });
  }

  void animateWidth() {
    Future.delayed(const Duration(milliseconds: 1200), () {
      if (mounted) {
        setState(() {
          _expandText = true;
        });
      }
    });
  }

  void hideCircleWidget() {
    Future.delayed(const Duration(milliseconds: 2600), () {
      if (mounted) {
        setState(() {
          _hideCircleRow = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: myScreenHeight(1, context),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                colors: [
                  _theme.primaryColor.withOpacity(0.20),
                  _theme.primaryColor.withOpacity(0.1),
                  _theme.primaryColor.withOpacity(0.08),
                ],
                stops: const [0.0, 0.5, 1.0],
              ),
            ),
            child: NotificationListener<ScrollNotification>(
              onNotification: (scrollNotification) {
                setState(() {
                  _scrollPosition = scrollNotification.metrics.pixels;
                });
                return true;
              },
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 12), // Space before content starts
                    HomeGridWidget(),
                    const SizedBox(height: 32), // Space before content starts
                    Row(
                      children: [
                        Expanded(
                          child: const HomeImageGridwidget().slideInFromBottom(
                            delay: 1850.ms,
                            animationDuration: 1150.ms,
                            begin: 1,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Positioned(
          //   left: 1,
          //   right: 1,
          //   top: Platform.isAndroid ? 207 : 250,
          //   child: Offstage(
          //     offstage: !_hideCircleRow,
          //     child: Row(
          //       children: [
          //         Expanded(
          //           child: const ImageGridwidget().slideInFromBottom(
          //             delay: 1850.ms,
          //             animationDuration: 1150.ms,
          //             begin: 1,
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          Positioned(
            left: 20,
            right: 10,
            top: Platform.isAndroid ? 45 : 60,
            child: SizedBox(
              width: size.width * 0.9,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //  mainAxisSize: MainAxisSize.max,
                children: [
                  AnimatedBuilder(
                      animation: _animation,
                      builder: (context, child) {
                        return Align(
                          alignment: Alignment.centerLeft,
                          child: Transform.scale(
                            scale: _animation.value,
                            alignment: Alignment.centerLeft,

                            child: AnimatedContainer(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              height: 40,
                              duration: 850.ms,
                              width: !overlayExpanded ? 2 : 145,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: _theme.cardColor,
                              ),
                              child: overlayExpanded &&
                                      _animation.status ==
                                          AnimationStatus.completed
                                  ? Row(
                                      children: [
                                        Icon(
                                          Icons.location_on,
                                          color: _theme
                                              .textTheme.labelSmall?.color,
                                          size: 15,
                                        ),
                                        Text(
                                          'Saints Petersburg',
                                          style: _theme.textTheme.labelSmall
                                              ?.copyWith(
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'Special Gothic'
                                          ),
                                        ),
                                      ],
                                    )
                                  : null,
                            ),
                            //  ),
                          ),
                        );
                      }),
                  TweenAnimationBuilder(
                      tween: Tween<double>(begin: 0.2, end: 1.0),
                      duration: const Duration(milliseconds: 1200),
                      curve: Curves.easeInOut,
                      builder: (context, double value, child) {
                        return Transform.scale(
                          scale: value,
                          child: Opacity(
                            opacity: value,
                            child: Container(
                              height: 45,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: _theme.primaryColor,
                                  shape: BoxShape.circle,
                                  image: const DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          'assets/images/profile_img.png'))),
                            ),
                          ),
                        );
                      })
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../utils/screen_size.dart';


class HomeButtonSlideExpandWidget extends StatefulWidget {
  final String title;
  final bool
      isverticalContainer; // check if the container orientation is landscape
  final int animationDelayTime;

  const HomeButtonSlideExpandWidget(
      {super.key,
      required this.title,
      required this.isverticalContainer,
      required this.animationDelayTime});
  @override
  _HomeButtonSlideExpandWidgetState createState() => _HomeButtonSlideExpandWidgetState();
}

class _HomeButtonSlideExpandWidgetState extends State<HomeButtonSlideExpandWidget> {
  bool isExpanded = false;

  @override
  void initState() {
    expand();

    super.initState();
  }

  void expand() async {
    await Future.delayed(Duration(milliseconds: widget.animationDelayTime));
    if (mounted) {
      setState(() {
        isExpanded = !isExpanded;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 2500),
      width: isExpanded
          ? myScreenWidth(0.9, context)
          : myScreenHeight(0.06, context),
      height: myScreenHeight(0.06, context),
      decoration: BoxDecoration(
        color: isExpanded
            ? Color.fromARGB(255, 219, 209, 196)?.withOpacity(0.93)
            : null,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          widget.isverticalContainer
              ? AnimatedPositioned(
                  duration: const Duration(milliseconds: 2500),
                  left: isExpanded
                      ? myScreenWidth(0.268, context)
                      : .0, // Slide the button
                  child: CircleAvatar(
                    radius: myScreenHeight(0.029, context),
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: _theme.colorScheme.onSecondary,
                      size: myScreenHeight(0.02, context),
                    ),
                  ),
                )
              : AnimatedPositioned(
                  duration: const Duration(milliseconds: 2600),
                  left: isExpanded
                      ? myScreenWidth(0.765, context)
                      : .0, // Slide the button
                  child: CircleAvatar(
                    radius: myScreenHeight(0.02678, context),
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: _theme.colorScheme.onSecondary,
                      size: myScreenHeight(0.02, context),
                    ),
                  ),
                ),
          if (!widget.isverticalContainer)
            isExpanded
                ? Center(
                    child:
                        Text(widget.title, style: const TextStyle(
                          fontFamily: "Special Gothic",
                          fontSize: 18,
                          color: Colors.black87
                        )),
                  )
                : Container(),
          if (widget.isverticalContainer)
            isExpanded
                ? Positioned(
                    left: 10,
                    child:
                        Text(widget.title, style: const TextStyle(
                            fontFamily: "Special Gothic",
                            fontSize: 16,
                            color: Colors.black87
                        )
                        ),
                  )
                : Container(),
        ],
      ),
    );
  }
}

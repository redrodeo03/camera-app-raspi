import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';

import 'navigation_observer.dart';

class BreadCrumbNavigator extends StatelessWidget {
  final List<Route> currentRouteStack;
  BreadCrumbNavigator({super.key})
      : currentRouteStack = routeStack
            //.where((element) => element.settings.name != null)
            .toList();

  Widget build1(BuildContext context) {
    return RowSuper(
      alignment: Alignment.centerLeft,
      mainAxisSize: MainAxisSize.max,
      innerDistance: -16,
      children: List<Widget>.from(currentRouteStack
          .asMap()
          .map(
            (index, value) => MapEntry(
                index,
                GestureDetector(
                    onTap: () {
                      Navigator.popUntil(context,
                          (route) => route == currentRouteStack[index]);
                    },
                    child: _BreadButton(
                        index == 0
                            ? 'Home'
                            : currentRouteStack[index].settings.name as String,
                        index == 0))),
          )
          .values),
    );
  }

  @override
  Widget build(BuildContext context) {
    for (var i = 1; i < currentRouteStack.length; i++) {
      if (currentRouteStack[i].settings.name == null) {
        currentRouteStack.remove(currentRouteStack[i]);
      }
    }

    return SizedBox(
        height: 35,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: currentRouteStack.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                  onTap: () {
                    try {
                      Navigator.popUntil(context,
                          (route) => route == currentRouteStack[index]);
                    } catch (e) {
                      debugPrint(e.toString());
                    }
                  },
                  child: _BreadButton(
                      index == 0
                          ? 'Home'
                          : currentRouteStack[index].settings.name as String,
                      index == 0));
            }));
  }
}

class _BreadButton extends StatelessWidget {
  final String text;
  final bool isFirstButton;

  const _BreadButton(this.text, this.isFirstButton);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: _TriangleClipper(!isFirstButton),
      child: Container(
        color: Colors.blue,
        child: Padding(
          padding: EdgeInsetsDirectional.only(
              start: isFirstButton ? 8 : 20, end: 28, top: 8, bottom: 8),
          child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
      ),
    );
  }
}

class _TriangleClipper extends CustomClipper<Path> {
  final bool twoSideClip;

  _TriangleClipper(this.twoSideClip);

  @override
  Path getClip(Size size) {
    final Path path = Path();
    if (twoSideClip) {
      path.moveTo(20, 0.0);
      path.lineTo(0.0, size.height / 2);
      path.lineTo(20, size.height);
    } else {
      path.lineTo(0, size.height);
    }
    path.lineTo(size.width, size.height);
    path.lineTo(size.width - 20, size.height / 2);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

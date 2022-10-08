// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


/// Displays a widget that will be passed to `child` parameter above the current
/// contents of the app, with transition animation
///
/// The `child` argument is used to pass widget that you want to show
///
/// The `showOutAnimationDuration` argument is used to specify duration of
/// enter transition
///
/// The `hideOutAnimationDuration` argument is used to specify duration of
/// exit transition
///
/// The `displayDuration` argument is used to specify duration displaying
///
/// The `additionalTopPadding` argument is used to specify amount of top
/// padding that will be added for SafeArea values
///
/// The `overlayState` argument is used to add specific overlay state.
/// If you will not pass it, it will try to get the current overlay state from
/// passed `BuildContext`
///
void showTopSnackBar(
  BuildContext context,
  Widget child, {
  Duration showOutAnimationDuration = const Duration(milliseconds: 1200),
  Duration hideOutAnimationDuration = const Duration(milliseconds: 550),
  Duration displayDuration = const Duration(milliseconds: 3000),
  double additionalTopPadding = 16.0,
  OverlayState ? overlayState,
})  {
  // ignore: prefer_conditional_assignment
  if (overlayState == null) {
    overlayState = Overlay.of(context);
  }
  OverlayEntry ?overlayEntry;
  overlayEntry = OverlayEntry(
    builder: (context) {
      return TopSnackBar(
        onDismissed: () {
          overlayEntry!.remove();
        },
        showOutAnimationDuration: showOutAnimationDuration,
        hideOutAnimationDuration: hideOutAnimationDuration,
        displayDuration: displayDuration,
        additionalTopPadding: additionalTopPadding,
        child: child,
      );
    },
  );

  overlayState!.insert(overlayEntry);
}

/// Widget that controls all animations
class TopSnackBar extends StatefulWidget {
  final Widget child;
  final VoidCallback onDismissed;
  final showOutAnimationDuration;
  final hideOutAnimationDuration;
  final displayDuration;
  final additionalTopPadding;

 const TopSnackBar({
    Key ? key,
    required this.child,
    required this.onDismissed,
    required this.showOutAnimationDuration,
    required this.hideOutAnimationDuration,
    required this.displayDuration,
    required this.additionalTopPadding,
  }) : super(key: key);

  @override
  _TopSnackBarState createState() => _TopSnackBarState();
}

class _TopSnackBarState extends State<TopSnackBar>
    with SingleTickerProviderStateMixin {
   Animation<Offset> ?offsetAnimation;
  AnimationController ?animationController;
  double ?topPosition;

  @override
  void initState() {
    topPosition = widget.additionalTopPadding;
    _setupAndStartAnimation();
    super.initState();
  }

  void _setupAndStartAnimation() async {
    animationController = AnimationController(
      vsync: this,
      duration: widget.showOutAnimationDuration,
      reverseDuration: widget.hideOutAnimationDuration,
    );

    Tween<Offset> offsetTween = Tween<Offset>(
      begin: const Offset(0.0, -1.0),
      end: const Offset(0.0, 0.0),
    );

    offsetAnimation = offsetTween.animate(
      CurvedAnimation(
        parent: animationController!,
        curve: Curves.elasticOut,
        reverseCurve: Curves.linearToEaseOut,
      ),
    )..addStatusListener((status) async {
        if (status == AnimationStatus.completed) {
          await Future.delayed(widget.displayDuration);
          animationController!.reverse();
          if (mounted) {
            setState(() {
              topPosition = 0;
            });
          }
        }

        if (status == AnimationStatus.dismissed) {
          widget.onDismissed.call();
        }
      });

    animationController!.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: widget.hideOutAnimationDuration * 1.5,
      curve: Curves.linearToEaseOut,
      top: topPosition,
      left: 16,
      right: 16,
      child: SlideTransition(
        position: offsetAnimation!,
        child: SafeArea(
          child: TapBounceContainer(
            onTap: () {
              animationController!.reverse();
            },
            child: widget.child,
          ),
        ),
      ),
    );
  }
}



/// Widget for nice tap effect. It decrease widget scale while tapping
class TapBounceContainer extends StatefulWidget {
  final Widget child;
  final Function onTap;

  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  TapBounceContainer({
    required this.child,
    required this.onTap,
  });

  @override
  _TapBounceContainerState createState() => _TapBounceContainerState();
}

class _TapBounceContainerState extends State<TapBounceContainer>
    with SingleTickerProviderStateMixin {
  double? _scale;
  AnimationController? _controller;

  final animationDuration = const Duration(milliseconds: 200);

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: animationDuration,
      lowerBound: 0.0,
      upperBound: 0.04,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller!.value;

    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onPanEnd: _onPanEnd,
      child: Transform.scale(
        scale: _scale,
        child: widget.child,
      ),
    );
  }

  void _onTapDown(TapDownDetails details) {
    _controller!.forward();
  }

  void _onTapUp(TapUpDetails details) async {
    await _closeSnackBar();
  }

  void _onPanEnd(DragEndDetails details) async {
    await _closeSnackBar();
  }

  Future _closeSnackBar() async {
    _controller!.reverse();
    await Future.delayed(animationDuration);
    widget.onTap();
  }
}



/// Popup widget that you can you by default to show some information
class CustomSnackBar extends StatefulWidget {
  final String message;
  final Widget icon;
  final Color backgroundColor;
  final TextStyle ?textStyle;
  final int iconRotationAngle;

  const CustomSnackBar({
    Key? key,
    required this.message,
    required this.icon,
    required this.backgroundColor,
    this.iconRotationAngle = 32,
    this.textStyle,
  }) : super(key: key);

  const CustomSnackBar.success({
    Key ?key,
    required this.message,
    this.icon = const Icon(
      Icons.sentiment_very_satisfied,
      color: Color(0x15000000),
      size: 120,
    ),
    this.textStyle = const TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 16,
      color: Colors.white,
    ),
    this.iconRotationAngle = 32,
    this.backgroundColor =  Colors.green,
  });

  const CustomSnackBar.info({
    Key? key,
    required this.message,
    this.icon = const Icon(
      Icons.sentiment_neutral,
      color: Color(0x15000000),
      size: 120,
    ),
    this.textStyle = const TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 16,
      color: Colors.white,
    ),
    this.iconRotationAngle = 32,
    this.backgroundColor = const Color(0xff2196F3),
  });

  const CustomSnackBar.error({
    Key ?key,
    required this.message,
    this.icon = const Icon(
      Icons.error_outline,
      color: Color(0x15000000),
      size: 120,
    ),
    this.textStyle = const TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 16,
      color: Colors.white,
    ),
    this.iconRotationAngle = 32,
    this.backgroundColor = const Color(0xffff5252),
  });

  @override
  _CustomSnackBarState createState() => _CustomSnackBarState();
}

class _CustomSnackBarState extends State<CustomSnackBar> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0.0, 8.0),
            spreadRadius: 1,
            blurRadius: 30,
          ),
        ],
      ),
      width: double.infinity,
      child: Row(
        children: [
          ClipRRect(
            child: Container(
              height: 95,
              margin: const EdgeInsets.only(left: 10),
              child: Transform.rotate(
                angle: widget.iconRotationAngle * pi / 180,
                child: widget.icon,
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: AutoSizeText(
                  widget.message,
                  style: theme.textTheme.bodyText2?.merge(
                    widget.textStyle ?? const TextStyle(),
                  ),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

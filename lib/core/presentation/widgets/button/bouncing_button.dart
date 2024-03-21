import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BouncingButton extends StatefulWidget {
  final bool? hasHapticFeedBack;
  final bool? delayTapAnimation;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final Widget child;

  const BouncingButton({
    super.key,
    this.hasHapticFeedBack = false,
    this.delayTapAnimation = false,
    this.onTap,
    this.onLongPress,
    required this.child,
  });

  @override
  State<BouncingButton> createState() => _BouncingButtonState();
}

class _BouncingButtonState extends State<BouncingButton>
    with SingleTickerProviderStateMixin {
  static const clickAnimationDurationMillis = 100;

  double _scaleTransformValue = 1;

  // needed for the "click" tap effect
  late final AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: clickAnimationDurationMillis),
      lowerBound: 0.0,
      upperBound: 0.05,
    )..addListener(() {
        setState(() => _scaleTransformValue = 1 - animationController.value);
      });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await _onTapWrapper();
        _shrinkButtonSize();
        _restoreButtonSize();
      },
      onTapDown: (_) => _shrinkButtonSize(),
      onTapCancel: _restoreButtonSize,
      onLongPress: widget.onLongPress,
      child: Transform.scale(
        scale: _scaleTransformValue,
        child: widget.child,
      ),
    );
  }

  Future<void> _onTapWrapper() async {
    if (widget.delayTapAnimation ?? false) {
      await Future.delayed(
        const Duration(
          milliseconds: 100,
          // milliseconds: clickAnimationDurationMillis * 2,
        ),
        () {
          _onTap();
        },
      );
    } else {
      _onTap();
    }
  }

  void _onTap() {
    if (widget.hasHapticFeedBack ?? false) {
      HapticFeedback.selectionClick();
    }
    return widget.onTap?.call();
  }

  void _shrinkButtonSize() {
    animationController.forward();
  }

  void _restoreButtonSize() {
    Future.delayed(
      const Duration(milliseconds: clickAnimationDurationMillis),
      () => animationController.reverse(),
    );
  }
}

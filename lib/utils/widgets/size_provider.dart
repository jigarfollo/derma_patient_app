import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class SizeProvider extends StatefulWidget {
  final Widget child;
  final Function onSizeChange;
  final bool update;

  const SizeProvider({
    Key key,
    @required this.onSizeChange,
    @required this.child,
    @required this.update,
  }) : super(key: key);

  @override
  _SizeProviderState createState() => _SizeProviderState();
}

class _SizeProviderState extends State<SizeProvider> {
  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback(postFrameCallback);
    return Container(
      key: widgetKey,
      child: widget.update ?? true ? widget.child : widget.child,
    );
  }

  var widgetKey = GlobalKey();
  var oldSize;

  void postFrameCallback(_) {
    var context = widgetKey.currentContext;
    if (context == null) return;

    var newSize = context.size;
    if (oldSize == newSize) return;

    oldSize = newSize;
    widget.onSizeChange(newSize);
  }
}

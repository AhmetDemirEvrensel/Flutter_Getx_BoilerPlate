import 'package:flutter/widgets.dart';

abstract class MountedState<T extends StatefulWidget> extends State<T> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }
}

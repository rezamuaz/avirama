import 'package:flutter/material.dart';

class DevScreenLayout extends StatelessWidget {
  const DevScreenLayout(
    this.title, {
    this.children = const <Widget>[],
    this.padding,
    Key? key,
  }) : super(key: key);
  final String title;
  final List<Widget> children;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
      body: ListView(
        padding: padding ?? const EdgeInsets.symmetric(vertical: 16),
        children: children,
      ),
    );
  }
}

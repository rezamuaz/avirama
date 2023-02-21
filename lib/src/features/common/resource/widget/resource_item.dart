import 'package:flutter/material.dart';

class ResourceItem<ItemType> extends StatefulWidget {
  const ResourceItem({
    Key? key,
    required this.index,
    required this.item,
    required this.itemBuilder,
    this.separatorPadding,
    this.onTap,
  }) : super(key: key);

  final int index;
  final ItemType item;
  final Widget Function(ItemType, int) itemBuilder;
  final EdgeInsetsGeometry? separatorPadding;

  final Function(ItemType)? onTap;

  @override
  State<ResourceItem<ItemType>> createState() => _ResourceItemState<ItemType>();
}

class _ResourceItemState<ItemType> extends State<ResourceItem<ItemType>> {
  late ItemType item;

  @override
  void initState() {
    super.initState();
    item = widget.item;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.separatorPadding ?? EdgeInsets.zero,
      child: GestureDetector(
        onTap: () => widget.onTap?.call(item),
        child: widget.itemBuilder(item, widget.index),
      ),
    );
  }
}

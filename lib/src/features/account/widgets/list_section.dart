import 'package:absensi_app/src/config/constants/constants.dart';
import 'package:flutter/material.dart';

import '../../../theme/colors.dart';

class XListSection extends StatefulWidget {
  const XListSection({
    Key? key,
    required this.title,
    required this.children,
    this.alwaysOpen = false,
  }) : super(key: key);

  final String title;
  final List<XSectionItem> children;
  final bool alwaysOpen;

  @override
  State<XListSection> createState() => _XListSectionState();
}

class _XListSectionState extends State<XListSection> {
  bool isHidden = true;

  @override
  void initState() {
    super.initState();
    if (widget.alwaysOpen) {
      isHidden = false;
    }
  }

  void _toggle() => setState(() => isHidden = !isHidden);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Constants.kPaddingXS),
      child: InkWell(
        child: Container(
          color: XColors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Constants.kPaddingL,
              vertical: Constants.kPaddingM,
            ),
            child: Column(children: [
              InkWell(
                onTap: () => _toggle(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    if (!isHidden && !widget.alwaysOpen)
                      const Icon(
                        Icons.keyboard_arrow_up,
                        color: Colors.black54,
                      ),
                    if (isHidden && !widget.alwaysOpen)
                      const Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.black54,
                      ),
                  ],
                ),
              ),
              if (!isHidden || widget.alwaysOpen)
                Padding(
                  padding: const EdgeInsets.only(top: Constants.kPaddingXS),
                  child: Column(
                    children: widget.children,
                  ),
                ),
            ]),
          ),
        ),
      ),
    );
  }
}

class XSectionItem extends StatelessWidget {
  const XSectionItem({
    Key? key,
    required this.onTap,
    required this.icon,
    required this.label,
    this.description,
    this.padding,
  }) : super(key: key);

  final Function()? onTap;
  final IconData icon;
  final String label;
  final String? description;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: padding ?? EdgeInsets.zero,
        child: Column(
          children: [
            if (padding == null) const SizedBox(height: Constants.kPaddingL),
            Row(
              children: [
                Icon(
                  icon,
                  color: Colors.black54,
                ),
                const SizedBox(width: Constants.kPaddingS),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    if (description != null)
                      Text(
                        description!,
                        style: Theme.of(context).textTheme.bodyText2?.copyWith(
                              fontSize: Constants.kFontSizeS,
                              color: XColors.grey_80,
                            ),
                      ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

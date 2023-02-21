import 'package:absensi_app/src/config/constants/constants.dart';
import 'package:flutter/material.dart';

enum BuyFor { endUser, trader, gifting }

class XInputBuyForCustom extends StatefulWidget {
  const XInputBuyForCustom({
    Key? key,
    required this.initialBuyFor,
    this.onChanged,
  }) : super(key: key);

  final BuyFor? initialBuyFor;
  final Function(BuyFor)? onChanged;

  @override
  State<XInputBuyForCustom> createState() => _XInputBuyForCustomState();
}

class _XInputBuyForCustomState extends State<XInputBuyForCustom> {
  late BuyFor? _status;

  @override
  void initState() {
    super.initState();
    _status = widget.initialBuyFor;
  }

  void _onTap(BuyFor status) {
    setState(() {
      _status = status;
      widget.onChanged?.call(status);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Status Customer',
          style: Theme.of(context).textTheme.bodyText2,
        ),
        const SizedBox(height: Constants.kPaddingS),
        Row(
          children: [
            _item(
              label: "End User",
              status: BuyFor.endUser,
            ),
            const SizedBox(width: Constants.kPaddingS),
            _item(
              label: "Trader",
              status: BuyFor.trader,
            ),
            const SizedBox(width: Constants.kPaddingS),
            _item(
              label: "Gifting",
              status: BuyFor.gifting,
            ),
          ],
        ),
      ],
    );
  }

  Expanded _item({
    required String label,
    required BuyFor status,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: () => _onTap(status),
        child: Container(
          height: Theme.of(context).buttonTheme.height,
          padding: Theme.of(context).inputDecorationTheme.contentPadding,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Constants.kRadiusM),
            color: Theme.of(context).inputDecorationTheme.fillColor,
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  label,
                  style: Theme.of(context).inputDecorationTheme.labelStyle,
                ),
              ),
              if (_status == status)
                Icon(
                  Icons.check_rounded,
                  size: Constants.kPaddingL,
                  color: Theme.of(context).primaryColor,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

extension BuyForExtension on BuyFor? {
  String? string() {
    return this == BuyFor.endUser
        ? 'End User'
        : this == BuyFor.trader
            ? 'Trader'
            : this == BuyFor.gifting
                ? 'Gifting'
                : null;
  }

  String? stringInt() {
    return this == BuyFor.endUser
        ? '1'
        : this == BuyFor.trader
            ? '2'
            : this == BuyFor.gifting
                ? '3'
                : null;
  }
}

extension StringBuyForExtension on String {
  BuyFor toBuyFor() {
    return this == '1'
        ? BuyFor.endUser
        : this == '2'
            ? BuyFor.trader
            : BuyFor.gifting;
  }
}

import 'package:absensi_app/src/config/constants/constants.dart';
import 'package:flutter/material.dart';

enum CustomerStatus { newCustomer, loyal, swiching }

class XInputCustomerStatusCustom extends StatefulWidget {
  const XInputCustomerStatusCustom({
    Key? key,
    required this.initialCustomerStatus,
    this.onChanged,
  }) : super(key: key);

  final CustomerStatus? initialCustomerStatus;
  final Function(CustomerStatus)? onChanged;

  @override
  State<XInputCustomerStatusCustom> createState() =>
      _XInputCustomerStatusCustomState();
}

class _XInputCustomerStatusCustomState
    extends State<XInputCustomerStatusCustom> {
  late CustomerStatus? _status;

  @override
  void initState() {
    super.initState();
    _status = widget.initialCustomerStatus;
  }

  void _onTap(CustomerStatus status) {
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
              label: "New",
              status: CustomerStatus.newCustomer,
            ),
            const SizedBox(width: Constants.kPaddingS),
            _item(
              label: "Loyal",
              status: CustomerStatus.loyal,
            ),
            const SizedBox(width: Constants.kPaddingS),
            _item(
              label: "Swiching",
              status: CustomerStatus.swiching,
            ),
          ],
        ),
      ],
    );
  }

  Expanded _item({
    required String label,
    required CustomerStatus status,
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

extension CustomerStatusExtension on CustomerStatus? {
  String? string() {
    return this == CustomerStatus.newCustomer
        ? 'new'
        : this == CustomerStatus.loyal
            ? 'loyal'
            : this == CustomerStatus.swiching
                ? 'swiching'
                : null;
  }

  String? stringInt() {
    return this == CustomerStatus.newCustomer
        ? '1'
        : this == CustomerStatus.loyal
            ? '2'
            : this == CustomerStatus.swiching
                ? '3'
                : null;
  }
}

extension StringCustomerStatusExtension on String {
  CustomerStatus toCustomerStatus() {
    return this == '1'
        ? CustomerStatus.newCustomer
        : this == '2'
            ? CustomerStatus.loyal
            : CustomerStatus.swiching;
  }
}

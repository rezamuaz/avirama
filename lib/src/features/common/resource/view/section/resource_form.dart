import 'package:absensi_app/src/config/constants/constants.dart';
import 'package:absensi_app/src/core/api/error_response_message.dart';
import 'package:absensi_app/src/core/exception/arstate.dart';
import 'package:absensi_app/src/dialogs/flash_message_wrapper.dart';
import 'package:absensi_app/src/utils/dismiss_keyboard.dart';
import 'package:absensi_app/widgets/button/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../widgets/common/bottom_sheet.dart';
import '../../../../../localization/localization_utils.dart';
import '../../../../../router/coordinator.dart';
import '../../logic/resource_bloc.dart';

enum ResourceFormType { create, update }

class ResourceForm<ItemType, RequestType> extends StatefulWidget {
  const ResourceForm({
    Key? key,
    required this.fieldsBuilder,
    required this.onSubmit,
    required this.title,
    this.onStored,
    this.type = ResourceFormType.create,
  }) : super(key: key);

  final Function(ItemType)? onStored;
  final Function() onSubmit;
  final List<Widget> Function(ResourceState<ItemType>, ErrorResponseMessage?)
      fieldsBuilder;
  final ResourceFormType type;
  final String title;

  @override
  State<ResourceForm<ItemType, RequestType>> createState() =>
      _ResourceFormState<ItemType, RequestType>();
}

class _ResourceFormState<ItemType, RequestType>
    extends State<ResourceForm<ItemType, RequestType>> {
  ErrorResponseMessage? _error;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  void _blocListener(BuildContext context, ResourceState<ItemType> state) {
    state.whenOrNull(
      isError: (e) {
        e.maybeWhen(
          orElse: () => FlashMessage.error(context: context, error: e),
          unprocessableEntity: (m) => _error = m,
        );
      },
      stored: (v) => _onStored(v),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResourceBloc<ItemType, RequestType>,
        ResourceState<ItemType>>(
      listener: _blocListener,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Constants.kPaddingL,
            vertical: Constants.kPaddingL,
          ),
          child: Column(
            children: [
              _form(context, state),
              const SizedBox(height: Constants.kPaddingL * 2),
              _confirmButton(state),
            ],
          ),
        );
      },
    );
  }

  Form _form(BuildContext context, ResourceState<ItemType> state) {
    return Form(
      key: _formKey,
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: widget.fieldsBuilder(state, _error).length,
        separatorBuilder: (context, index) => const SizedBox(
          height: Constants.kPaddingM,
        ),
        itemBuilder: (context, index) {
          final field = widget.fieldsBuilder(state, _error).elementAt(index);
          return field;
        },
      ),
    );
  }

  Widget _confirmButton(ResourceState state) {
    double halfFullWidth = MediaQuery.of(context).size.width / 2;

    return Align(
      alignment: Alignment.centerRight,
      child: XButton(
        width: halfFullWidth > 150 ? 150 : halfFullWidth,
        onPressed: () => _onButtonConfirmPress(context),
        busy: state.maybeWhen(
          isLoading: () => true,
          orElse: () => false,
        ),
        title: S.text.common_save,
      ),
    );
  }

  void _onButtonConfirmPress(BuildContext context) {
    hideKeyboard(context);
    if (_formKey.currentState!.validate()) {
      _error = null;
      widget.onSubmit.call();
    }
  }

  Future<void> _onStored(ItemType data) async {
    widget.onStored?.call(data);

    final String message = widget.type == ResourceFormType.create
        ? S.text.common_successfully_added(widget.title)
        : S.text.common_successfully_updated(widget.title);

    _showSuccessDialog(message, data);
  }

  Future<void> _showSuccessDialog(String message, ItemType data) async {
    await XBottomSheet.show(
      StateWidget.success(
        message: message,
        buttonLabel: S.text.common_back,
        onButtonTap: () {
          XBottomSheet.hide();
        },
      ),
    );
    widget.onStored?.call(data);
    XCoordinator.pop(data);
  }
}

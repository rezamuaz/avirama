import 'package:absensi_app/src/config/constants/constants.dart';
import 'package:absensi_app/src/core/api/error_response_message.dart';
import 'package:absensi_app/src/utils/log_utils.dart';
import 'package:absensi_app/widgets/forms/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get_storage/get_storage.dart';
import 'package:absensi_app/src/core/exception/arstate.dart';

import '../../../../../widgets/forms/select_time.dart';
import '../../../../network/model/daily_report/daily_report.dart';
import '../../../common/resource/logic/resource_bloc.dart';
import '../../../common/resource/view/section/resource_form.dart';

class DailyReportForm extends StatefulWidget {
  const DailyReportForm({Key? key, this.onSuccess, this.initialData})
      : super(key: key);

  final Function(DailyReport)? onSuccess;
  final DailyReport? initialData;

  @override
  State<DailyReportForm> createState() => _DailyReportFormState();
}

class _DailyReportFormState extends State<DailyReportForm> {
  late ResourceBloc<DailyReport, DailyReportRequest> bloc;

  final _nameController = TextEditingController();
  final _nameValidator = ValidationBuilder().minLength(3).build();

  final _timeController = TextEditingController();
  final _timeValidator = ValidationBuilder().build();

  final _locationController = TextEditingController();
  final _locationValidator = ValidationBuilder().minLength(10).build();

  final _noteController = TextEditingController();
  final _noteValidator = ValidationBuilder().build();

  final GetStorage box = GetStorage();

  @override
  void initState() {
    super.initState();
    bloc = context.read<ResourceBloc<DailyReport, DailyReportRequest>>();

    _nameController.text = widget.initialData?.name ?? '';
    _timeController.text = widget.initialData?.time ?? '';
    _locationController.text = widget.initialData?.location ?? '';
    _noteController.text = widget.initialData?.note ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return ResourceForm<DailyReport, DailyReportRequest>(
      // TODO : title should be dynamic
      title: 'Laporan Pekerjaan',
      type: isNullOrEmpty(widget.initialData)
          ? ResourceFormType.create
          : ResourceFormType.update,
      fieldsBuilder: _fieldsBuilder,
      onSubmit: _onSubmit,
    );
  }

  List<Widget> _fieldsBuilder(
    ResourceState<DailyReport> state,
    ErrorResponseMessage? error,
  ) {
    return [
      XInputCustom(
        labelText: 'Nama',
        prefixIcon: Icons.person,
        controller: _nameController,
        errorText: error.message("name"),
        validator: _nameValidator,
        textInputAction: TextInputAction.next,
        readOnly: state.maybeWhen(
          isLoading: () => true,
          orElse: () => false,
        ),
      ),
      XInputCustom(
        labelText: 'Waktu',
        prefixIcon: Icons.access_time_filled_rounded,
        controller: _timeController,
        errorText: error.message("time"),
        validator: _timeValidator,
        readOnly: true,
        onTap: () => _selectTime(),
        suffixIcon: IconButton(
          onPressed: () => _selectTime(),
          icon: const Icon(
            Icons.arrow_forward_ios_rounded,
            size: Constants.kPaddingL,
          ),
        ),
      ),
      XInputCustom(
        labelText: 'Lokasi',
        prefixIcon: Icons.location_pin,
        controller: _locationController,
        errorText: error.message("location"),
        validator: _locationValidator,
        textInputAction: TextInputAction.next,
        readOnly: state.maybeWhen(
          isLoading: () => true,
          orElse: () => false,
        ),
      ),
      XInputCustom(
        labelText: 'Catatan',
        prefixIcon: Icons.edit,
        controller: _noteController,
        errorText: error.message("note"),
        validator: _noteValidator,
        textInputAction: TextInputAction.done,
        readOnly: state.maybeWhen(
          isLoading: () => true,
          orElse: () => false,
        ),
      ),
    ];
  }

  Future<void> _selectTime() async {
    final initial = isNullOrEmpty(_timeController.text)
        ? null
        : DateTime.parse("2022-01-01 ${_timeController.text}");

    selectTime(
      context,
      initialDateTime: initial,
      onPicked: (value) {
        _timeController.text = value;
      },
    );
  }

  void _onSubmit() {
    final requests = DailyReportRequest(
      name: _nameController.text,
      time: _timeController.text,
      location: _locationController.text,
      lang: "-",
      long: "-",
      note: _noteController.text,
    );

    if (widget.initialData != null) {
      bloc.add(ResourceEvent<DailyReportRequest>.update(
        widget.initialData!.id,
        requests,
      ));
    } else {
      bloc.add(ResourceEvent<DailyReportRequest>.store(requests));
    }
  }
}

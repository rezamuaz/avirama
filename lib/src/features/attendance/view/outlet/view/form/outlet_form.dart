import 'package:absensi_app/src/core/api/error_response_message.dart';
import 'package:absensi_app/src/theme/colors.dart';
import 'package:absensi_app/src/utils/log_utils.dart';
import 'package:absensi_app/widgets/forms/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validator/form_validator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:absensi_app/src/core/exception/arstate.dart';
import 'dart:async';
import '../../../../../../../widgets/forms/input_get_location.dart';
import '../../../../../../network/model/outlet/outlet.dart';
import '../../../../../common/resource/logic/resource_bloc.dart';
import '../../../../../common/resource/view/section/resource_form.dart';

class OutletForm extends StatefulWidget {
  const OutletForm({Key? key, this.onSuccess, this.initialData})
      : super(key: key);

  final Function(Outlet)? onSuccess;
  final Outlet? initialData;
  @override
  State<OutletForm> createState() => _OutletFormState();
}

class _OutletFormState extends State<OutletForm> {
  final Completer<GoogleMapController> controller = Completer();
  OutletRequest requestOutlet = const OutletRequest(
    lang: '',
    long: '',
    name: '',
    radius: '',
    address: '',
  );
  late ResourceBloc<Outlet, OutletRequest> bloc;

  final _nameController = TextEditingController();
  final _address = TextEditingController();
  final _nameValidator = ValidationBuilder().minLength(3).build();
  final _addressValidator = ValidationBuilder().minLength(3).build();

  @override
  void initState() {
    super.initState();
    bloc = context.read<ResourceBloc<Outlet, OutletRequest>>();
    _nameController.text = widget.initialData?.name ?? '';
    _address.text = widget.initialData?.address ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return ResourceForm<Outlet, OutletRequest>(
      title: 'Lokasi',
      type: isNullOrEmpty(widget.initialData)
          ? ResourceFormType.create
          : ResourceFormType.update,
      fieldsBuilder: _fieldsBuilder,
      onSubmit: _onSubmit,
    );
  }

  void _onLocationChanged(double? lat, double? lon, String? radius) {
    print('onLocationChanged $lat $lon $radius');
    requestOutlet = requestOutlet.copyWith(
      lang: lon!.toString(),
      long: lat!.toString(),
      radius: radius!.toString(),
    );
    print('onLocationChanged  $requestOutlet');
  }

  List<Widget> _fieldsBuilder(
    ResourceState<Outlet> state,
    ErrorResponseMessage? error,
  ) {
    return [
      InputGetLocation(
        initialData: widget.initialData,
        onLocationChanged: _onLocationChanged,
      ),
      const Text(
        "Nama Outlet",
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
      XInputCustom(
        prefixIcon: Icons.location_city,
        controller: _nameController,
        errorText: error.message("name"),
        validator: _nameValidator,
        textInputAction: TextInputAction.next,
        readOnly: state.maybeWhen(
          isLoading: () => true,
          orElse: () => false,
        ),
      ),
      const Text(
        "Address",
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
      Container(
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextFormField(
          controller: _address,
          keyboardType: TextInputType.multiline,
          minLines: 5,
          maxLines: null,
          validator: _addressValidator,
          decoration: InputDecoration(
            hintText: "Address",
            hintStyle: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: XAppColors.grey,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                color: XAppColors.grey,
              ),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          ),
          readOnly: state.maybeWhen(
            isLoading: () => true,
            orElse: () => false,
          ),
        ),
      ),
    ];
  }

  void _onSubmit() {
    print('submit OutletRequest :$OutletRequest');
    if (widget.initialData != null) {
      final request = OutletRequest(
        name: _nameController.text,
        address: _address.text,
        lang: widget.initialData!.lang,
        long: widget.initialData!.long,
        radius: widget.initialData!.radius!,
      );
      bloc.add(
        ResourceEvent<OutletRequest>.update(
          widget.initialData!.id,
          request,
        ),
      );
    } else {
      requestOutlet = requestOutlet.copyWith(
        name: _nameController.text,
        address: _address.text,
      );
      bloc.add(ResourceEvent<OutletRequest>.store(requestOutlet));
    }
  }
}

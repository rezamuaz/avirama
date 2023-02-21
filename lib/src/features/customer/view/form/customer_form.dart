import 'package:absensi_app/src/core/api/error_response_message.dart';
import 'package:absensi_app/src/utils/log_utils.dart';
import 'package:absensi_app/widgets/forms/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get_storage/get_storage.dart';
import 'package:absensi_app/src/core/exception/arstate.dart';

import '../../../../../widgets/forms/input_buy_for.dart';
import '../../../../../widgets/forms/input_customer_status.dart';
import '../../../../../widgets/forms/input_gender.dart';
import '../../../../network/model/customer/customer.dart';
import '../../../common/resource/logic/resource_bloc.dart';
import '../../../common/resource/view/section/resource_form.dart';

class CustomerForm extends StatefulWidget {
  const CustomerForm({Key? key, this.onSuccess, this.initialData})
      : super(key: key);

  final Function(Customer)? onSuccess;
  final Customer? initialData;

  @override
  State<CustomerForm> createState() => _CustomerFormState();
}

class _CustomerFormState extends State<CustomerForm> {
  late ResourceBloc<Customer, CustomerRequest> bloc;

  final _nameController = TextEditingController();
  final _nameValidator = ValidationBuilder().minLength(3).build();

  final _phoneNumberController = TextEditingController();
  final _phoneNumberValidator = ValidationBuilder().minLength(3).build();

  final _areaController = TextEditingController();
  final _areaValidator = ValidationBuilder().build();

  final _ageController = TextEditingController();
  final _ageValidator = ValidationBuilder().build();

  Gender? _gender = Gender.male;
  CustomerStatus? _status = CustomerStatus.newCustomer;
  BuyFor? _buyFor = BuyFor.endUser;

  final _productItemController = TextEditingController();
  final _productItemValidator = ValidationBuilder().build();

  final _merkController = TextEditingController();
  final _merkValidator = ValidationBuilder().build();

  final _sizeController = TextEditingController();
  final _sizeValidator = ValidationBuilder().build();

  final _buyVolController = TextEditingController();
  final _buyVolValidator = ValidationBuilder().build();

  final _priceBagController = TextEditingController();
  final _priceBagValidator = ValidationBuilder().build();

  final _noteController = TextEditingController();
  final _noteValidator = ValidationBuilder().build();

  final GetStorage box = GetStorage();

  @override
  void initState() {
    super.initState();
    bloc = context.read<ResourceBloc<Customer, CustomerRequest>>();

    _nameController.text = widget.initialData?.customerName ?? '';
    _phoneNumberController.text = widget.initialData?.phoneNumber ?? '';
    _areaController.text = widget.initialData?.area ?? '';
    _ageController.text = widget.initialData?.age ?? '';
    _gender = widget.initialData?.gender?.toGender();
    _status = widget.initialData?.status?.toCustomerStatus();
    _buyFor = widget.initialData?.buyFor?.toBuyFor();
    _productItemController.text = widget.initialData?.productItem ?? '';
    _merkController.text = widget.initialData?.merk ?? '';
    _sizeController.text = widget.initialData?.size ?? '';
    _buyVolController.text = widget.initialData?.buyVol ?? '';
    _priceBagController.text = widget.initialData?.priceBag ?? '';
    _noteController.text = widget.initialData?.note ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return ResourceForm<Customer, CustomerRequest>(
      // TODO : title should be dynamic
      title: 'Customer',
      type: isNullOrEmpty(widget.initialData)
          ? ResourceFormType.create
          : ResourceFormType.update,
      fieldsBuilder: _fieldsBuilder,
      onSubmit: _onSubmit,
    );
  }

  List<Widget> _fieldsBuilder(
    ResourceState<Customer> state,
    ErrorResponseMessage? error,
  ) {
    return [
      XInputCustom(
        labelText: 'Nama Customer',
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
        labelText: 'Nomor Whatsapp',
        prefixIcon: Icons.phone,
        controller: _phoneNumberController,
        errorText: error.message("no_wa"),
        validator: _phoneNumberValidator,
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.number,
        readOnly: state.maybeWhen(
          isLoading: () => true,
          orElse: () => false,
        ),
      ),
      XInputCustom(
        labelText: 'Area',
        prefixIcon: Icons.location_on,
        controller: _areaController,
        errorText: error.message("area"),
        validator: _areaValidator,
        textInputAction: TextInputAction.next,
        readOnly: state.maybeWhen(
          isLoading: () => true,
          orElse: () => false,
        ),
      ),
      XInputCustom(
        labelText: 'Age',
        prefixIcon: Icons.numbers_rounded,
        controller: _ageController,
        errorText: error.message("age"),
        validator: _ageValidator,
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.number,
        readOnly: state.maybeWhen(
          isLoading: () => true,
          orElse: () => false,
        ),
      ),
      XInputGenderCustom(
        initialGender: _gender,
        onChanged: (v) => _gender = v,
      ),
      XInputCustomerStatusCustom(
        initialCustomerStatus: _status,
        onChanged: (v) => _status = v,
      ),
      XInputBuyForCustom(
        initialBuyFor: _buyFor,
        onChanged: (v) => _buyFor = v,
      ),
      XInputCustom(
        labelText: 'Item Product',
        prefixIcon: Icons.discount_outlined,
        controller: _productItemController,
        errorText: error.message("item_product"),
        validator: _productItemValidator,
        textInputAction: TextInputAction.next,
        readOnly: state.maybeWhen(
          isLoading: () => true,
          orElse: () => false,
        ),
      ),
      XInputCustom(
        labelText: 'Merk',
        prefixIcon: Icons.discount_outlined,
        controller: _merkController,
        errorText: error.message("merk"),
        validator: _merkValidator,
        textInputAction: TextInputAction.next,
        readOnly: state.maybeWhen(
          isLoading: () => true,
          orElse: () => false,
        ),
      ),
      XInputCustom(
        labelText: 'Size',
        prefixIcon: Icons.numbers_rounded,
        controller: _sizeController,
        errorText: error.message("size"),
        validator: _sizeValidator,
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.number,
        readOnly: state.maybeWhen(
          isLoading: () => true,
          orElse: () => false,
        ),
      ),
      XInputCustom(
        labelText: 'Vol Buy (Bag)',
        prefixIcon: Icons.numbers_rounded,
        controller: _buyVolController,
        errorText: error.message("vol_buy"),
        validator: _buyVolValidator,
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.number,
        readOnly: state.maybeWhen(
          isLoading: () => true,
          orElse: () => false,
        ),
      ),
      XInputCustom(
        labelText: 'Price Bag',
        prefixIcon: Icons.numbers_rounded,
        controller: _priceBagController,
        errorText: error.message("price_bag"),
        validator: _priceBagValidator,
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.number,
        readOnly: state.maybeWhen(
          isLoading: () => true,
          orElse: () => false,
        ),
      ),
      XInputCustom(
        labelText: 'Notes',
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

  void _onSubmit() {
    final requests = CustomerRequest(
      customerName: _nameController.text,
      phoneNumber: _phoneNumberController.text,
      area: _areaController.text,
      age: _ageController.text,
      gender: _gender.stringInt(),
      status: _status.stringInt(),
      buyFor: _buyFor.stringInt(),
      productItem: _productItemController.text,
      merk: _merkController.text,
      size: _sizeController.text,
      buyVol: _buyVolController.text,
      priceBag: _priceBagController.text,
      note: _noteController.text,
    );

    if (widget.initialData != null) {
      bloc.add(ResourceEvent<CustomerRequest>.update(
        widget.initialData!.id,
        requests,
      ));
    } else {
      bloc.add(ResourceEvent<CustomerRequest>.store(requests));
    }
  }
}

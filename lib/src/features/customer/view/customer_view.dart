import 'package:absensi_app/src/core/api/state_wrapper_argument.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../widgets/common/back_button.dart';
import '../../../network/data/resource/resource_repository.dart';
import '../../../network/domain_manager.dart';
import '../../../network/model/customer/customer.dart';
import '../../auth/logic/auth_bloc.dart';
import '../../common/resource/view/resource_view.dart';
import '../widget/customer_item.dart';
import '../widget/customer_item_shimmer.dart';
import 'form/customer_form.dart';

class CustomerView extends StatefulWidget {
  const CustomerView({Key? key}) : super(key: key);

  @override
  State<CustomerView> createState() => _CustomerViewState();
}

class _CustomerViewState extends State<CustomerView> {
  late ResourceRepository<Customer> _repository;
  final _pagingController = PagingController<int, Customer>(
    firstPageKey: 1,
  );

  @override
  void initState() {
    super.initState();
    _repository = GetIt.I<DomainManager>().customerRepository;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const XBackButton(),
        title: Text(
          'Customer',
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          state.whenOrNull(loggedIn: (_) {
            _pagingController.refresh();
          });
        },
        child: ResourceView<Customer, CustomerRequest>(
          title: 'Customer',
          repository: _repository,
          pagingController: _pagingController,
          primaryKey: (v) => v.id,
          firstPageProgressIndicatorBuilder: _progressIndicatorBuilder,
          noItemsFoundIndicatorBuilder: _noItemsFoundIndicatorBuilder(),
          itemBuilder: (item, _) => XCustomerItem(data: item),
          formBuilder: (Customer? item) => CustomerForm(
            initialData: item,
          ),
          withAppBar: false,
        ),
      ),
    );
  }

  Widget _progressIndicatorBuilder(_) => const XCustomerItemShimmer();

  StateWrapperArgument _noItemsFoundIndicatorBuilder() {
    return const StateWrapperArgument(
      title: "Data Customer Kosong",
      description:
          "Kamu tidak memiliki customer saat ini. Silahkan buat customer baru dengan menekan tombol dibawah ini.",
      // icon: XPreloadLottieAsset(
      //   lottiePath: Assets.lotties.schedule,
      // ),
    );
  }
}

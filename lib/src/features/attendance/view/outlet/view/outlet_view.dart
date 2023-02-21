import 'package:absensi_app/src/core/api/state_wrapper_argument.dart';
import 'package:absensi_app/src/network/model/outlet/outlet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../../../widgets/common/back_button.dart';
import '../../../../../network/data/resource/resource_repository.dart';
import '../../../../../network/domain_manager.dart';
import '../../../../auth/logic/auth_bloc.dart';
import '../../../../common/resource/view/resource_view.dart';
import '../widget/outlet_item.dart';
import '../widget/outlet_item_shimmer.dart';
import 'form/outlet_form.dart';

class OutletView extends StatefulWidget {
  const OutletView({super.key});

  @override
  State<OutletView> createState() => _OutletViewState();
}

class _OutletViewState extends State<OutletView> {
  late ResourceRepository<Outlet> _repository;
  final _pagingController = PagingController<int, Outlet>(firstPageKey: 1);

  @override
  void initState() {
    super.initState();
    _repository = GetIt.I<DomainManager>().outletRepository;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const XBackButton(),
        title: Text(
          'Daftar Lokasi',
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          state.whenOrNull(loggedIn: (_) {
            _pagingController.refresh();
          });
        },
        child: ResourceView<Outlet, OutletRequest>(
          title: 'Outlet',
          repository: _repository,
          pagingController: _pagingController,
          primaryKey: (v) => v.id,
          firstPageProgressIndicatorBuilder: _progressIndicatorBuilder,
          noItemsFoundIndicatorBuilder: _noItemsFoundIndicatorBuilder(),
          itemBuilder: (item, _) => XOutletItem(data: item),
          formBuilder: (Outlet? item) => OutletForm(
            initialData: item,
          ),
          withAppBar: false,
          withDeleteButton: false,
        ),
      ),
    );
  }

  Widget _progressIndicatorBuilder(_) => const XOutletItemShimmer();

  StateWrapperArgument _noItemsFoundIndicatorBuilder() {
    return const StateWrapperArgument(
      title: "Data Outlet Kosong",
      description:
          "Kamu tidak memiliki Data Outlet saat ini. Silahkan buat Outlet baru dengan menekan tombol dibawah ini.",
    );
  }
}

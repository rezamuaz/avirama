import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../../network/data/resource/resource_repository.dart';
import '../../../../../network/domain_manager.dart';
import '../../../../../network/model/outlet/outlet.dart';

class OutletLocationView extends StatefulWidget {
  const OutletLocationView({super.key});

  @override
  State<OutletLocationView> createState() => _OutletLocationViewState();
}

class _OutletLocationViewState extends State<OutletLocationView> {
  late ResourceRepository<Outlet> _repository;
  final _pagingController = PagingController<int, Outlet>(
    firstPageKey: 1,
  );

  @override
  void initState() {
    super.initState();
    _repository = GetIt.I<DomainManager>().outletRepository;
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('OutletLocationView'),
      ),
    );
  }
}

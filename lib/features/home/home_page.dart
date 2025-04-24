import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_tcc/common/view_layout_manager.dart';
import 'package:todo_app_tcc/features/home/home_view_model.dart';
import 'package:todo_app_tcc/features/home/view/home_page_mobile.dart';

import '../../common/enum/device_type.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<HomeViewModel>(context, listen: false);
    return ViewLayoutManager<HomeViewModel>(
      pages: {DeviceType.mobileVertical: (model) => HomePageMobile(viewModel: vm)},
      viewModel: vm,
    );
  }
}

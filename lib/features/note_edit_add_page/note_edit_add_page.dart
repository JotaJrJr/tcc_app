import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common/enum/device_type.dart';
import '../../common/view_layout_manager.dart';
import 'note_edit_add_view_model.dart';
import 'view/note_edit_add_page_mobile.dart';

class NoteEditAddPage extends StatelessWidget {
  const NoteEditAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<NoteEditAddViewModel>(context, listen: true);

    return ViewLayoutManager<NoteEditAddViewModel>(
      viewModel: vm,
      pages: {DeviceType.mobileVertical: (_) => NoteEditAddPageMobile(vm: vm)},
    );
  }
}

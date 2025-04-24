import 'package:flutter/material.dart';
import 'package:todo_app_tcc/features/note_edit_add_page/note_edit_add_view_model.dart';

class NoteEditAddPageMobile extends StatelessWidget {
  final NoteEditAddViewModel vm;
  const NoteEditAddPageMobile({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(vm.isEditMode ? 'Editar Nota' : 'Nova Nota')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: vm.titleController, decoration: const InputDecoration(labelText: 'Título')),
            const SizedBox(height: 16),
            TextField(
              controller: vm.contentController,
              decoration: const InputDecoration(labelText: 'Conteúdo'),
              maxLines: 5,
            ),
            const Spacer(),
            ValueListenableBuilder<String?>(
              valueListenable: vm.error,
              builder:
                  (_, err, __) => err != null ? Text(err, style: const TextStyle(color: Colors.red)) : const SizedBox(),
            ),
            const SizedBox(height: 8),
            ValueListenableBuilder<bool>(
              valueListenable: vm.isSaving,
              builder:
                  (_, saving, __) =>
                      saving
                          ? const CircularProgressIndicator()
                          : ElevatedButton(
                            onPressed: () {
                              vm.save();
                              Navigator.pop(context);
                            },
                            child: const Text('Salvar'),
                          ),
            ),
          ],
        ),
      ),
    );
  }
}

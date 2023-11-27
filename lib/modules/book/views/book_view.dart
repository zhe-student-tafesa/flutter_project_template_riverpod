import 'package:flutter/material.dart';
import 'package:flutter_project_template_riverpod/modules/book/controllers/book_controller.dart';
import 'package:flutter_project_template_riverpod/modules/book/controllers/book_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookPage extends ConsumerStatefulWidget {
  const BookPage({super.key});

  @override
  _BookPageState createState() => _BookPageState();
}

class _BookPageState extends ConsumerState<BookPage> {
  @override
  Widget build(BuildContext context) {
    ref.listen(bookControllerProvider, (_, state) async {
      debugPrint('book page $state');
      if (state is RefreshBookDataState) {
        debugPrint('refresh data');
      }
    });

    return const Center(
      child: Text('Book'),
    );
  }
}

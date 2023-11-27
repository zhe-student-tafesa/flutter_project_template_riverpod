import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'book_state.dart';

final bookControllerProvider =
    StateNotifierProvider<BookController, BookState>((ref) {
  return BookController(ref);
});

class BookController extends StateNotifier<BookState> {
  final Ref ref;

  BookController(
    this.ref,
  ) : super(const BookDefaultState());

  void refreshBookPage() {
    state = const RefreshBookDataState();
  }

  void setToDefaultState() {
    state = const BookDefaultState();
  }
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(LoadedState()) {
    on<CategoryEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

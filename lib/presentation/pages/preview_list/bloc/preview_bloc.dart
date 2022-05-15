import 'package:flutter_bloc/flutter_bloc.dart';

import 'preview_bloc_event.dart';
import 'preview_bloc_state.dart';

export 'package:flutter_bloc/flutter_bloc.dart';

export 'preview_bloc_event.dart';
export 'preview_bloc_state.dart';

class PreviewPageBloc extends Bloc<PreviewPEvent, PreviewPState> {
  PreviewPageBloc() : super(const PreviewPState()) {
    on<ReplaceViewEvent>(_replacingView);
  }

  int get index {
    return state.tabIndex ?? 0;
  }

  void _replacingView(ReplaceViewEvent event, Emitter<PreviewPState> emit) {
    emit(state.copyWith(tabIndex: event.changedTab));
  }
}

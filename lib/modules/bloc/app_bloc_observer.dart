import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/logs/custom_log.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    Log.logBlocObserver('onCreate', bloc);
    super.onCreate(bloc);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    Log.logBlocObserver('onChange', change);
    super.onChange(bloc, change);
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    Log.logBlocObserver('onEvent', event);
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    Log.logBlocObserver('onTransition', transition);
    super.onTransition(bloc, transition);
  }

  @override
  void onClose(BlocBase bloc) {
    Log.logBlocObserver('onClose', bloc);
    super.onClose(bloc);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    Log.logBlocObserver('onError', 'Bloc: $bloc, Error: $error');
    super.onError(bloc, error, stackTrace);
  }
}

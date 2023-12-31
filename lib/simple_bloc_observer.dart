

import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocOpserver implements BlocObserver{
  @override
  void onChange(BlocBase bloc, Change change) {
    debugPrint('change =========$change');
  }

  @override
  void onClose(BlocBase bloc) {
    debugPrint('bloc =========$bloc');
  }

  @override
  void onCreate(BlocBase bloc) {
    debugPrint('bloc =========$bloc');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    // TODO: implement onError
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    debugPrint('event =========$event');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    debugPrint('transition =========$transition');
  }
}
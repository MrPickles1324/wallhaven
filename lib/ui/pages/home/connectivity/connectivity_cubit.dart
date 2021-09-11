import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';

part 'connectivity_state.dart';

class ConnectivityCubit extends Cubit<ConnectivityState> {
  ConnectivityCubit() : super(InternetUnvalable()) {
    Connectivity().onConnectivityChanged.listen(_handleConnectivityChange);
  }

  void _handleConnectivityChange(ConnectivityResult connection) {
    if (connection == ConnectivityResult.mobile ||
        connection == ConnectivityResult.wifi) {
      emit(InternetAvailable());
    } else {
      emit(InternetUnvalable());
    }
  }
}

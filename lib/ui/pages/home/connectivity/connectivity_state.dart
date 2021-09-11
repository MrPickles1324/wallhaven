part of 'connectivity_cubit.dart';

@immutable
abstract class ConnectivityState {}

class InternetUnvalable extends ConnectivityState {}

class InternetAvailable extends ConnectivityState {}

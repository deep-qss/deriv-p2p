import 'package:flutter/cupertino.dart';
import 'package:flutter_deriv_api/api/p2p/p2p_advert/p2p_advert.dart';

/// advert state
@immutable
abstract class AdvertState {
  ///Initializer
  const AdvertState();
}

/// When state is loading before the Loaded
class AdvertLoadingState extends AdvertState {
  ///Initializer
  AdvertLoadingState({this.isLoading = false});

  ///message initialize
  bool isLoading;
}

///  when Advert list  loaded
class AdvertLoadedState extends AdvertState {
  ///Initializer
  AdvertLoadedState({this.list, this.isMore});

  /// for more list of advert
  bool? isMore;

  ///list pf element initialize
  List<P2PAdvert?>? list;
}

/// advert error state for throw error
class AdvertErrorState extends AdvertState {
  ///Initializer
  AdvertErrorState({this.message});

  ///message initialize
  String? message;
}

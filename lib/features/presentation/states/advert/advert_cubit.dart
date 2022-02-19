import 'package:bloc/bloc.dart';
import 'package:flutter_deriv_api/api/account/authorize/authorize.dart';
import 'package:flutter_deriv_api/api/common/ping/ping.dart';
import 'package:flutter_deriv_api/api/p2p/p2p_advert/exceptions/p2p_advert_exception.dart';
import 'package:flutter_deriv_api/api/p2p/p2p_advert/p2p_advert.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';

import 'advert_state.dart';

/// advert cubit for fetch list and manage the state for advert

class AdvertCubit extends Cubit<AdvertState> {
  ///Initializer
  AdvertCubit() : super(AdvertLoadingState());

  /// limit  for pagination
  int limit = 3;

  /// offset for pagination
  int offset = 0;

  /// fetch list of advert
  Future<List<P2PAdvert?>?> _fetchAdvertList() async {
    await Ping.ping();

    await Authorize.authorize(
      const AuthorizeRequest(
        authorize: '4sAJ03ozOmfFFU6',
      ),
    );
    return P2PAdvert.fetchAdvertList(
      P2pAdvertListRequest(
        counterpartyType: 'buy',
        limit: limit,
        offset: offset,
      ),
    );
  }

  ///load the list of advert list
  Future<void> loadAdvertList() async {
    try {
      final List<P2PAdvert?>? advertList = await _fetchAdvertList();
      emit(AdvertLoadedState(list: advertList, isMore: true));
    } on P2PAdvertException catch (error) {
      emit(
        AdvertErrorState(
          message: error.toString(),
        ),
      );
    }
  }

  /// for pagination to load advert list
  Future<void> loadMore() async {
    final AdvertLoadedState thisState = state as AdvertLoadedState;

    bool paginate = true;

    if (thisState.isMore == true) {
      offset = offset + limit;
      final List<P2PAdvert?>? list = await P2PAdvert.fetchAdvertList(
        P2pAdvertListRequest(
          counterpartyType: 'buy',
          limit: limit,
          offset: offset,
        ),
      );
      if ((list?.length ?? 0) < limit) {
        paginate = false;
      }
      thisState.list?.addAll(list ?? <P2PAdvert?>[]);
      emit(AdvertLoadedState(list: thisState.list, isMore: paginate));
    }
  }

  /// for sorting the list by rate and date
  Future<void> sorting(String? sort) async {
    bool hasMore = true;
    final AdvertLoadedState thisState = state as AdvertLoadedState;
    if (state is AdvertLoadedState) {
      if (sort == 'rate') {
        emit(AdvertLoadingState(isLoading: true));
        hasMore = true;

        thisState.list = await P2PAdvert.fetchAdvertList(
          const P2pAdvertListRequest(
            counterpartyType: 'buy',
            sortBy: 'rate',
            offset: 0,
          ),
        );
        emit(AdvertLoadingState());
        emit(AdvertLoadedState(list: thisState.list, isMore: hasMore));
      } else if (sort == 'completion') {
        emit(AdvertLoadingState(isLoading: true));
        hasMore = true;
        thisState.list = await P2PAdvert.fetchAdvertList(
          const P2pAdvertListRequest(
              counterpartyType: 'buy', sortBy: 'completion', offset: 0),
        );
        hasMore = false;
        emit(AdvertLoadingState());
        emit(AdvertLoadedState(list: thisState.list, isMore: hasMore));
      } else {
        return;
      }
    }
  }

  /// filter the list by transactionType[   SELL or  BUY ]

  Future<void> filterList(String? transactionType) async {
    bool hasMore = true;
    final AdvertLoadedState thisState = state as AdvertLoadedState;
    if (state is AdvertLoadedState) {
      if (transactionType == 'sell') {
        emit(AdvertLoadingState(isLoading: true));
        hasMore = true;

        thisState.list = await P2PAdvert.fetchAdvertList(
          P2pAdvertListRequest(
            counterpartyType: transactionType,
            offset: 0,
          ),
        );
        emit(AdvertLoadingState());
        emit(AdvertLoadedState(list: thisState.list, isMore: hasMore));
      } else {
        emit(AdvertLoadingState(isLoading: true));
        hasMore = true;

        thisState.list = await P2PAdvert.fetchAdvertList(
          P2pAdvertListRequest(
            counterpartyType: transactionType,
            offset: 0,
          ),
        );
        emit(AdvertLoadingState());
        emit(AdvertLoadedState(list: thisState.list, isMore: hasMore));
      }
    }
  }
}

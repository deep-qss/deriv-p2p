import 'package:deriv_p2p/features/presentation/states/advert/advert_cubit.dart';
import 'package:deriv_p2p/features/presentation/states/advert/advert_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

///  widget for listing the advert list

class AdvertList extends StatefulWidget {
  @override
  State<AdvertList> createState() => _AdvertListState();
}

class _AdvertListState extends State<AdvertList> {
  @override
  Widget build(BuildContext context) {
    final AdvertCubit cubit = context.read<AdvertCubit>();
    return BlocBuilder<AdvertCubit, AdvertState>(
      builder: (BuildContext context, AdvertState state) {
        switch (state.runtimeType) {
          case AdvertLoadedState:
            final AdvertLoadedState thisState = state as AdvertLoadedState;

            final int totalAdverts = thisState.list?.length ?? 0;
            return ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: totalAdverts + 1,
              itemBuilder: (BuildContext context, int index) {
                if (index < totalAdverts) {
                  return Card(
                    elevation: 8,
                    margin: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          thisState.list?[index]?.country?.toUpperCase() ?? '',
                        ),
                        Text(thisState.list?[index]?.price.toString() ?? ''),
                        Text(
                          thisState.list?[index]?.advertiserDetails?.name!
                                  .toUpperCase() ??
                              '',
                        ),
                        Text(
                          thisState.list?[index]?.counterpartyType?.index
                                  .toString() ??
                              '',
                        ),
                        Text(
                          'Description: ${thisState.list?[index]?.description}',
                        ),
                        Text(
                          thisState.list?[index]?.counterpartyType.toString() ??
                              '',
                        ),
                        Text(
                          thisState.list?[index]?.createdTime?.toString() ?? '',
                        ),
                      ],
                    ),
                  );
                } else if (thisState.isMore ?? false) {
                  cubit.loadMore();
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return const SizedBox.shrink();
                }
              },
            );
          case AdvertLoadingState:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case AdvertErrorState:
            return const Center(
              child: Text('Error Occurred'),
            );
          default:
            Container();
        }
        return Container();
      },
    );
  }
}

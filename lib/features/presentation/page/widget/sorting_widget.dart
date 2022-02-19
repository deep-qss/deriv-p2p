import 'package:deriv_p2p/features/presentation/states/advert/advert_cubit.dart';
import 'package:deriv_p2p/features/presentation/states/advert/advert_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// sorting the advert list
class SortingList extends StatelessWidget {
  ///initializer
  SortingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AdvertCubit advertCubit = context.read<AdvertCubit>();
    return Card(
      margin: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: Row(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'Sort By:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            BlocConsumer<AdvertCubit, AdvertState>(
              listener: (BuildContext context, AdvertState state) {},
              builder: (BuildContext context, AdvertState state) {
                switch (state.runtimeType) {
                  case AdvertLoadedState:
                    return TextButton(
                      onPressed: () {
                        advertCubit.sorting('rate');
                      },
                      child: const Text(
                        'Price',
                        style: TextStyle(color: Colors.blue),
                      ),
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.grey.shade300),
                      ),
                    );
                  case AdvertLoadingState:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  case AdvertErrorState:
                    return const Center(
                      child: Text('Error Occurred'),
                    );
                }
                return const SizedBox.shrink();
              },
            ),
            const SizedBox(
              width: 10,
            ),
            BlocBuilder<AdvertCubit, AdvertState>(
              builder: (BuildContext context, AdvertState state) {
                switch (state.runtimeType) {
                  case AdvertLoadedState:
                    return TextButton(
                      onPressed: () {
                        advertCubit.sorting('completion');
                      },
                      child: const Text('Date',
                          style: TextStyle(color: Colors.blue)),
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15))),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.grey.shade300)),
                    );
                  case AdvertLoadingState:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  case AdvertErrorState:
                    return const Center(
                      child: Text('Error Occurred'),
                    );
                }
                return const SizedBox.shrink();
              },
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'Filter By:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            BlocConsumer<AdvertCubit, AdvertState>(
              listener: (BuildContext context, AdvertState state) {},
              builder: (BuildContext context, AdvertState state) {
                switch (state.runtimeType) {
                  case AdvertLoadedState:
                    return TextButton(
                      onPressed: () {
                        advertCubit.filterList('sell');
                      },
                      child: const Text(
                        'Sell',
                        style: TextStyle(color: Colors.blue),
                      ),
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.grey.shade300),
                      ),
                    );
                  case AdvertLoadingState:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  case AdvertErrorState:
                    return const Center(
                      child: Text('Error Occurred'),
                    );
                }
                return const SizedBox.shrink();
              },
            ),
            const SizedBox(
              width: 10,
            ),
            BlocConsumer<AdvertCubit, AdvertState>(
              listener: (BuildContext context, AdvertState state) {},
              builder: (BuildContext context, AdvertState state) {
                switch (state.runtimeType) {
                  case AdvertLoadedState:
                    return TextButton(
                      onPressed: () {
                        advertCubit.filterList('buy');
                      },
                      child: const Text(
                        'Buy',
                        style: TextStyle(color: Colors.blue),
                      ),
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.grey.shade300),
                      ),
                    );
                  case AdvertLoadingState:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  case AdvertErrorState:
                    return const Center(
                      child: Text('Error Occurred'),
                    );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}

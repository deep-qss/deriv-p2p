import 'package:deriv_p2p/features/presentation/page/widget/advert_list.dart';
import 'package:deriv_p2p/features/presentation/page/widget/sorting_widget.dart';
import 'package:deriv_p2p/features/presentation/states/advert/advert_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// home page for listing the advert list
class HomePage extends StatefulWidget {
  /// Initializer
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late AdvertCubit advertCubit;

  bool isLoading = false;

  @override
  void initState() {
    advertCubit = AdvertCubit()..loadAdvertList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Advert List'),
        ),
        body: BlocProvider<AdvertCubit>.value(
          value: advertCubit,
          child: Column(
            children: <Widget>[
              SortingList(),
              Expanded(child: AdvertList()),
            ],
          ),
        ),
      );
}

import 'package:deriv_p2p/features/presentation/page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_deriv_api/api/account/authorize/authorize.dart';
import 'package:flutter_deriv_api/api/common/ping/ping.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/binary_api.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/connection_information.dart';
import 'package:flutter_deriv_api/state/connection/connection_cubit.dart'
    as conn_cubit;

///Deriv Go P2P

class DerivGoP2p extends StatefulWidget {
  /// Initializer
  const DerivGoP2p({Key? key}) : super(key: key);

  @override
  _DerivGoP2pState createState() => _DerivGoP2pState();
}

class _DerivGoP2pState extends State<DerivGoP2p> {
  late conn_cubit.ConnectionCubit connectionCubit;

  final BinaryAPI api = BinaryAPI(UniqueKey());
  Ping ping = Ping();

  late PingResponse pingResponse;

  Future<void> fetchResponse() async {
    await Ping.ping();

    await Authorize.authorize(
      const AuthorizeRequest(
        authorize: '4sAJ03ozOmfFFU6',
      ),
    );
  }

  @override
  void initState() {
    final ConnectionInformation connectionInfo = ConnectionInformation(
      appId: '1089',
      brand: 'deriv',
      endpoint: 'frontend.binaryws.com',
    );
    connectionCubit = conn_cubit.ConnectionCubit(connectionInfo);

    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: BlocProvider<conn_cubit.ConnectionCubit>.value(
          value: connectionCubit,
          child: BlocConsumer<conn_cubit.ConnectionCubit,
              conn_cubit.ConnectionState>(
            listener: (BuildContext context, conn_cubit.ConnectionState state) {
              if (state is conn_cubit.ConnectionConnectedState) {
                fetchResponse();
              }
            },
            builder: (BuildContext context, conn_cubit.ConnectionState state) {
              switch (state.runtimeType) {
                case conn_cubit.ConnectionConnectingState:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case conn_cubit.ConnectionConnectedState:
                  return const HomePage();
                case conn_cubit.ConnectionErrorState:
                  return const ScaffoldMessenger(
                    child: SnackBar(
                      content: Center(
                        child: Text('Error Occurred'),
                      ),
                    ),
                  );

                default:
                  Container();
              }
              return Container();
            },
          ),
        ),
      );
}

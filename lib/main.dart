import 'package:deriv_p2p/deriv-go_p2p.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

///  Application starting class
class MyApp extends StatelessWidget {
  /// Initializer
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Deriv Go P2P',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const DerivGoP2p(),
      );
}

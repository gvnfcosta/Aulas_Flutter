import 'package:flutter/material.dart';
import 'package:flutter_sqlite/database/change_notifier/change_notifier_page.dart';
import 'package:flutter_sqlite/database/change_notifier/provider_controller.dart';
import 'package:flutter_sqlite/database/provider/provider_page.dart';
import 'package:flutter_sqlite/database/provider/user_model.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) => UserModel(
              name: 'Gigio',
              imgAvatar:
                  'https://cms-imgp.jw-cdn.org/img/p/1011229/univ/art/1011229_univ_sqr_lg.jpg',
              birthDate: '13/09/1970'),
        ),
        ChangeNotifierProvider(
          create: (_) => ProviderController(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
          useMaterial3: true,
        ),
        routes: {
          '/provider': (_) => const ProviderPage(),
          '/change': (_) => const ChangeNotifierPage(),
        },
        home: Builder(
          builder: (context) {
            return Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () =>
                          Navigator.of(context).pushNamed('/provider'),
                      child: const Text('Provider'),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () =>
                          Navigator.of(context).pushNamed('/change'),
                      child: const Text('Change Notifier'),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

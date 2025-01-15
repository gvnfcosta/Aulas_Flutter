import 'package:flutter/material.dart';
import 'package:flutter_sqlite/database/change_notifier/provider_controller.dart';
import 'package:provider/provider.dart';

class ChangeNotifierPage extends StatefulWidget {
  const ChangeNotifierPage({super.key});

  @override
  State<ChangeNotifierPage> createState() => _ChangeNotifierPageState();
}

class _ChangeNotifierPageState extends State<ChangeNotifierPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        await Future.delayed(const Duration(seconds: 3));
        if (mounted) context.read<ProviderController>().alterarDados();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // var controller = context.watch<ProviderController>();
    debugPrint('BUILD PAGE ChangeNotifier');
    return Scaffold(
      appBar: AppBar(title: const Text('Change Notifier')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<ProviderController>(
              builder: (_, controller, __) {
                debugPrint('BUILD controller.avatar');
                return CircleAvatar(
                    radius: 100,
                    backgroundImage: NetworkImage(controller.imgAvatar));
              },
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Consumer<ProviderController>(
                  builder: (_, controller, __) {
                    debugPrint('BUILD controller.name');
                    return Text(controller.name);
                  },
                ),
                Consumer<ProviderController>(
                  builder: (_, controller, __) {
                    debugPrint('BUILD controller.birthDate');
                    return Text('(${controller.birthDate})');
                  },
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () => context.read<ProviderController>().alterarNome(),
              child: const Text('Alterar Nome'),
            ),
          ],
        ),
      ),
    );
  }
}

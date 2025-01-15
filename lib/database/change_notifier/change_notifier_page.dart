import 'package:flutter/material.dart';
import 'package:flutter_sqlite/database/change_notifier/provider_controller.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

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
            Selector<ProviderController, String>(
              selector: (_, controller) => controller.imgAvatar,
              builder: (_, imgAvatar, __) {
                debugPrint('BUILD controller.avatar');
                return CircleAvatar(
                    radius: 100, backgroundImage: NetworkImage(imgAvatar));
              },
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Selector<ProviderController, String>(
                  selector: (_, controller) => controller.name,
                  builder: (_, name, __) {
                    debugPrint('BUILD controller.name');
                    return Text(name);
                  },
                ),
                Selector<ProviderController, String>(
                  selector: (_, controller) => controller.birthDate,
                  builder: (_, birthDate, __) {
                    debugPrint('BUILD controller.birthDate');
                    return Text('($birthDate)');
                  },
                ),
              ],
            ),
            Selector<ProviderController, Tuple2<String, String>>(
              selector: (_, controller) =>
                  Tuple2(controller.birthDate, controller.name),
              builder: (_, tuple, __) {
                debugPrint('BUILD controller.birthDate');
                return Text('(${tuple.item1} - ${tuple.item2})');
              },
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

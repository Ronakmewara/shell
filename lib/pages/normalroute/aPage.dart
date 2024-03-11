import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class APage extends StatefulWidget {
  const APage({super.key});

  @override
  State<APage> createState() => _APageState();
}

class _APageState extends State<APage> {
  static const delayInSeconds = 5;


  @override
  void initState() {

    super.initState();
    _doComplexOperation();
  }

  Future<void> _doComplexOperation() async {
    final activeTransaction = Sentry.getSpan();
    final childSpan = activeTransaction?.startChild('complex operation',
        description: 'running a $delayInSeconds seconds operation');
    await Future.delayed(const Duration(seconds: delayInSeconds));
    childSpan?.finish();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:  IconButton(
          icon: const Icon(Icons.arrow_back_ios_new), onPressed: () {
            context.go('/normalRoute');
        },
        ),
      ) ,
      body: const Center(child: Text('This is A Page', style: TextStyle(fontSize: 30),)) ,
    );
  }
}

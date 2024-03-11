import 'package:flutter/material.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
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
    return const Scaffold(
      body: Center(child: Text('This is Settings Page', style: TextStyle(fontSize: 30),)) ,
    );
  }
}

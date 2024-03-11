import 'package:flutter/material.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
      body: Center(child: Text('This is Profile Page', style: TextStyle(fontSize: 30),)) ,
    );
  }
}

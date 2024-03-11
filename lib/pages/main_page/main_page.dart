import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              context.go('/normalRoute');
            }, child: const Center(child: Text('Normal Route'))),
            ElevatedButton(onPressed: (){
              context.go('/home');
            }, child: const Center(child: Text('Shell Route'))),  ElevatedButton(onPressed: (){
             throw StateError('This is Error');
            }, child: const Center(child: Text('Sentry Test'))),
          ],
        ),
      ),
    );
  }
}

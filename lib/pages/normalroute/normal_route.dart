import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NormalRoute extends StatelessWidget {
  const NormalRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading:  IconButton(
          icon: const Icon(Icons.arrow_back_ios_new), onPressed: () {
          context.go('/');
        },
        ),
      ) ,
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(onPressed:(){
            context.push('/pageA');
          }, child: const Text("A")),
          const SizedBox(height: 20,),
          ElevatedButton(onPressed:(){
            context.push('/pageB');
          }, child: const Text("B")),
          const SizedBox(height: 20,),
          ElevatedButton(onPressed:(){
            context.push('/pageC');
          }, child: const Text("C")),

        ],
      )) ,
    );
  }
}

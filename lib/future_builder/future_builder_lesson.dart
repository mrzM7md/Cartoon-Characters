import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FutureBuilderLesson extends StatelessWidget {
  const FutureBuilderLesson({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("FutureBuilder Lesson"),),
      body: FutureBuilder(
        initialData: "Initial data",
        builder: (ctx, snapshot) {
          if(snapshot.connectionState == ConnectionState.done){
            if(snapshot.hasData){
              int data = snapshot.data as int;
              return Center(
                child: Text("Your number is: $data"),
              );
            }
            else if(snapshot.hasError){
              String error = snapshot.error as String;
              return Center(
                child: Text("Error: $error"),
              );
            }
          }
            return const Center(
            child: CircularProgressIndicator(),
          );
        },
        future: getData(),
      ),
    );
  }

  Future<int> getData () => Future<int>.delayed(
    const Duration(seconds: 4), () => 2 // throw ("Error has been")
  );

}
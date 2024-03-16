import 'package:flutter/material.dart';
import 'package:my_subjects_lessons_2/api/signup.dart';
import 'package:my_subjects_lessons_2/bloc/counter/view.dart';
import 'package:my_subjects_lessons_2/bloc_api/presentation/screens/characters_screen.dart';
import 'package:my_subjects_lessons_2/db/sql_example_1.dart';
import 'package:my_subjects_lessons_2/future_builder/future_builder_lesson.dart';
import 'package:my_subjects_lessons_2/routes.dart';

void main() {
  runApp(MyApp(appRouter: AppRouter()));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({super.key, required this.appRouter});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}

class MainWidget extends StatelessWidget {
  const MainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Backend Lessons"),),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsetsDirectional.all(15.0),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsetsDirectional.only(bottom: 5),
              child: MaterialButton(
                  minWidth: double.infinity,
                  color: Colors.blueAccent,
                  child: const Text("Future Builder", style: TextStyle(color: Colors.white),),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const FutureBuilderLesson()));
                  }
              ),
            ),
            Container(
              margin: const EdgeInsetsDirectional.only(bottom: 5),
              child: MaterialButton(
                  minWidth: double.infinity,
                  color: Colors.blueAccent,
                  child: const Text("SQLite", style: TextStyle(color: Colors.white),),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SqlExample_1()));
                  }
              ),
            ),

            Container(
              margin: const EdgeInsetsDirectional.only(bottom: 5),
              child: MaterialButton(
                  minWidth: double.infinity,
                  color: Colors.blueAccent,
                  child: const Text("Signup api", style: TextStyle(color: Colors.white),),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Signpage()));
                  }
              ),
            ),


            Container(
              margin: const EdgeInsetsDirectional.only(bottom: 5),
              child: MaterialButton(
                  minWidth: double.infinity,
                  color: Colors.blueAccent,
                  child: const Text("Learn Bloc", style: TextStyle(color: Colors.white),),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CounterPage()));
                  }
              ),
            ),

            Container(
              margin: const EdgeInsetsDirectional.only(bottom: 5),
              child: MaterialButton(
                  minWidth: double.infinity,
                  color: Colors.blueAccent,
                  child: const Text("Bloc Api (Dio)", style: TextStyle(color: Colors.white),),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const CharactersScreen()));
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}


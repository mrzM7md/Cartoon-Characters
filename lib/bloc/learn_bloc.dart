import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_subjects_lessons_2/bloc/counter/bloc.dart';
import 'package:my_subjects_lessons_2/bloc/counter/event.dart';
import 'package:my_subjects_lessons_2/bloc/counter/state.dart';

class LearnBloc extends StatelessWidget {
  const LearnBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Learn Bloc"),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsetsDirectional.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state){
                int counter = 0;
                if(state is CounterValueChangedState){
                  counter = state.counter;
                }
                return Text("Counter: $counter");
                },
            ),
            Row(
              children: [
                MaterialButton(
                    color: Colors.blue,
                    onPressed: (){
                      BlocProvider.of<CounterBloc>(context).add(IncrementEvent());
                    },
                    child: const Text("Add", style: TextStyle(color: Colors.white),)
                ),
                const Spacer(),
                MaterialButton(
                    color: Colors.blue,
                    onPressed: (){
                      context.read<CounterBloc>().add(DecrementEvent());
                      // BlocProvider.of<CounterBloc>(context).add(DecrementEvent());
                    },
                    child: const Text("Sub", style: TextStyle(color: Colors.white),)
                ),
                const Spacer(),
                MaterialButton(
                    color: Colors.blue,
                    onPressed: (){
                      BlocProvider.of<CounterBloc>(context).add(ResetEvent());
                    },
                    child: const Text("Reset", style: TextStyle(color: Colors.white),)
                ),
              ],
            ) ,
          ],
        ),
      ),
    );
  }
}

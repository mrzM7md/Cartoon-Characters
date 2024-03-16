import 'package:bloc/bloc.dart';

import 'event.dart';
import 'state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int counter = 0;
  CounterBloc() : super(CounterInitialState() /* Initial state */ ){
   on<CounterEvent>((event, emit){
     if(event is IncrementEvent){
       ++counter;
       emit(CounterValueChangedState(counter: counter));
     }
     else if(event is DecrementEvent){
       --counter;
       emit(CounterValueChangedState(counter: counter));
     }
     else {
       counter = 0;
       emit(CounterValueChangedState(counter: counter));
     }
   });
  }
}

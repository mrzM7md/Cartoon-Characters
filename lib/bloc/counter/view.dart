import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_subjects_lessons_2/bloc/learn_bloc.dart';

import 'bloc.dart';
import 'event.dart';

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CounterBloc()..add(InitEvent()),
      child: Builder(builder: (context) => LearnBloc()),
    );
  }

}


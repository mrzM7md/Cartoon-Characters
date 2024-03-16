import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_subjects_lessons_2/bloc_api/data/models/characters.dart';
import 'package:my_subjects_lessons_2/bloc_api/presentation/screens/characters_details.dart';
import 'package:my_subjects_lessons_2/bloc_api/presentation/screens/characters_screen.dart';

import 'bloc_api/business_logic/cubit/cubit.dart';
import 'bloc_api/data/repository/characters_repository.dart';
import 'bloc_api/data/web_services/characters_web_services.dart';
import 'constants/strings.dart';

class AppRouter {
  late CharactersRepository charactersRepository;
  late CharactersCubit charactersCubit;

  AppRouter() {
    charactersRepository = CharactersRepository(CharactersWebServices());
    charactersCubit = CharactersCubit(charactersRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext contxt) => charactersCubit,
            child: CharactersScreen(),
          ),
        );

      case charactersDetailsScreen:
        final character = settings.arguments as Character;

        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) =>
                CharactersCubit(charactersRepository),
            child: CharactersDetailsScreen(
              character: character,
            ),
          ),
        );
    }
  }
}
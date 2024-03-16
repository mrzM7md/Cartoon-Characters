import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:my_subjects_lessons_2/bloc_api/business_logic/cubit/cubit.dart';
import 'package:my_subjects_lessons_2/bloc_api/business_logic/cubit/state.dart';
import 'package:my_subjects_lessons_2/bloc_api/data/models/characters.dart' as models;
import 'package:my_subjects_lessons_2/bloc_api/presentation/widgets/character_item.dart';
import 'package:my_subjects_lessons_2/constants/my_colors.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late List<models.Character> allCharacters;
  late List<models.Character> searchFoeCharacters;

  bool _isSearching = false;
  final TextEditingController _searchTextController = TextEditingController();

  Widget _buildSearchField() {
    return TextField(
      controller: _searchTextController,
      cursorColor: MyColors.myGray,
      decoration: const InputDecoration(
        hintText: 'Find a characters',
        border: InputBorder.none,
        hintStyle: TextStyle(color: MyColors.myGray, fontSize: 18),
      ),
      style: const TextStyle(color: MyColors.myGray, fontSize: 18),
      onChanged: (searchedCharacter) {
        addSearchedForItemsToSearchedList(searchedCharacter);
      },
    );
  }

  void addSearchedForItemsToSearchedList(String searchedCharacter) {
    searchFoeCharacters = allCharacters
        .where((character) => character.name
            .toLowerCase()
            .contains(searchedCharacter.toLowerCase()))
        .toList();
    setState(() {});
  }

  List<Widget> _buildAppBarActions() {
    if (_isSearching) {
      return [
        IconButton(
            onPressed: () {
              _clearSearch();
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.clear,
              color: MyColors.myGray,
            )),
      ];
    } else {
      return [
        IconButton(
          onPressed: _startSearching,
          icon: const Icon(
            Icons.search,
            color: MyColors.myGray,
          ),
        ),
      ];
    }
  }

  void _startSearching() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));
    _isSearching = true;
    setState(() {});
  }

  void _stopSearching() {
    _clearSearch();

    setState(() {
      _isSearching = false;
    });
  }

  void _clearSearch() {
    setState(() {
      _searchTextController.clear();
    });
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharactersCubit>(context).getAllCharacters(); // wakeup
  }

  Widget buildBlocWidget() {
    return BlocBuilder<CharactersCubit, CharacterState>(
        builder: (context, state) {
      if (state is CharactersLoaded) {
        allCharacters = state.characters;
        return buildLoadedListWidgets();
      }
      return showLoadingIndicator();
    });
  }

  Widget showLoadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(
        color: MyColors.myGray,
      ),
    );
  }

  Widget buildLoadedListWidgets() {
    return SingleChildScrollView(
      child: Container(
        color: MyColors.myGray,
        child: Column(
          children: [
            buildCharactersList(),
          ],
        ),
      ),
    );
  }

  Widget buildCharactersList() {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
        ),
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: _searchTextController.text.isEmpty
            ? allCharacters.length
            : searchFoeCharacters.length,
        itemBuilder: (context, index) {
          return CharacterItem(
              character: _searchTextController.text.isEmpty
                  ? allCharacters[index]
                  : searchFoeCharacters[index]);
        });
  }

  Widget _buildAppBarTitle() {
    return const Text('Characters', style: TextStyle(color: MyColors.myGray));
  }

  Widget buildNoInternetWidget(){
    return Center(
        child: Container(
          color: MyColors.myWhite,
          child: Column(
            children: [
              const SizedBox(height: 20,),
              const Text('Check Your Connection', style: TextStyle(fontSize: 22, color: MyColors.myGray),),
              Image.asset('assets/images/no_internet.png')
            ],
          ),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: _isSearching
            ? const BackButton(
                color: MyColors.myGray,
              )
            : Container(),
        backgroundColor: MyColors.myYellow,
        title: _isSearching ? _buildSearchField() : _buildAppBarTitle(),
        actions: _buildAppBarActions(),
      ),
      body: OfflineBuilder(
          connectivityBuilder: (
              BuildContext context,
              ConnectivityResult connectivity,
              Widget child) {
        final bool connected = connectivity != ConnectivityResult.none;
        if (connected) {
          return buildBlocWidget();
        } else {
          return buildNoInternetWidget();
        }
      },
      child: showLoadingIndicator()),
    );
  }
}

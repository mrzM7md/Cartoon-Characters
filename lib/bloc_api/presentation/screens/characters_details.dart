import 'package:flutter/material.dart';
import 'package:my_subjects_lessons_2/bloc_api/data/models/characters.dart';
import 'package:my_subjects_lessons_2/constants/my_colors.dart';

class CharactersDetailsScreen extends StatelessWidget {
  final Character character;

  const CharactersDetailsScreen({required this.character, super.key});

  Widget buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: MyColors.myGray,
      flexibleSpace: FlexibleSpaceBar(
        // centerTitle: true,
        title: Text(
          character.name,
          style: const TextStyle(color: MyColors.myWhite),
          // textAlign: TextAlign.start,
        ),
        background: Hero(
          tag: character.charId,
          child: Image.network(
            character.image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget characterInfo(String title, String value) {
    return RichText(
      maxLines: 1,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
            children: [
              TextSpan(
                text: title,
                style: const TextStyle(
                  color: MyColors.myWhite,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              TextSpan(
                  text: value,
                  style: const TextStyle(
                    color: MyColors.myWhite,
                    fontSize: 16,
                  )
              )
            ]
        )
    );
  }
  Widget buildDivider(double endIntent){
    return Divider(
      height: 30,
      endIndent: endIntent,
      color: MyColors.myYellow,
      thickness: 2,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myGray,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: const EdgeInsetsDirectional.fromSTEB(14, 14, 14, 0),
                  padding: const EdgeInsetsDirectional.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      characterInfo('Species: ', character.species),
                      buildDivider(300),
                      characterInfo('First Showing: ', character.createdAt),
                      buildDivider(250),
                      characterInfo('Type: ', character.type),
                      buildDivider(320),
                      const SizedBox(height: 60,),
                    ],
                  ),
                ),
                const SizedBox(height: 360,)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

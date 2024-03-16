import 'package:flutter/material.dart';
import 'package:my_subjects_lessons_2/bloc_api/data/models/characters.dart' as models;
import 'package:my_subjects_lessons_2/constants/my_colors.dart';
import 'package:my_subjects_lessons_2/constants/strings.dart';

class CharacterItem extends StatelessWidget {

  final models.Character character;

  const CharacterItem({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(8, 9, 8, 8),
      padding: const EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: MyColors.myWhite,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, charactersDetailsScreen, arguments: character),
        child: GridTile(
          footer: Container(
            width: double.infinity,
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 15, vertical: 10),
            color: Colors.black45,
            alignment: Alignment.bottomCenter,
            child: Text(character.name,
            style: const TextStyle(
              height: 1.3,
              fontSize: 16,
              color: MyColors.myWhite,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
          child: Hero(
            tag: character.charId,
            child: Container(
              color: MyColors.myGray,
              child: character.image.isNotEmpty ?
                FadeInImage.assetNetwork(
                    width: double.infinity,
                    height: double.infinity,
                    placeholder: "assets/images/loading.gif",
                    image: character.image,
                fit: BoxFit.cover,)
                : Image.asset("assets/images/loading.gif"),
            ),
          ),
        ),
      ),
    );
  }
}

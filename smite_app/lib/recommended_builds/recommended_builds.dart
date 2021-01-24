import "package:smite_app/globals.dart" as globals;
import "package:smite_app/classes/Build.dart";
import "package:smite_app/classes/Item.dart";

var items = globals.itemsRes;

var RecommendedBuilds = <String, Set<Build>> {
  "Achilles": <Build>{
    Build(
      "Damage",
      <Item>{
        items["Bloodforge"],
        items["Warrior Tabi"],
        items["Ninja Tabi"],
        items["Sovereignty"],
        items["Heartseeker"],
        items["Berserker's Shield"],
        items["Breastplate of Valor"],
      }
    ),
    Build(
      "Bruiser",
      <Item>{
        items["Bloodforge"],
        items["Warrior Tabi"],
        items["Ninja Tabi"],
        items["Sovereignty"],
        items["Heartseeker"],
        items["Berserker's Shield"],
        items["Breastplate of Valor"],
      }
    )
  },

  "Ares": <Build>{
    Build(
      "Defen.. I mean Damage",
      <Item>{
        items["Bloodforge"],
        items["Warrior Tabi"],
        items["Ninja Tabi"],
        items["Sovereignty"],
        items["Heartseeker"],
        items["Berserker's Shield"],
        items["Breastplate of Valor"],
      }
    ),
    Build(
      "Bruiser",
      <Item>{
        items["Bloodforge"],
        items["Warrior Tabi"],
        items["Ninja Tabi"],
        items["Sovereignty"],
        items["Heartseeker"],
        items["Berserker's Shield"],
        items["Breastplate of Valor"],
      }
    )
  },


};
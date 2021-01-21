import "package:smite_app/globals.dart" as globals;
import "package:flutter/material.dart";
import "package:smite_app/classes/Build.dart";
import "package:smite_app/classes/Item.dart";

var items = globals.itemsRes;

var RecommendedBuilds = <String, Set<Build>> {
  "Achilles": <Build>{
    Build(
      "Damage",
      <Item>{
        items.get("Bloodforge"),
        items.get("Warrior Tabi"),
        items.get("Ninja Tabi"),
        items.get("Sovereignty"),
        items.get("Heartseeker"),
        items.get("Berserker's Shield"),
        items.get("Breastplate of Valor"),
      }
    ),
    Build(
      "Bruiser",
      <Item>{
        items.get("Bloodforge"),
        items.get("Warrior Tabi"),
        items.get("Ninja Tabi"),
        items.get("Sovereignty"),
        items.get("Heartseeker"),
        items.get("Berserker's Shield"),
        items.get("Breastplate of Valor"),
      }
    )
  },

  "Ares": <Build>{
    Build(
      "Defen.. I mean Damage",
      <Item>{
        items.get("Bloodforge"),
        items.get("Warrior Tabi"),
        items.get("Ninja Tabi"),
        items.get("Sovereignty"),
        items.get("Heartseeker"),
        items.get("Berserker's Shield"),
        items.get("Breastplate of Valor"),
      }
    ),
    Build(
      "Bruiser",
      <Item>{
        items.get("Bloodforge"),
        items.get("Warrior Tabi"),
        items.get("Ninja Tabi"),
        items.get("Sovereignty"),
        items.get("Heartseeker"),
        items.get("Berserker's Shield"),
        items.get("Breastplate of Valor"),
      }
    )
  },


};
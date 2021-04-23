// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemons.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonEvolutions _$PokemonEvolutionsFromJson(Map<String, dynamic> json) {
  return PokemonEvolutions(
    json['prevo'] as String?,
    (json['evos'] as List<dynamic>?)?.map((e) => e as String).toList(),
    json['evoType'] as String?,
    json['evoCondition'] as String?,
    json['evoLevel'] as int?,
    json['evoItem'] as String?,
    json['evoMove'] as String?,
  );
}

Map<String, dynamic> _$PokemonEvolutionsToJson(PokemonEvolutions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('prevo', instance.prevo);
  writeNotNull('evos', instance.evos);
  writeNotNull('evoType', instance.evoType);
  writeNotNull('evoCondition', instance.evoCondition);
  writeNotNull('evoLevel', instance.evoLevel);
  writeNotNull('evoItem', instance.evoItem);
  writeNotNull('evoMove', instance.evoMove);
  return val;
}

PokemonAbilities _$PokemonAbilitiesFromJson(Map<String, dynamic> json) {
  return PokemonAbilities(
    json['0'] as String,
    json['1'] as String?,
    json['H'] as String?,
    json['S'] as String?,
  );
}

Map<String, dynamic> _$PokemonAbilitiesToJson(PokemonAbilities instance) {
  final val = <String, dynamic>{
    '0': instance.first,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('1', instance.second);
  writeNotNull('H', instance.hidden);
  writeNotNull('S', instance.special);
  return val;
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemons.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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

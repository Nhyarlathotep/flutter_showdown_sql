// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Pokemon extends DataClass implements Insertable<Pokemon> {
  final int id;
  final String name;
  final String nameId;
  final int hp;
  final int atk;
  final int def;
  final int spa;
  final int spd;
  final int spe;
  final int bst;
  final double height;
  final double weight;
  final List<String> types;
  final PokemonAbilities abilities;
  final PokemonEvolutions evolution;
  final PokemonFormes formes;
  final String tier;
  Pokemon(
      {required this.id,
      required this.name,
      required this.nameId,
      required this.hp,
      required this.atk,
      required this.def,
      required this.spa,
      required this.spd,
      required this.spe,
      required this.bst,
      required this.height,
      required this.weight,
      required this.types,
      required this.abilities,
      required this.evolution,
      required this.formes,
      required this.tier});
  factory Pokemon.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final doubleType = db.typeSystem.forDartType<double>();
    return Pokemon(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      nameId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}name_id'])!,
      hp: intType.mapFromDatabaseResponse(data['${effectivePrefix}hp'])!,
      atk: intType.mapFromDatabaseResponse(data['${effectivePrefix}atk'])!,
      def: intType.mapFromDatabaseResponse(data['${effectivePrefix}def'])!,
      spa: intType.mapFromDatabaseResponse(data['${effectivePrefix}spa'])!,
      spd: intType.mapFromDatabaseResponse(data['${effectivePrefix}spd'])!,
      spe: intType.mapFromDatabaseResponse(data['${effectivePrefix}spe'])!,
      bst: intType.mapFromDatabaseResponse(data['${effectivePrefix}bst'])!,
      height:
          doubleType.mapFromDatabaseResponse(data['${effectivePrefix}height'])!,
      weight:
          doubleType.mapFromDatabaseResponse(data['${effectivePrefix}weight'])!,
      types: $PokemonsTable.$converter0.mapToDart(
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}types']))!,
      abilities: $PokemonsTable.$converter1.mapToDart(stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}abilities']))!,
      evolution: $PokemonsTable.$converter2.mapToDart(stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}evolution']))!,
      formes: $PokemonsTable.$converter3.mapToDart(stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}formes']))!,
      tier: stringType.mapFromDatabaseResponse(data['${effectivePrefix}tier'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['name_id'] = Variable<String>(nameId);
    map['hp'] = Variable<int>(hp);
    map['atk'] = Variable<int>(atk);
    map['def'] = Variable<int>(def);
    map['spa'] = Variable<int>(spa);
    map['spd'] = Variable<int>(spd);
    map['spe'] = Variable<int>(spe);
    map['bst'] = Variable<int>(bst);
    map['height'] = Variable<double>(height);
    map['weight'] = Variable<double>(weight);
    {
      final converter = $PokemonsTable.$converter0;
      map['types'] = Variable<String>(converter.mapToSql(types)!);
    }
    {
      final converter = $PokemonsTable.$converter1;
      map['abilities'] = Variable<String>(converter.mapToSql(abilities)!);
    }
    {
      final converter = $PokemonsTable.$converter2;
      map['evolution'] = Variable<String>(converter.mapToSql(evolution)!);
    }
    {
      final converter = $PokemonsTable.$converter3;
      map['formes'] = Variable<String>(converter.mapToSql(formes)!);
    }
    map['tier'] = Variable<String>(tier);
    return map;
  }

  PokemonsCompanion toCompanion(bool nullToAbsent) {
    return PokemonsCompanion(
      id: Value(id),
      name: Value(name),
      nameId: Value(nameId),
      hp: Value(hp),
      atk: Value(atk),
      def: Value(def),
      spa: Value(spa),
      spd: Value(spd),
      spe: Value(spe),
      bst: Value(bst),
      height: Value(height),
      weight: Value(weight),
      types: Value(types),
      abilities: Value(abilities),
      evolution: Value(evolution),
      formes: Value(formes),
      tier: Value(tier),
    );
  }

  factory Pokemon.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Pokemon(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      nameId: serializer.fromJson<String>(json['nameId']),
      hp: serializer.fromJson<int>(json['hp']),
      atk: serializer.fromJson<int>(json['atk']),
      def: serializer.fromJson<int>(json['def']),
      spa: serializer.fromJson<int>(json['spa']),
      spd: serializer.fromJson<int>(json['spd']),
      spe: serializer.fromJson<int>(json['spe']),
      bst: serializer.fromJson<int>(json['bst']),
      height: serializer.fromJson<double>(json['height']),
      weight: serializer.fromJson<double>(json['weight']),
      types: serializer.fromJson<List<String>>(json['types']),
      abilities: serializer.fromJson<PokemonAbilities>(json['abilities']),
      evolution: serializer.fromJson<PokemonEvolutions>(json['evolution']),
      formes: serializer.fromJson<PokemonFormes>(json['formes']),
      tier: serializer.fromJson<String>(json['tier']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'nameId': serializer.toJson<String>(nameId),
      'hp': serializer.toJson<int>(hp),
      'atk': serializer.toJson<int>(atk),
      'def': serializer.toJson<int>(def),
      'spa': serializer.toJson<int>(spa),
      'spd': serializer.toJson<int>(spd),
      'spe': serializer.toJson<int>(spe),
      'bst': serializer.toJson<int>(bst),
      'height': serializer.toJson<double>(height),
      'weight': serializer.toJson<double>(weight),
      'types': serializer.toJson<List<String>>(types),
      'abilities': serializer.toJson<PokemonAbilities>(abilities),
      'evolution': serializer.toJson<PokemonEvolutions>(evolution),
      'formes': serializer.toJson<PokemonFormes>(formes),
      'tier': serializer.toJson<String>(tier),
    };
  }

  Pokemon copyWith(
          {int? id,
          String? name,
          String? nameId,
          int? hp,
          int? atk,
          int? def,
          int? spa,
          int? spd,
          int? spe,
          int? bst,
          double? height,
          double? weight,
          List<String>? types,
          PokemonAbilities? abilities,
          PokemonEvolutions? evolution,
          PokemonFormes? formes,
          String? tier}) =>
      Pokemon(
        id: id ?? this.id,
        name: name ?? this.name,
        nameId: nameId ?? this.nameId,
        hp: hp ?? this.hp,
        atk: atk ?? this.atk,
        def: def ?? this.def,
        spa: spa ?? this.spa,
        spd: spd ?? this.spd,
        spe: spe ?? this.spe,
        bst: bst ?? this.bst,
        height: height ?? this.height,
        weight: weight ?? this.weight,
        types: types ?? this.types,
        abilities: abilities ?? this.abilities,
        evolution: evolution ?? this.evolution,
        formes: formes ?? this.formes,
        tier: tier ?? this.tier,
      );
  @override
  String toString() {
    return (StringBuffer('Pokemon(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('nameId: $nameId, ')
          ..write('hp: $hp, ')
          ..write('atk: $atk, ')
          ..write('def: $def, ')
          ..write('spa: $spa, ')
          ..write('spd: $spd, ')
          ..write('spe: $spe, ')
          ..write('bst: $bst, ')
          ..write('height: $height, ')
          ..write('weight: $weight, ')
          ..write('types: $types, ')
          ..write('abilities: $abilities, ')
          ..write('evolution: $evolution, ')
          ..write('formes: $formes, ')
          ..write('tier: $tier')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          name.hashCode,
          $mrjc(
              nameId.hashCode,
              $mrjc(
                  hp.hashCode,
                  $mrjc(
                      atk.hashCode,
                      $mrjc(
                          def.hashCode,
                          $mrjc(
                              spa.hashCode,
                              $mrjc(
                                  spd.hashCode,
                                  $mrjc(
                                      spe.hashCode,
                                      $mrjc(
                                          bst.hashCode,
                                          $mrjc(
                                              height.hashCode,
                                              $mrjc(
                                                  weight.hashCode,
                                                  $mrjc(
                                                      types.hashCode,
                                                      $mrjc(
                                                          abilities.hashCode,
                                                          $mrjc(
                                                              evolution
                                                                  .hashCode,
                                                              $mrjc(
                                                                  formes
                                                                      .hashCode,
                                                                  tier.hashCode)))))))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Pokemon &&
          other.id == this.id &&
          other.name == this.name &&
          other.nameId == this.nameId &&
          other.hp == this.hp &&
          other.atk == this.atk &&
          other.def == this.def &&
          other.spa == this.spa &&
          other.spd == this.spd &&
          other.spe == this.spe &&
          other.bst == this.bst &&
          other.height == this.height &&
          other.weight == this.weight &&
          other.types == this.types &&
          other.abilities == this.abilities &&
          other.evolution == this.evolution &&
          other.formes == this.formes &&
          other.tier == this.tier);
}

class PokemonsCompanion extends UpdateCompanion<Pokemon> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> nameId;
  final Value<int> hp;
  final Value<int> atk;
  final Value<int> def;
  final Value<int> spa;
  final Value<int> spd;
  final Value<int> spe;
  final Value<int> bst;
  final Value<double> height;
  final Value<double> weight;
  final Value<List<String>> types;
  final Value<PokemonAbilities> abilities;
  final Value<PokemonEvolutions> evolution;
  final Value<PokemonFormes> formes;
  final Value<String> tier;
  const PokemonsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.nameId = const Value.absent(),
    this.hp = const Value.absent(),
    this.atk = const Value.absent(),
    this.def = const Value.absent(),
    this.spa = const Value.absent(),
    this.spd = const Value.absent(),
    this.spe = const Value.absent(),
    this.bst = const Value.absent(),
    this.height = const Value.absent(),
    this.weight = const Value.absent(),
    this.types = const Value.absent(),
    this.abilities = const Value.absent(),
    this.evolution = const Value.absent(),
    this.formes = const Value.absent(),
    this.tier = const Value.absent(),
  });
  PokemonsCompanion.insert({
    required int id,
    required String name,
    required String nameId,
    required int hp,
    required int atk,
    required int def,
    required int spa,
    required int spd,
    required int spe,
    required int bst,
    required double height,
    required double weight,
    required List<String> types,
    required PokemonAbilities abilities,
    required PokemonEvolutions evolution,
    required PokemonFormes formes,
    required String tier,
  })   : id = Value(id),
        name = Value(name),
        nameId = Value(nameId),
        hp = Value(hp),
        atk = Value(atk),
        def = Value(def),
        spa = Value(spa),
        spd = Value(spd),
        spe = Value(spe),
        bst = Value(bst),
        height = Value(height),
        weight = Value(weight),
        types = Value(types),
        abilities = Value(abilities),
        evolution = Value(evolution),
        formes = Value(formes),
        tier = Value(tier);
  static Insertable<Pokemon> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? nameId,
    Expression<int>? hp,
    Expression<int>? atk,
    Expression<int>? def,
    Expression<int>? spa,
    Expression<int>? spd,
    Expression<int>? spe,
    Expression<int>? bst,
    Expression<double>? height,
    Expression<double>? weight,
    Expression<List<String>>? types,
    Expression<PokemonAbilities>? abilities,
    Expression<PokemonEvolutions>? evolution,
    Expression<PokemonFormes>? formes,
    Expression<String>? tier,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (nameId != null) 'name_id': nameId,
      if (hp != null) 'hp': hp,
      if (atk != null) 'atk': atk,
      if (def != null) 'def': def,
      if (spa != null) 'spa': spa,
      if (spd != null) 'spd': spd,
      if (spe != null) 'spe': spe,
      if (bst != null) 'bst': bst,
      if (height != null) 'height': height,
      if (weight != null) 'weight': weight,
      if (types != null) 'types': types,
      if (abilities != null) 'abilities': abilities,
      if (evolution != null) 'evolution': evolution,
      if (formes != null) 'formes': formes,
      if (tier != null) 'tier': tier,
    });
  }

  PokemonsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? nameId,
      Value<int>? hp,
      Value<int>? atk,
      Value<int>? def,
      Value<int>? spa,
      Value<int>? spd,
      Value<int>? spe,
      Value<int>? bst,
      Value<double>? height,
      Value<double>? weight,
      Value<List<String>>? types,
      Value<PokemonAbilities>? abilities,
      Value<PokemonEvolutions>? evolution,
      Value<PokemonFormes>? formes,
      Value<String>? tier}) {
    return PokemonsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      nameId: nameId ?? this.nameId,
      hp: hp ?? this.hp,
      atk: atk ?? this.atk,
      def: def ?? this.def,
      spa: spa ?? this.spa,
      spd: spd ?? this.spd,
      spe: spe ?? this.spe,
      bst: bst ?? this.bst,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      types: types ?? this.types,
      abilities: abilities ?? this.abilities,
      evolution: evolution ?? this.evolution,
      formes: formes ?? this.formes,
      tier: tier ?? this.tier,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (nameId.present) {
      map['name_id'] = Variable<String>(nameId.value);
    }
    if (hp.present) {
      map['hp'] = Variable<int>(hp.value);
    }
    if (atk.present) {
      map['atk'] = Variable<int>(atk.value);
    }
    if (def.present) {
      map['def'] = Variable<int>(def.value);
    }
    if (spa.present) {
      map['spa'] = Variable<int>(spa.value);
    }
    if (spd.present) {
      map['spd'] = Variable<int>(spd.value);
    }
    if (spe.present) {
      map['spe'] = Variable<int>(spe.value);
    }
    if (bst.present) {
      map['bst'] = Variable<int>(bst.value);
    }
    if (height.present) {
      map['height'] = Variable<double>(height.value);
    }
    if (weight.present) {
      map['weight'] = Variable<double>(weight.value);
    }
    if (types.present) {
      final converter = $PokemonsTable.$converter0;
      map['types'] = Variable<String>(converter.mapToSql(types.value)!);
    }
    if (abilities.present) {
      final converter = $PokemonsTable.$converter1;
      map['abilities'] = Variable<String>(converter.mapToSql(abilities.value)!);
    }
    if (evolution.present) {
      final converter = $PokemonsTable.$converter2;
      map['evolution'] = Variable<String>(converter.mapToSql(evolution.value)!);
    }
    if (formes.present) {
      final converter = $PokemonsTable.$converter3;
      map['formes'] = Variable<String>(converter.mapToSql(formes.value)!);
    }
    if (tier.present) {
      map['tier'] = Variable<String>(tier.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PokemonsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('nameId: $nameId, ')
          ..write('hp: $hp, ')
          ..write('atk: $atk, ')
          ..write('def: $def, ')
          ..write('spa: $spa, ')
          ..write('spd: $spd, ')
          ..write('spe: $spe, ')
          ..write('bst: $bst, ')
          ..write('height: $height, ')
          ..write('weight: $weight, ')
          ..write('types: $types, ')
          ..write('abilities: $abilities, ')
          ..write('evolution: $evolution, ')
          ..write('formes: $formes, ')
          ..write('tier: $tier')
          ..write(')'))
        .toString();
  }
}

class $PokemonsTable extends Pokemons with TableInfo<$PokemonsTable, Pokemon> {
  final GeneratedDatabase _db;
  final String? _alias;
  $PokemonsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedTextColumn name = _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _nameIdMeta = const VerificationMeta('nameId');
  @override
  late final GeneratedTextColumn nameId = _constructNameId();
  GeneratedTextColumn _constructNameId() {
    return GeneratedTextColumn(
      'name_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _hpMeta = const VerificationMeta('hp');
  @override
  late final GeneratedIntColumn hp = _constructHp();
  GeneratedIntColumn _constructHp() {
    return GeneratedIntColumn(
      'hp',
      $tableName,
      false,
    );
  }

  final VerificationMeta _atkMeta = const VerificationMeta('atk');
  @override
  late final GeneratedIntColumn atk = _constructAtk();
  GeneratedIntColumn _constructAtk() {
    return GeneratedIntColumn(
      'atk',
      $tableName,
      false,
    );
  }

  final VerificationMeta _defMeta = const VerificationMeta('def');
  @override
  late final GeneratedIntColumn def = _constructDef();
  GeneratedIntColumn _constructDef() {
    return GeneratedIntColumn(
      'def',
      $tableName,
      false,
    );
  }

  final VerificationMeta _spaMeta = const VerificationMeta('spa');
  @override
  late final GeneratedIntColumn spa = _constructSpa();
  GeneratedIntColumn _constructSpa() {
    return GeneratedIntColumn(
      'spa',
      $tableName,
      false,
    );
  }

  final VerificationMeta _spdMeta = const VerificationMeta('spd');
  @override
  late final GeneratedIntColumn spd = _constructSpd();
  GeneratedIntColumn _constructSpd() {
    return GeneratedIntColumn(
      'spd',
      $tableName,
      false,
    );
  }

  final VerificationMeta _speMeta = const VerificationMeta('spe');
  @override
  late final GeneratedIntColumn spe = _constructSpe();
  GeneratedIntColumn _constructSpe() {
    return GeneratedIntColumn(
      'spe',
      $tableName,
      false,
    );
  }

  final VerificationMeta _bstMeta = const VerificationMeta('bst');
  @override
  late final GeneratedIntColumn bst = _constructBst();
  GeneratedIntColumn _constructBst() {
    return GeneratedIntColumn(
      'bst',
      $tableName,
      false,
    );
  }

  final VerificationMeta _heightMeta = const VerificationMeta('height');
  @override
  late final GeneratedRealColumn height = _constructHeight();
  GeneratedRealColumn _constructHeight() {
    return GeneratedRealColumn(
      'height',
      $tableName,
      false,
    );
  }

  final VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedRealColumn weight = _constructWeight();
  GeneratedRealColumn _constructWeight() {
    return GeneratedRealColumn(
      'weight',
      $tableName,
      false,
    );
  }

  final VerificationMeta _typesMeta = const VerificationMeta('types');
  @override
  late final GeneratedTextColumn types = _constructTypes();
  GeneratedTextColumn _constructTypes() {
    return GeneratedTextColumn(
      'types',
      $tableName,
      false,
    );
  }

  final VerificationMeta _abilitiesMeta = const VerificationMeta('abilities');
  @override
  late final GeneratedTextColumn abilities = _constructAbilities();
  GeneratedTextColumn _constructAbilities() {
    return GeneratedTextColumn(
      'abilities',
      $tableName,
      false,
    );
  }

  final VerificationMeta _evolutionMeta = const VerificationMeta('evolution');
  @override
  late final GeneratedTextColumn evolution = _constructEvolution();
  GeneratedTextColumn _constructEvolution() {
    return GeneratedTextColumn(
      'evolution',
      $tableName,
      false,
    );
  }

  final VerificationMeta _formesMeta = const VerificationMeta('formes');
  @override
  late final GeneratedTextColumn formes = _constructFormes();
  GeneratedTextColumn _constructFormes() {
    return GeneratedTextColumn(
      'formes',
      $tableName,
      false,
    );
  }

  final VerificationMeta _tierMeta = const VerificationMeta('tier');
  @override
  late final GeneratedTextColumn tier = _constructTier();
  GeneratedTextColumn _constructTier() {
    return GeneratedTextColumn(
      'tier',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        nameId,
        hp,
        atk,
        def,
        spa,
        spd,
        spe,
        bst,
        height,
        weight,
        types,
        abilities,
        evolution,
        formes,
        tier
      ];
  @override
  $PokemonsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'pokemons';
  @override
  final String actualTableName = 'pokemons';
  @override
  VerificationContext validateIntegrity(Insertable<Pokemon> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('name_id')) {
      context.handle(_nameIdMeta,
          nameId.isAcceptableOrUnknown(data['name_id']!, _nameIdMeta));
    } else if (isInserting) {
      context.missing(_nameIdMeta);
    }
    if (data.containsKey('hp')) {
      context.handle(_hpMeta, hp.isAcceptableOrUnknown(data['hp']!, _hpMeta));
    } else if (isInserting) {
      context.missing(_hpMeta);
    }
    if (data.containsKey('atk')) {
      context.handle(
          _atkMeta, atk.isAcceptableOrUnknown(data['atk']!, _atkMeta));
    } else if (isInserting) {
      context.missing(_atkMeta);
    }
    if (data.containsKey('def')) {
      context.handle(
          _defMeta, def.isAcceptableOrUnknown(data['def']!, _defMeta));
    } else if (isInserting) {
      context.missing(_defMeta);
    }
    if (data.containsKey('spa')) {
      context.handle(
          _spaMeta, spa.isAcceptableOrUnknown(data['spa']!, _spaMeta));
    } else if (isInserting) {
      context.missing(_spaMeta);
    }
    if (data.containsKey('spd')) {
      context.handle(
          _spdMeta, spd.isAcceptableOrUnknown(data['spd']!, _spdMeta));
    } else if (isInserting) {
      context.missing(_spdMeta);
    }
    if (data.containsKey('spe')) {
      context.handle(
          _speMeta, spe.isAcceptableOrUnknown(data['spe']!, _speMeta));
    } else if (isInserting) {
      context.missing(_speMeta);
    }
    if (data.containsKey('bst')) {
      context.handle(
          _bstMeta, bst.isAcceptableOrUnknown(data['bst']!, _bstMeta));
    } else if (isInserting) {
      context.missing(_bstMeta);
    }
    if (data.containsKey('height')) {
      context.handle(_heightMeta,
          height.isAcceptableOrUnknown(data['height']!, _heightMeta));
    } else if (isInserting) {
      context.missing(_heightMeta);
    }
    if (data.containsKey('weight')) {
      context.handle(_weightMeta,
          weight.isAcceptableOrUnknown(data['weight']!, _weightMeta));
    } else if (isInserting) {
      context.missing(_weightMeta);
    }
    context.handle(_typesMeta, const VerificationResult.success());
    context.handle(_abilitiesMeta, const VerificationResult.success());
    context.handle(_evolutionMeta, const VerificationResult.success());
    context.handle(_formesMeta, const VerificationResult.success());
    if (data.containsKey('tier')) {
      context.handle(
          _tierMeta, tier.isAcceptableOrUnknown(data['tier']!, _tierMeta));
    } else if (isInserting) {
      context.missing(_tierMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  Pokemon map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Pokemon.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $PokemonsTable createAlias(String alias) {
    return $PokemonsTable(_db, alias);
  }

  static TypeConverter<List<String>, String> $converter0 =
      ListConverter<String>();
  static TypeConverter<PokemonAbilities, String> $converter1 =
      PokemonAbilitiesConverter();
  static TypeConverter<PokemonEvolutions, String> $converter2 =
      PokemonEvolutionsConverter();
  static TypeConverter<PokemonFormes, String> $converter3 =
      PokemonFormesConverter();
}

class Ability extends DataClass implements Insertable<Ability> {
  final String name;
  final String shortDesc;
  final String desc;
  final double rating;
  Ability(
      {required this.name,
      required this.shortDesc,
      required this.desc,
      required this.rating});
  factory Ability.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final doubleType = db.typeSystem.forDartType<double>();
    return Ability(
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      shortDesc: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}short_desc'])!,
      desc: stringType.mapFromDatabaseResponse(data['${effectivePrefix}desc'])!,
      rating:
          doubleType.mapFromDatabaseResponse(data['${effectivePrefix}rating'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['name'] = Variable<String>(name);
    map['short_desc'] = Variable<String>(shortDesc);
    map['desc'] = Variable<String>(desc);
    map['rating'] = Variable<double>(rating);
    return map;
  }

  AbilitiesCompanion toCompanion(bool nullToAbsent) {
    return AbilitiesCompanion(
      name: Value(name),
      shortDesc: Value(shortDesc),
      desc: Value(desc),
      rating: Value(rating),
    );
  }

  factory Ability.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Ability(
      name: serializer.fromJson<String>(json['name']),
      shortDesc: serializer.fromJson<String>(json['shortDesc']),
      desc: serializer.fromJson<String>(json['desc']),
      rating: serializer.fromJson<double>(json['rating']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'name': serializer.toJson<String>(name),
      'shortDesc': serializer.toJson<String>(shortDesc),
      'desc': serializer.toJson<String>(desc),
      'rating': serializer.toJson<double>(rating),
    };
  }

  Ability copyWith(
          {String? name, String? shortDesc, String? desc, double? rating}) =>
      Ability(
        name: name ?? this.name,
        shortDesc: shortDesc ?? this.shortDesc,
        desc: desc ?? this.desc,
        rating: rating ?? this.rating,
      );
  @override
  String toString() {
    return (StringBuffer('Ability(')
          ..write('name: $name, ')
          ..write('shortDesc: $shortDesc, ')
          ..write('desc: $desc, ')
          ..write('rating: $rating')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(name.hashCode,
      $mrjc(shortDesc.hashCode, $mrjc(desc.hashCode, rating.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Ability &&
          other.name == this.name &&
          other.shortDesc == this.shortDesc &&
          other.desc == this.desc &&
          other.rating == this.rating);
}

class AbilitiesCompanion extends UpdateCompanion<Ability> {
  final Value<String> name;
  final Value<String> shortDesc;
  final Value<String> desc;
  final Value<double> rating;
  const AbilitiesCompanion({
    this.name = const Value.absent(),
    this.shortDesc = const Value.absent(),
    this.desc = const Value.absent(),
    this.rating = const Value.absent(),
  });
  AbilitiesCompanion.insert({
    required String name,
    required String shortDesc,
    required String desc,
    required double rating,
  })   : name = Value(name),
        shortDesc = Value(shortDesc),
        desc = Value(desc),
        rating = Value(rating);
  static Insertable<Ability> custom({
    Expression<String>? name,
    Expression<String>? shortDesc,
    Expression<String>? desc,
    Expression<double>? rating,
  }) {
    return RawValuesInsertable({
      if (name != null) 'name': name,
      if (shortDesc != null) 'short_desc': shortDesc,
      if (desc != null) 'desc': desc,
      if (rating != null) 'rating': rating,
    });
  }

  AbilitiesCompanion copyWith(
      {Value<String>? name,
      Value<String>? shortDesc,
      Value<String>? desc,
      Value<double>? rating}) {
    return AbilitiesCompanion(
      name: name ?? this.name,
      shortDesc: shortDesc ?? this.shortDesc,
      desc: desc ?? this.desc,
      rating: rating ?? this.rating,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (shortDesc.present) {
      map['short_desc'] = Variable<String>(shortDesc.value);
    }
    if (desc.present) {
      map['desc'] = Variable<String>(desc.value);
    }
    if (rating.present) {
      map['rating'] = Variable<double>(rating.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AbilitiesCompanion(')
          ..write('name: $name, ')
          ..write('shortDesc: $shortDesc, ')
          ..write('desc: $desc, ')
          ..write('rating: $rating')
          ..write(')'))
        .toString();
  }
}

class $AbilitiesTable extends Abilities
    with TableInfo<$AbilitiesTable, Ability> {
  final GeneratedDatabase _db;
  final String? _alias;
  $AbilitiesTable(this._db, [this._alias]);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedTextColumn name = _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _shortDescMeta = const VerificationMeta('shortDesc');
  @override
  late final GeneratedTextColumn shortDesc = _constructShortDesc();
  GeneratedTextColumn _constructShortDesc() {
    return GeneratedTextColumn(
      'short_desc',
      $tableName,
      false,
    );
  }

  final VerificationMeta _descMeta = const VerificationMeta('desc');
  @override
  late final GeneratedTextColumn desc = _constructDesc();
  GeneratedTextColumn _constructDesc() {
    return GeneratedTextColumn(
      'desc',
      $tableName,
      false,
    );
  }

  final VerificationMeta _ratingMeta = const VerificationMeta('rating');
  @override
  late final GeneratedRealColumn rating = _constructRating();
  GeneratedRealColumn _constructRating() {
    return GeneratedRealColumn(
      'rating',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [name, shortDesc, desc, rating];
  @override
  $AbilitiesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'abilities';
  @override
  final String actualTableName = 'abilities';
  @override
  VerificationContext validateIntegrity(Insertable<Ability> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('short_desc')) {
      context.handle(_shortDescMeta,
          shortDesc.isAcceptableOrUnknown(data['short_desc']!, _shortDescMeta));
    } else if (isInserting) {
      context.missing(_shortDescMeta);
    }
    if (data.containsKey('desc')) {
      context.handle(
          _descMeta, desc.isAcceptableOrUnknown(data['desc']!, _descMeta));
    } else if (isInserting) {
      context.missing(_descMeta);
    }
    if (data.containsKey('rating')) {
      context.handle(_ratingMeta,
          rating.isAcceptableOrUnknown(data['rating']!, _ratingMeta));
    } else if (isInserting) {
      context.missing(_ratingMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  Ability map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Ability.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $AbilitiesTable createAlias(String alias) {
    return $AbilitiesTable(_db, alias);
  }
}

class LearnSet extends DataClass implements Insertable<LearnSet> {
  final String nameId;
  final String moveId;
  LearnSet({required this.nameId, required this.moveId});
  factory LearnSet.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    return LearnSet(
      nameId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}name_id'])!,
      moveId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}move_id'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['name_id'] = Variable<String>(nameId);
    map['move_id'] = Variable<String>(moveId);
    return map;
  }

  LearnSetsCompanion toCompanion(bool nullToAbsent) {
    return LearnSetsCompanion(
      nameId: Value(nameId),
      moveId: Value(moveId),
    );
  }

  factory LearnSet.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return LearnSet(
      nameId: serializer.fromJson<String>(json['nameId']),
      moveId: serializer.fromJson<String>(json['moveId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'nameId': serializer.toJson<String>(nameId),
      'moveId': serializer.toJson<String>(moveId),
    };
  }

  LearnSet copyWith({String? nameId, String? moveId}) => LearnSet(
        nameId: nameId ?? this.nameId,
        moveId: moveId ?? this.moveId,
      );
  @override
  String toString() {
    return (StringBuffer('LearnSet(')
          ..write('nameId: $nameId, ')
          ..write('moveId: $moveId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(nameId.hashCode, moveId.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is LearnSet &&
          other.nameId == this.nameId &&
          other.moveId == this.moveId);
}

class LearnSetsCompanion extends UpdateCompanion<LearnSet> {
  final Value<String> nameId;
  final Value<String> moveId;
  const LearnSetsCompanion({
    this.nameId = const Value.absent(),
    this.moveId = const Value.absent(),
  });
  LearnSetsCompanion.insert({
    required String nameId,
    required String moveId,
  })   : nameId = Value(nameId),
        moveId = Value(moveId);
  static Insertable<LearnSet> custom({
    Expression<String>? nameId,
    Expression<String>? moveId,
  }) {
    return RawValuesInsertable({
      if (nameId != null) 'name_id': nameId,
      if (moveId != null) 'move_id': moveId,
    });
  }

  LearnSetsCompanion copyWith({Value<String>? nameId, Value<String>? moveId}) {
    return LearnSetsCompanion(
      nameId: nameId ?? this.nameId,
      moveId: moveId ?? this.moveId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (nameId.present) {
      map['name_id'] = Variable<String>(nameId.value);
    }
    if (moveId.present) {
      map['move_id'] = Variable<String>(moveId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LearnSetsCompanion(')
          ..write('nameId: $nameId, ')
          ..write('moveId: $moveId')
          ..write(')'))
        .toString();
  }
}

class $LearnSetsTable extends LearnSets
    with TableInfo<$LearnSetsTable, LearnSet> {
  final GeneratedDatabase _db;
  final String? _alias;
  $LearnSetsTable(this._db, [this._alias]);
  final VerificationMeta _nameIdMeta = const VerificationMeta('nameId');
  @override
  late final GeneratedTextColumn nameId = _constructNameId();
  GeneratedTextColumn _constructNameId() {
    return GeneratedTextColumn(
      'name_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _moveIdMeta = const VerificationMeta('moveId');
  @override
  late final GeneratedTextColumn moveId = _constructMoveId();
  GeneratedTextColumn _constructMoveId() {
    return GeneratedTextColumn(
      'move_id',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [nameId, moveId];
  @override
  $LearnSetsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'learn_sets';
  @override
  final String actualTableName = 'learn_sets';
  @override
  VerificationContext validateIntegrity(Insertable<LearnSet> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('name_id')) {
      context.handle(_nameIdMeta,
          nameId.isAcceptableOrUnknown(data['name_id']!, _nameIdMeta));
    } else if (isInserting) {
      context.missing(_nameIdMeta);
    }
    if (data.containsKey('move_id')) {
      context.handle(_moveIdMeta,
          moveId.isAcceptableOrUnknown(data['move_id']!, _moveIdMeta));
    } else if (isInserting) {
      context.missing(_moveIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  LearnSet map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return LearnSet.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $LearnSetsTable createAlias(String alias) {
    return $LearnSetsTable(_db, alias);
  }
}

class Move extends DataClass implements Insertable<Move> {
  final String id;
  final String name;
  final String type;
  final String category;
  final int? accuracy;
  final int basePower;
  final int pp;
  final int priority;
  final String target;
  final String? shortDesc;
  final String? desc;
  Move(
      {required this.id,
      required this.name,
      required this.type,
      required this.category,
      this.accuracy,
      required this.basePower,
      required this.pp,
      required this.priority,
      required this.target,
      this.shortDesc,
      this.desc});
  factory Move.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final intType = db.typeSystem.forDartType<int>();
    return Move(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      type: stringType.mapFromDatabaseResponse(data['${effectivePrefix}type'])!,
      category: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}category'])!,
      accuracy:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}accuracy']),
      basePower:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}power'])!,
      pp: intType.mapFromDatabaseResponse(data['${effectivePrefix}pp'])!,
      priority:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}priority'])!,
      target:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}target'])!,
      shortDesc: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}short_desc']),
      desc: stringType.mapFromDatabaseResponse(data['${effectivePrefix}desc']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['type'] = Variable<String>(type);
    map['category'] = Variable<String>(category);
    if (!nullToAbsent || accuracy != null) {
      map['accuracy'] = Variable<int?>(accuracy);
    }
    map['power'] = Variable<int>(basePower);
    map['pp'] = Variable<int>(pp);
    map['priority'] = Variable<int>(priority);
    map['target'] = Variable<String>(target);
    if (!nullToAbsent || shortDesc != null) {
      map['short_desc'] = Variable<String?>(shortDesc);
    }
    if (!nullToAbsent || desc != null) {
      map['desc'] = Variable<String?>(desc);
    }
    return map;
  }

  MovesCompanion toCompanion(bool nullToAbsent) {
    return MovesCompanion(
      id: Value(id),
      name: Value(name),
      type: Value(type),
      category: Value(category),
      accuracy: accuracy == null && nullToAbsent
          ? const Value.absent()
          : Value(accuracy),
      basePower: Value(basePower),
      pp: Value(pp),
      priority: Value(priority),
      target: Value(target),
      shortDesc: shortDesc == null && nullToAbsent
          ? const Value.absent()
          : Value(shortDesc),
      desc: desc == null && nullToAbsent ? const Value.absent() : Value(desc),
    );
  }

  factory Move.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Move(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      type: serializer.fromJson<String>(json['type']),
      category: serializer.fromJson<String>(json['category']),
      accuracy: serializer.fromJson<int?>(json['accuracy']),
      basePower: serializer.fromJson<int>(json['basePower']),
      pp: serializer.fromJson<int>(json['pp']),
      priority: serializer.fromJson<int>(json['priority']),
      target: serializer.fromJson<String>(json['target']),
      shortDesc: serializer.fromJson<String?>(json['shortDesc']),
      desc: serializer.fromJson<String?>(json['desc']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'type': serializer.toJson<String>(type),
      'category': serializer.toJson<String>(category),
      'accuracy': serializer.toJson<int?>(accuracy),
      'basePower': serializer.toJson<int>(basePower),
      'pp': serializer.toJson<int>(pp),
      'priority': serializer.toJson<int>(priority),
      'target': serializer.toJson<String>(target),
      'shortDesc': serializer.toJson<String?>(shortDesc),
      'desc': serializer.toJson<String?>(desc),
    };
  }

  Move copyWith(
          {String? id,
          String? name,
          String? type,
          String? category,
          int? accuracy,
          int? basePower,
          int? pp,
          int? priority,
          String? target,
          String? shortDesc,
          String? desc}) =>
      Move(
        id: id ?? this.id,
        name: name ?? this.name,
        type: type ?? this.type,
        category: category ?? this.category,
        accuracy: accuracy ?? this.accuracy,
        basePower: basePower ?? this.basePower,
        pp: pp ?? this.pp,
        priority: priority ?? this.priority,
        target: target ?? this.target,
        shortDesc: shortDesc ?? this.shortDesc,
        desc: desc ?? this.desc,
      );
  @override
  String toString() {
    return (StringBuffer('Move(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('category: $category, ')
          ..write('accuracy: $accuracy, ')
          ..write('basePower: $basePower, ')
          ..write('pp: $pp, ')
          ..write('priority: $priority, ')
          ..write('target: $target, ')
          ..write('shortDesc: $shortDesc, ')
          ..write('desc: $desc')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          name.hashCode,
          $mrjc(
              type.hashCode,
              $mrjc(
                  category.hashCode,
                  $mrjc(
                      accuracy.hashCode,
                      $mrjc(
                          basePower.hashCode,
                          $mrjc(
                              pp.hashCode,
                              $mrjc(
                                  priority.hashCode,
                                  $mrjc(
                                      target.hashCode,
                                      $mrjc(shortDesc.hashCode,
                                          desc.hashCode)))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Move &&
          other.id == this.id &&
          other.name == this.name &&
          other.type == this.type &&
          other.category == this.category &&
          other.accuracy == this.accuracy &&
          other.basePower == this.basePower &&
          other.pp == this.pp &&
          other.priority == this.priority &&
          other.target == this.target &&
          other.shortDesc == this.shortDesc &&
          other.desc == this.desc);
}

class MovesCompanion extends UpdateCompanion<Move> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> type;
  final Value<String> category;
  final Value<int?> accuracy;
  final Value<int> basePower;
  final Value<int> pp;
  final Value<int> priority;
  final Value<String> target;
  final Value<String?> shortDesc;
  final Value<String?> desc;
  const MovesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.type = const Value.absent(),
    this.category = const Value.absent(),
    this.accuracy = const Value.absent(),
    this.basePower = const Value.absent(),
    this.pp = const Value.absent(),
    this.priority = const Value.absent(),
    this.target = const Value.absent(),
    this.shortDesc = const Value.absent(),
    this.desc = const Value.absent(),
  });
  MovesCompanion.insert({
    required String id,
    required String name,
    required String type,
    required String category,
    this.accuracy = const Value.absent(),
    required int basePower,
    required int pp,
    required int priority,
    required String target,
    this.shortDesc = const Value.absent(),
    this.desc = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        type = Value(type),
        category = Value(category),
        basePower = Value(basePower),
        pp = Value(pp),
        priority = Value(priority),
        target = Value(target);
  static Insertable<Move> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? type,
    Expression<String>? category,
    Expression<int?>? accuracy,
    Expression<int>? basePower,
    Expression<int>? pp,
    Expression<int>? priority,
    Expression<String>? target,
    Expression<String?>? shortDesc,
    Expression<String?>? desc,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (type != null) 'type': type,
      if (category != null) 'category': category,
      if (accuracy != null) 'accuracy': accuracy,
      if (basePower != null) 'power': basePower,
      if (pp != null) 'pp': pp,
      if (priority != null) 'priority': priority,
      if (target != null) 'target': target,
      if (shortDesc != null) 'short_desc': shortDesc,
      if (desc != null) 'desc': desc,
    });
  }

  MovesCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? type,
      Value<String>? category,
      Value<int?>? accuracy,
      Value<int>? basePower,
      Value<int>? pp,
      Value<int>? priority,
      Value<String>? target,
      Value<String?>? shortDesc,
      Value<String?>? desc}) {
    return MovesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      category: category ?? this.category,
      accuracy: accuracy ?? this.accuracy,
      basePower: basePower ?? this.basePower,
      pp: pp ?? this.pp,
      priority: priority ?? this.priority,
      target: target ?? this.target,
      shortDesc: shortDesc ?? this.shortDesc,
      desc: desc ?? this.desc,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (accuracy.present) {
      map['accuracy'] = Variable<int?>(accuracy.value);
    }
    if (basePower.present) {
      map['power'] = Variable<int>(basePower.value);
    }
    if (pp.present) {
      map['pp'] = Variable<int>(pp.value);
    }
    if (priority.present) {
      map['priority'] = Variable<int>(priority.value);
    }
    if (target.present) {
      map['target'] = Variable<String>(target.value);
    }
    if (shortDesc.present) {
      map['short_desc'] = Variable<String?>(shortDesc.value);
    }
    if (desc.present) {
      map['desc'] = Variable<String?>(desc.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MovesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('category: $category, ')
          ..write('accuracy: $accuracy, ')
          ..write('basePower: $basePower, ')
          ..write('pp: $pp, ')
          ..write('priority: $priority, ')
          ..write('target: $target, ')
          ..write('shortDesc: $shortDesc, ')
          ..write('desc: $desc')
          ..write(')'))
        .toString();
  }
}

class $MovesTable extends Moves with TableInfo<$MovesTable, Move> {
  final GeneratedDatabase _db;
  final String? _alias;
  $MovesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedTextColumn id = _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedTextColumn name = _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedTextColumn type = _constructType();
  GeneratedTextColumn _constructType() {
    return GeneratedTextColumn(
      'type',
      $tableName,
      false,
    );
  }

  final VerificationMeta _categoryMeta = const VerificationMeta('category');
  @override
  late final GeneratedTextColumn category = _constructCategory();
  GeneratedTextColumn _constructCategory() {
    return GeneratedTextColumn(
      'category',
      $tableName,
      false,
    );
  }

  final VerificationMeta _accuracyMeta = const VerificationMeta('accuracy');
  @override
  late final GeneratedIntColumn accuracy = _constructAccuracy();
  GeneratedIntColumn _constructAccuracy() {
    return GeneratedIntColumn(
      'accuracy',
      $tableName,
      true,
    );
  }

  final VerificationMeta _basePowerMeta = const VerificationMeta('basePower');
  @override
  late final GeneratedIntColumn basePower = _constructBasePower();
  GeneratedIntColumn _constructBasePower() {
    return GeneratedIntColumn(
      'power',
      $tableName,
      false,
    );
  }

  final VerificationMeta _ppMeta = const VerificationMeta('pp');
  @override
  late final GeneratedIntColumn pp = _constructPp();
  GeneratedIntColumn _constructPp() {
    return GeneratedIntColumn(
      'pp',
      $tableName,
      false,
    );
  }

  final VerificationMeta _priorityMeta = const VerificationMeta('priority');
  @override
  late final GeneratedIntColumn priority = _constructPriority();
  GeneratedIntColumn _constructPriority() {
    return GeneratedIntColumn(
      'priority',
      $tableName,
      false,
    );
  }

  final VerificationMeta _targetMeta = const VerificationMeta('target');
  @override
  late final GeneratedTextColumn target = _constructTarget();
  GeneratedTextColumn _constructTarget() {
    return GeneratedTextColumn(
      'target',
      $tableName,
      false,
    );
  }

  final VerificationMeta _shortDescMeta = const VerificationMeta('shortDesc');
  @override
  late final GeneratedTextColumn shortDesc = _constructShortDesc();
  GeneratedTextColumn _constructShortDesc() {
    return GeneratedTextColumn(
      'short_desc',
      $tableName,
      true,
    );
  }

  final VerificationMeta _descMeta = const VerificationMeta('desc');
  @override
  late final GeneratedTextColumn desc = _constructDesc();
  GeneratedTextColumn _constructDesc() {
    return GeneratedTextColumn(
      'desc',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        type,
        category,
        accuracy,
        basePower,
        pp,
        priority,
        target,
        shortDesc,
        desc
      ];
  @override
  $MovesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'moves';
  @override
  final String actualTableName = 'moves';
  @override
  VerificationContext validateIntegrity(Insertable<Move> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('accuracy')) {
      context.handle(_accuracyMeta,
          accuracy.isAcceptableOrUnknown(data['accuracy']!, _accuracyMeta));
    }
    if (data.containsKey('power')) {
      context.handle(_basePowerMeta,
          basePower.isAcceptableOrUnknown(data['power']!, _basePowerMeta));
    } else if (isInserting) {
      context.missing(_basePowerMeta);
    }
    if (data.containsKey('pp')) {
      context.handle(_ppMeta, pp.isAcceptableOrUnknown(data['pp']!, _ppMeta));
    } else if (isInserting) {
      context.missing(_ppMeta);
    }
    if (data.containsKey('priority')) {
      context.handle(_priorityMeta,
          priority.isAcceptableOrUnknown(data['priority']!, _priorityMeta));
    } else if (isInserting) {
      context.missing(_priorityMeta);
    }
    if (data.containsKey('target')) {
      context.handle(_targetMeta,
          target.isAcceptableOrUnknown(data['target']!, _targetMeta));
    } else if (isInserting) {
      context.missing(_targetMeta);
    }
    if (data.containsKey('short_desc')) {
      context.handle(_shortDescMeta,
          shortDesc.isAcceptableOrUnknown(data['short_desc']!, _shortDescMeta));
    }
    if (data.containsKey('desc')) {
      context.handle(
          _descMeta, desc.isAcceptableOrUnknown(data['desc']!, _descMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  Move map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Move.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $MovesTable createAlias(String alias) {
    return $MovesTable(_db, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $PokemonsTable pokemons = $PokemonsTable(this);
  late final $AbilitiesTable abilities = $AbilitiesTable(this);
  late final $LearnSetsTable learnSets = $LearnSetsTable(this);
  late final $MovesTable moves = $MovesTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [pokemons, abilities, learnSets, moves];
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

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

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Pokemon extends DataClass implements Insertable<Pokemon> {
  final int? id;
  final String? name;
  final String? nameId;
  final double? height;
  final double? weight;
  final List<String>? types;
  final int? hp;
  final int? atk;
  final int? def;
  final int? spa;
  final int? spd;
  final int? spe;
  final int? bst;
  final PokemonAbilities? abilities;
  final String? tier;
  Pokemon(
      {this.id,
      this.name,
      this.nameId,
      this.height,
      this.weight,
      this.types,
      this.hp,
      this.atk,
      this.def,
      this.spa,
      this.spd,
      this.spe,
      this.bst,
      this.abilities,
      this.tier});
  factory Pokemon.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final doubleType = db.typeSystem.forDartType<double>();
    return Pokemon(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      nameId:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}name_id']),
      height:
          doubleType.mapFromDatabaseResponse(data['${effectivePrefix}height']),
      weight:
          doubleType.mapFromDatabaseResponse(data['${effectivePrefix}weight']),
      types: $PokemonsTable.$converter0.mapToDart(
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}types'])),
      hp: intType.mapFromDatabaseResponse(data['${effectivePrefix}hp']),
      atk: intType.mapFromDatabaseResponse(data['${effectivePrefix}atk']),
      def: intType.mapFromDatabaseResponse(data['${effectivePrefix}def']),
      spa: intType.mapFromDatabaseResponse(data['${effectivePrefix}spa']),
      spd: intType.mapFromDatabaseResponse(data['${effectivePrefix}spd']),
      spe: intType.mapFromDatabaseResponse(data['${effectivePrefix}spe']),
      bst: intType.mapFromDatabaseResponse(data['${effectivePrefix}bst']),
      abilities: $PokemonsTable.$converter1.mapToDart(stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}abilities'])),
      tier: stringType.mapFromDatabaseResponse(data['${effectivePrefix}tier']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int?>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String?>(name);
    }
    if (!nullToAbsent || nameId != null) {
      map['name_id'] = Variable<String?>(nameId);
    }
    if (!nullToAbsent || height != null) {
      map['height'] = Variable<double?>(height);
    }
    if (!nullToAbsent || weight != null) {
      map['weight'] = Variable<double?>(weight);
    }
    if (!nullToAbsent || types != null) {
      final converter = $PokemonsTable.$converter0;
      map['types'] = Variable<String?>(converter.mapToSql(types));
    }
    if (!nullToAbsent || hp != null) {
      map['hp'] = Variable<int?>(hp);
    }
    if (!nullToAbsent || atk != null) {
      map['atk'] = Variable<int?>(atk);
    }
    if (!nullToAbsent || def != null) {
      map['def'] = Variable<int?>(def);
    }
    if (!nullToAbsent || spa != null) {
      map['spa'] = Variable<int?>(spa);
    }
    if (!nullToAbsent || spd != null) {
      map['spd'] = Variable<int?>(spd);
    }
    if (!nullToAbsent || spe != null) {
      map['spe'] = Variable<int?>(spe);
    }
    if (!nullToAbsent || bst != null) {
      map['bst'] = Variable<int?>(bst);
    }
    if (!nullToAbsent || abilities != null) {
      final converter = $PokemonsTable.$converter1;
      map['abilities'] = Variable<String?>(converter.mapToSql(abilities));
    }
    if (!nullToAbsent || tier != null) {
      map['tier'] = Variable<String?>(tier);
    }
    return map;
  }

  PokemonsCompanion toCompanion(bool nullToAbsent) {
    return PokemonsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      nameId:
          nameId == null && nullToAbsent ? const Value.absent() : Value(nameId),
      height:
          height == null && nullToAbsent ? const Value.absent() : Value(height),
      weight:
          weight == null && nullToAbsent ? const Value.absent() : Value(weight),
      types:
          types == null && nullToAbsent ? const Value.absent() : Value(types),
      hp: hp == null && nullToAbsent ? const Value.absent() : Value(hp),
      atk: atk == null && nullToAbsent ? const Value.absent() : Value(atk),
      def: def == null && nullToAbsent ? const Value.absent() : Value(def),
      spa: spa == null && nullToAbsent ? const Value.absent() : Value(spa),
      spd: spd == null && nullToAbsent ? const Value.absent() : Value(spd),
      spe: spe == null && nullToAbsent ? const Value.absent() : Value(spe),
      bst: bst == null && nullToAbsent ? const Value.absent() : Value(bst),
      abilities: abilities == null && nullToAbsent
          ? const Value.absent()
          : Value(abilities),
      tier: tier == null && nullToAbsent ? const Value.absent() : Value(tier),
    );
  }

  factory Pokemon.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Pokemon(
      id: serializer.fromJson<int?>(json['num']),
      name: serializer.fromJson<String?>(json['name']),
      nameId: serializer.fromJson<String?>(json['nameId']),
      height: serializer.fromJson<double?>(json['heightm']),
      weight: serializer.fromJson<double?>(json['weightkg']),
      types: serializer.fromJson<List<String>?>(json['types']),
      hp: serializer.fromJson<int?>(json['hp']),
      atk: serializer.fromJson<int?>(json['atk']),
      def: serializer.fromJson<int?>(json['def']),
      spa: serializer.fromJson<int?>(json['spa']),
      spd: serializer.fromJson<int?>(json['spd']),
      spe: serializer.fromJson<int?>(json['spe']),
      bst: serializer.fromJson<int?>(json['bst']),
      abilities: serializer.fromJson<PokemonAbilities?>(json['abilities']),
      tier: serializer.fromJson<String?>(json['tier']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'num': serializer.toJson<int?>(id),
      'name': serializer.toJson<String?>(name),
      'nameId': serializer.toJson<String?>(nameId),
      'heightm': serializer.toJson<double?>(height),
      'weightkg': serializer.toJson<double?>(weight),
      'types': serializer.toJson<List<String>?>(types),
      'hp': serializer.toJson<int?>(hp),
      'atk': serializer.toJson<int?>(atk),
      'def': serializer.toJson<int?>(def),
      'spa': serializer.toJson<int?>(spa),
      'spd': serializer.toJson<int?>(spd),
      'spe': serializer.toJson<int?>(spe),
      'bst': serializer.toJson<int?>(bst),
      'abilities': serializer.toJson<PokemonAbilities?>(abilities),
      'tier': serializer.toJson<String?>(tier),
    };
  }

  Pokemon copyWith(
          {int? id,
          String? name,
          String? nameId,
          double? height,
          double? weight,
          List<String>? types,
          int? hp,
          int? atk,
          int? def,
          int? spa,
          int? spd,
          int? spe,
          int? bst,
          PokemonAbilities? abilities,
          String? tier}) =>
      Pokemon(
        id: id ?? this.id,
        name: name ?? this.name,
        nameId: nameId ?? this.nameId,
        height: height ?? this.height,
        weight: weight ?? this.weight,
        types: types ?? this.types,
        hp: hp ?? this.hp,
        atk: atk ?? this.atk,
        def: def ?? this.def,
        spa: spa ?? this.spa,
        spd: spd ?? this.spd,
        spe: spe ?? this.spe,
        bst: bst ?? this.bst,
        abilities: abilities ?? this.abilities,
        tier: tier ?? this.tier,
      );
  @override
  String toString() {
    return (StringBuffer('Pokemon(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('nameId: $nameId, ')
          ..write('height: $height, ')
          ..write('weight: $weight, ')
          ..write('types: $types, ')
          ..write('hp: $hp, ')
          ..write('atk: $atk, ')
          ..write('def: $def, ')
          ..write('spa: $spa, ')
          ..write('spd: $spd, ')
          ..write('spe: $spe, ')
          ..write('bst: $bst, ')
          ..write('abilities: $abilities, ')
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
                  height.hashCode,
                  $mrjc(
                      weight.hashCode,
                      $mrjc(
                          types.hashCode,
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
                                                      $mrjc(abilities.hashCode,
                                                          tier.hashCode)))))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Pokemon &&
          other.id == this.id &&
          other.name == this.name &&
          other.nameId == this.nameId &&
          other.height == this.height &&
          other.weight == this.weight &&
          other.types == this.types &&
          other.hp == this.hp &&
          other.atk == this.atk &&
          other.def == this.def &&
          other.spa == this.spa &&
          other.spd == this.spd &&
          other.spe == this.spe &&
          other.bst == this.bst &&
          other.abilities == this.abilities &&
          other.tier == this.tier);
}

class PokemonsCompanion extends UpdateCompanion<Pokemon> {
  final Value<int?> id;
  final Value<String?> name;
  final Value<String?> nameId;
  final Value<double?> height;
  final Value<double?> weight;
  final Value<List<String>?> types;
  final Value<int?> hp;
  final Value<int?> atk;
  final Value<int?> def;
  final Value<int?> spa;
  final Value<int?> spd;
  final Value<int?> spe;
  final Value<int?> bst;
  final Value<PokemonAbilities?> abilities;
  final Value<String?> tier;
  const PokemonsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.nameId = const Value.absent(),
    this.height = const Value.absent(),
    this.weight = const Value.absent(),
    this.types = const Value.absent(),
    this.hp = const Value.absent(),
    this.atk = const Value.absent(),
    this.def = const Value.absent(),
    this.spa = const Value.absent(),
    this.spd = const Value.absent(),
    this.spe = const Value.absent(),
    this.bst = const Value.absent(),
    this.abilities = const Value.absent(),
    this.tier = const Value.absent(),
  });
  PokemonsCompanion.insert({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.nameId = const Value.absent(),
    this.height = const Value.absent(),
    this.weight = const Value.absent(),
    this.types = const Value.absent(),
    this.hp = const Value.absent(),
    this.atk = const Value.absent(),
    this.def = const Value.absent(),
    this.spa = const Value.absent(),
    this.spd = const Value.absent(),
    this.spe = const Value.absent(),
    this.bst = const Value.absent(),
    this.abilities = const Value.absent(),
    this.tier = const Value.absent(),
  });
  static Insertable<Pokemon> custom({
    Expression<int?>? id,
    Expression<String?>? name,
    Expression<String?>? nameId,
    Expression<double?>? height,
    Expression<double?>? weight,
    Expression<List<String>?>? types,
    Expression<int?>? hp,
    Expression<int?>? atk,
    Expression<int?>? def,
    Expression<int?>? spa,
    Expression<int?>? spd,
    Expression<int?>? spe,
    Expression<int?>? bst,
    Expression<PokemonAbilities?>? abilities,
    Expression<String?>? tier,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (nameId != null) 'name_id': nameId,
      if (height != null) 'height': height,
      if (weight != null) 'weight': weight,
      if (types != null) 'types': types,
      if (hp != null) 'hp': hp,
      if (atk != null) 'atk': atk,
      if (def != null) 'def': def,
      if (spa != null) 'spa': spa,
      if (spd != null) 'spd': spd,
      if (spe != null) 'spe': spe,
      if (bst != null) 'bst': bst,
      if (abilities != null) 'abilities': abilities,
      if (tier != null) 'tier': tier,
    });
  }

  PokemonsCompanion copyWith(
      {Value<int?>? id,
      Value<String?>? name,
      Value<String?>? nameId,
      Value<double?>? height,
      Value<double?>? weight,
      Value<List<String>?>? types,
      Value<int?>? hp,
      Value<int?>? atk,
      Value<int?>? def,
      Value<int?>? spa,
      Value<int?>? spd,
      Value<int?>? spe,
      Value<int?>? bst,
      Value<PokemonAbilities?>? abilities,
      Value<String?>? tier}) {
    return PokemonsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      nameId: nameId ?? this.nameId,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      types: types ?? this.types,
      hp: hp ?? this.hp,
      atk: atk ?? this.atk,
      def: def ?? this.def,
      spa: spa ?? this.spa,
      spd: spd ?? this.spd,
      spe: spe ?? this.spe,
      bst: bst ?? this.bst,
      abilities: abilities ?? this.abilities,
      tier: tier ?? this.tier,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int?>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String?>(name.value);
    }
    if (nameId.present) {
      map['name_id'] = Variable<String?>(nameId.value);
    }
    if (height.present) {
      map['height'] = Variable<double?>(height.value);
    }
    if (weight.present) {
      map['weight'] = Variable<double?>(weight.value);
    }
    if (types.present) {
      final converter = $PokemonsTable.$converter0;
      map['types'] = Variable<String?>(converter.mapToSql(types.value));
    }
    if (hp.present) {
      map['hp'] = Variable<int?>(hp.value);
    }
    if (atk.present) {
      map['atk'] = Variable<int?>(atk.value);
    }
    if (def.present) {
      map['def'] = Variable<int?>(def.value);
    }
    if (spa.present) {
      map['spa'] = Variable<int?>(spa.value);
    }
    if (spd.present) {
      map['spd'] = Variable<int?>(spd.value);
    }
    if (spe.present) {
      map['spe'] = Variable<int?>(spe.value);
    }
    if (bst.present) {
      map['bst'] = Variable<int?>(bst.value);
    }
    if (abilities.present) {
      final converter = $PokemonsTable.$converter1;
      map['abilities'] = Variable<String?>(converter.mapToSql(abilities.value));
    }
    if (tier.present) {
      map['tier'] = Variable<String?>(tier.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PokemonsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('nameId: $nameId, ')
          ..write('height: $height, ')
          ..write('weight: $weight, ')
          ..write('types: $types, ')
          ..write('hp: $hp, ')
          ..write('atk: $atk, ')
          ..write('def: $def, ')
          ..write('spa: $spa, ')
          ..write('spd: $spd, ')
          ..write('spe: $spe, ')
          ..write('bst: $bst, ')
          ..write('abilities: $abilities, ')
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
      true,
    );
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedTextColumn name = _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      true,
    );
  }

  final VerificationMeta _nameIdMeta = const VerificationMeta('nameId');
  @override
  late final GeneratedTextColumn nameId = _constructNameId();
  GeneratedTextColumn _constructNameId() {
    return GeneratedTextColumn(
      'name_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _heightMeta = const VerificationMeta('height');
  @override
  late final GeneratedRealColumn height = _constructHeight();
  GeneratedRealColumn _constructHeight() {
    return GeneratedRealColumn(
      'height',
      $tableName,
      true,
    );
  }

  final VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedRealColumn weight = _constructWeight();
  GeneratedRealColumn _constructWeight() {
    return GeneratedRealColumn(
      'weight',
      $tableName,
      true,
    );
  }

  final VerificationMeta _typesMeta = const VerificationMeta('types');
  @override
  late final GeneratedTextColumn types = _constructTypes();
  GeneratedTextColumn _constructTypes() {
    return GeneratedTextColumn(
      'types',
      $tableName,
      true,
    );
  }

  final VerificationMeta _hpMeta = const VerificationMeta('hp');
  @override
  late final GeneratedIntColumn hp = _constructHp();
  GeneratedIntColumn _constructHp() {
    return GeneratedIntColumn(
      'hp',
      $tableName,
      true,
    );
  }

  final VerificationMeta _atkMeta = const VerificationMeta('atk');
  @override
  late final GeneratedIntColumn atk = _constructAtk();
  GeneratedIntColumn _constructAtk() {
    return GeneratedIntColumn(
      'atk',
      $tableName,
      true,
    );
  }

  final VerificationMeta _defMeta = const VerificationMeta('def');
  @override
  late final GeneratedIntColumn def = _constructDef();
  GeneratedIntColumn _constructDef() {
    return GeneratedIntColumn(
      'def',
      $tableName,
      true,
    );
  }

  final VerificationMeta _spaMeta = const VerificationMeta('spa');
  @override
  late final GeneratedIntColumn spa = _constructSpa();
  GeneratedIntColumn _constructSpa() {
    return GeneratedIntColumn(
      'spa',
      $tableName,
      true,
    );
  }

  final VerificationMeta _spdMeta = const VerificationMeta('spd');
  @override
  late final GeneratedIntColumn spd = _constructSpd();
  GeneratedIntColumn _constructSpd() {
    return GeneratedIntColumn(
      'spd',
      $tableName,
      true,
    );
  }

  final VerificationMeta _speMeta = const VerificationMeta('spe');
  @override
  late final GeneratedIntColumn spe = _constructSpe();
  GeneratedIntColumn _constructSpe() {
    return GeneratedIntColumn(
      'spe',
      $tableName,
      true,
    );
  }

  final VerificationMeta _bstMeta = const VerificationMeta('bst');
  @override
  late final GeneratedIntColumn bst = _constructBst();
  GeneratedIntColumn _constructBst() {
    return GeneratedIntColumn(
      'bst',
      $tableName,
      true,
    );
  }

  final VerificationMeta _abilitiesMeta = const VerificationMeta('abilities');
  @override
  late final GeneratedTextColumn abilities = _constructAbilities();
  GeneratedTextColumn _constructAbilities() {
    return GeneratedTextColumn(
      'abilities',
      $tableName,
      true,
    );
  }

  final VerificationMeta _tierMeta = const VerificationMeta('tier');
  @override
  late final GeneratedTextColumn tier = _constructTier();
  GeneratedTextColumn _constructTier() {
    return GeneratedTextColumn(
      'tier',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        nameId,
        height,
        weight,
        types,
        hp,
        atk,
        def,
        spa,
        spd,
        spe,
        bst,
        abilities,
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
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('name_id')) {
      context.handle(_nameIdMeta,
          nameId.isAcceptableOrUnknown(data['name_id']!, _nameIdMeta));
    }
    if (data.containsKey('height')) {
      context.handle(_heightMeta,
          height.isAcceptableOrUnknown(data['height']!, _heightMeta));
    }
    if (data.containsKey('weight')) {
      context.handle(_weightMeta,
          weight.isAcceptableOrUnknown(data['weight']!, _weightMeta));
    }
    context.handle(_typesMeta, const VerificationResult.success());
    if (data.containsKey('hp')) {
      context.handle(_hpMeta, hp.isAcceptableOrUnknown(data['hp']!, _hpMeta));
    }
    if (data.containsKey('atk')) {
      context.handle(
          _atkMeta, atk.isAcceptableOrUnknown(data['atk']!, _atkMeta));
    }
    if (data.containsKey('def')) {
      context.handle(
          _defMeta, def.isAcceptableOrUnknown(data['def']!, _defMeta));
    }
    if (data.containsKey('spa')) {
      context.handle(
          _spaMeta, spa.isAcceptableOrUnknown(data['spa']!, _spaMeta));
    }
    if (data.containsKey('spd')) {
      context.handle(
          _spdMeta, spd.isAcceptableOrUnknown(data['spd']!, _spdMeta));
    }
    if (data.containsKey('spe')) {
      context.handle(
          _speMeta, spe.isAcceptableOrUnknown(data['spe']!, _speMeta));
    }
    if (data.containsKey('bst')) {
      context.handle(
          _bstMeta, bst.isAcceptableOrUnknown(data['bst']!, _bstMeta));
    }
    context.handle(_abilitiesMeta, const VerificationResult.success());
    if (data.containsKey('tier')) {
      context.handle(
          _tierMeta, tier.isAcceptableOrUnknown(data['tier']!, _tierMeta));
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
}

class Ability extends DataClass implements Insertable<Ability> {
  final int id;
  final String name;
  final String shortDesc;
  final String desc;
  final double rating;
  Ability(
      {required this.id,
      required this.name,
      required this.shortDesc,
      required this.desc,
      required this.rating});
  factory Ability.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final doubleType = db.typeSystem.forDartType<double>();
    return Ability(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
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
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['short_desc'] = Variable<String>(shortDesc);
    map['desc'] = Variable<String>(desc);
    map['rating'] = Variable<double>(rating);
    return map;
  }

  AbilitiesCompanion toCompanion(bool nullToAbsent) {
    return AbilitiesCompanion(
      id: Value(id),
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
      id: serializer.fromJson<int>(json['num']),
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
      'num': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'shortDesc': serializer.toJson<String>(shortDesc),
      'desc': serializer.toJson<String>(desc),
      'rating': serializer.toJson<double>(rating),
    };
  }

  Ability copyWith(
          {int? id,
          String? name,
          String? shortDesc,
          String? desc,
          double? rating}) =>
      Ability(
        id: id ?? this.id,
        name: name ?? this.name,
        shortDesc: shortDesc ?? this.shortDesc,
        desc: desc ?? this.desc,
        rating: rating ?? this.rating,
      );
  @override
  String toString() {
    return (StringBuffer('Ability(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('shortDesc: $shortDesc, ')
          ..write('desc: $desc, ')
          ..write('rating: $rating')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(name.hashCode,
          $mrjc(shortDesc.hashCode, $mrjc(desc.hashCode, rating.hashCode)))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Ability &&
          other.id == this.id &&
          other.name == this.name &&
          other.shortDesc == this.shortDesc &&
          other.desc == this.desc &&
          other.rating == this.rating);
}

class AbilitiesCompanion extends UpdateCompanion<Ability> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> shortDesc;
  final Value<String> desc;
  final Value<double> rating;
  const AbilitiesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.shortDesc = const Value.absent(),
    this.desc = const Value.absent(),
    this.rating = const Value.absent(),
  });
  AbilitiesCompanion.insert({
    required int id,
    required String name,
    required String shortDesc,
    required String desc,
    required double rating,
  })   : id = Value(id),
        name = Value(name),
        shortDesc = Value(shortDesc),
        desc = Value(desc),
        rating = Value(rating);
  static Insertable<Ability> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? shortDesc,
    Expression<String>? desc,
    Expression<double>? rating,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (shortDesc != null) 'short_desc': shortDesc,
      if (desc != null) 'desc': desc,
      if (rating != null) 'rating': rating,
    });
  }

  AbilitiesCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? shortDesc,
      Value<String>? desc,
      Value<double>? rating}) {
    return AbilitiesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      shortDesc: shortDesc ?? this.shortDesc,
      desc: desc ?? this.desc,
      rating: rating ?? this.rating,
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
          ..write('id: $id, ')
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
  List<GeneratedColumn> get $columns => [id, name, shortDesc, desc, rating];
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

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $PokemonsTable pokemons = $PokemonsTable(this);
  late final $AbilitiesTable abilities = $AbilitiesTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [pokemons, abilities];
}

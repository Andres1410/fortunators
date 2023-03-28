// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memo_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MemoStruct> _$memoStructSerializer = new _$MemoStructSerializer();

class _$MemoStructSerializer implements StructuredSerializer<MemoStruct> {
  @override
  final Iterable<Type> types = const [MemoStruct, _$MemoStruct];
  @override
  final String wireName = 'MemoStruct';

  @override
  Iterable<Object?> serialize(Serializers serializers, MemoStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.text1;
    if (value != null) {
      result
        ..add('text_1')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.text2;
    if (value != null) {
      result
        ..add('text_2')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  MemoStruct deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MemoStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'text_1':
          result.text1 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'text_2':
          result.text2 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'firestoreUtilData':
          result.firestoreUtilData = serializers.deserialize(value,
                  specifiedType: const FullType(FirestoreUtilData))!
              as FirestoreUtilData;
          break;
      }
    }

    return result.build();
  }
}

class _$MemoStruct extends MemoStruct {
  @override
  final String? text1;
  @override
  final String? text2;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$MemoStruct([void Function(MemoStructBuilder)? updates]) =>
      (new MemoStructBuilder()..update(updates))._build();

  _$MemoStruct._({this.text1, this.text2, required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'MemoStruct', 'firestoreUtilData');
  }

  @override
  MemoStruct rebuild(void Function(MemoStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MemoStructBuilder toBuilder() => new MemoStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MemoStruct &&
        text1 == other.text1 &&
        text2 == other.text2 &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, text1.hashCode), text2.hashCode),
        firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MemoStruct')
          ..add('text1', text1)
          ..add('text2', text2)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class MemoStructBuilder implements Builder<MemoStruct, MemoStructBuilder> {
  _$MemoStruct? _$v;

  String? _text1;
  String? get text1 => _$this._text1;
  set text1(String? text1) => _$this._text1 = text1;

  String? _text2;
  String? get text2 => _$this._text2;
  set text2(String? text2) => _$this._text2 = text2;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  MemoStructBuilder() {
    MemoStruct._initializeBuilder(this);
  }

  MemoStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _text1 = $v.text1;
      _text2 = $v.text2;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MemoStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MemoStruct;
  }

  @override
  void update(void Function(MemoStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MemoStruct build() => _build();

  _$MemoStruct _build() {
    final _$result = _$v ??
        new _$MemoStruct._(
            text1: text1,
            text2: text2,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData, r'MemoStruct', 'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas

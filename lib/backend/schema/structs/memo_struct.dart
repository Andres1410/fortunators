import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'memo_struct.g.dart';

abstract class MemoStruct implements Built<MemoStruct, MemoStructBuilder> {
  static Serializer<MemoStruct> get serializer => _$memoStructSerializer;

  @BuiltValueField(wireName: 'text_1')
  String? get text1;

  @BuiltValueField(wireName: 'text_2')
  String? get text2;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(MemoStructBuilder builder) => builder
    ..text1 = ''
    ..text2 = ''
    ..firestoreUtilData = FirestoreUtilData();

  MemoStruct._();
  factory MemoStruct([void Function(MemoStructBuilder) updates]) = _$MemoStruct;
}

MemoStruct createMemoStruct({
  String? text1,
  String? text2,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MemoStruct(
      (m) => m
        ..text1 = text1
        ..text2 = text2
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

MemoStruct? updateMemoStruct(
  MemoStruct? memo, {
  bool clearUnsetFields = true,
}) =>
    memo != null
        ? (memo.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addMemoStructData(
  Map<String, dynamic> firestoreData,
  MemoStruct? memo,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (memo == null) {
    return;
  }
  if (memo.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && memo.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final memoData = getMemoFirestoreData(memo, forFieldValue);
  final nestedData = memoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = memo.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getMemoFirestoreData(
  MemoStruct? memo, [
  bool forFieldValue = false,
]) {
  if (memo == null) {
    return {};
  }
  final firestoreData = serializers.toFirestore(MemoStruct.serializer, memo);

  // Add any Firestore field values
  memo.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMemoListFirestoreData(
  List<MemoStruct>? memos,
) =>
    memos?.map((m) => getMemoFirestoreData(m, true)).toList() ?? [];

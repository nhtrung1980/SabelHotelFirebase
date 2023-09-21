import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HotelsRecord extends FirestoreRecord {
  HotelsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "logo" field.
  String? _logo;
  String get logo => _logo ?? '';
  bool hasLogo() => _logo != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "mobile" field.
  String? _mobile;
  String get mobile => _mobile ?? '';
  bool hasMobile() => _mobile != null;

  // "user_id" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _logo = snapshotData['logo'] as String?;
    _address = snapshotData['address'] as String?;
    _mobile = snapshotData['mobile'] as String?;
    _userId = snapshotData['user_id'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('hotels');

  static Stream<HotelsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HotelsRecord.fromSnapshot(s));

  static Future<HotelsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => HotelsRecord.fromSnapshot(s));

  static HotelsRecord fromSnapshot(DocumentSnapshot snapshot) => HotelsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HotelsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HotelsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HotelsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HotelsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHotelsRecordData({
  String? name,
  String? logo,
  String? address,
  String? mobile,
  String? userId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'logo': logo,
      'address': address,
      'mobile': mobile,
      'user_id': userId,
    }.withoutNulls,
  );

  return firestoreData;
}

class HotelsRecordDocumentEquality implements Equality<HotelsRecord> {
  const HotelsRecordDocumentEquality();

  @override
  bool equals(HotelsRecord? e1, HotelsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.logo == e2?.logo &&
        e1?.address == e2?.address &&
        e1?.mobile == e2?.mobile &&
        e1?.userId == e2?.userId;
  }

  @override
  int hash(HotelsRecord? e) => const ListEquality()
      .hash([e?.name, e?.logo, e?.address, e?.mobile, e?.userId]);

  @override
  bool isValidKey(Object? o) => o is HotelsRecord;
}

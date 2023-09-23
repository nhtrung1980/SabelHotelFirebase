import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RoomsRecord extends FirestoreRecord {
  RoomsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "hotel_id" field.
  String? _hotelId;
  String get hotelId => _hotelId ?? '';
  bool hasHotelId() => _hotelId != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "room_type_id" field.
  String? _roomTypeId;
  String get roomTypeId => _roomTypeId ?? '';
  bool hasRoomTypeId() => _roomTypeId != null;

  // "rule_id" field.
  String? _ruleId;
  String get ruleId => _ruleId ?? '';
  bool hasRuleId() => _ruleId != null;

  // "is_clearned" field.
  bool? _isClearned;
  bool get isClearned => _isClearned ?? false;
  bool hasIsClearned() => _isClearned != null;

  // "clearn_request_time" field.
  DateTime? _clearnRequestTime;
  DateTime? get clearnRequestTime => _clearnRequestTime;
  bool hasClearnRequestTime() => _clearnRequestTime != null;

  void _initializeFields() {
    _hotelId = snapshotData['hotel_id'] as String?;
    _name = snapshotData['name'] as String?;
    _roomTypeId = snapshotData['room_type_id'] as String?;
    _ruleId = snapshotData['rule_id'] as String?;
    _isClearned = snapshotData['is_clearned'] as bool?;
    _clearnRequestTime = snapshotData['clearn_request_time'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('rooms');

  static Stream<RoomsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RoomsRecord.fromSnapshot(s));

  static Future<RoomsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RoomsRecord.fromSnapshot(s));

  static RoomsRecord fromSnapshot(DocumentSnapshot snapshot) => RoomsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RoomsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RoomsRecord._(reference, mapFromFirestore(data));

  static RoomsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      RoomsRecord.getDocumentFromData(
        {
          'hotel_id': snapshot.data['hotel_id'],
          'name': snapshot.data['name'],
          'room_type_id': snapshot.data['room_type_id'],
          'rule_id': snapshot.data['rule_id'],
          'is_clearned': snapshot.data['is_clearned'],
          'clearn_request_time': safeGet(
            () => DateTime.fromMillisecondsSinceEpoch(
                snapshot.data['clearn_request_time']),
          ),
        },
        RoomsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<RoomsRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'rooms',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'RoomsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RoomsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRoomsRecordData({
  String? hotelId,
  String? name,
  String? roomTypeId,
  String? ruleId,
  bool? isClearned,
  DateTime? clearnRequestTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'hotel_id': hotelId,
      'name': name,
      'room_type_id': roomTypeId,
      'rule_id': ruleId,
      'is_clearned': isClearned,
      'clearn_request_time': clearnRequestTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class RoomsRecordDocumentEquality implements Equality<RoomsRecord> {
  const RoomsRecordDocumentEquality();

  @override
  bool equals(RoomsRecord? e1, RoomsRecord? e2) {
    return e1?.hotelId == e2?.hotelId &&
        e1?.name == e2?.name &&
        e1?.roomTypeId == e2?.roomTypeId &&
        e1?.ruleId == e2?.ruleId &&
        e1?.isClearned == e2?.isClearned &&
        e1?.clearnRequestTime == e2?.clearnRequestTime;
  }

  @override
  int hash(RoomsRecord? e) => const ListEquality().hash([
        e?.hotelId,
        e?.name,
        e?.roomTypeId,
        e?.ruleId,
        e?.isClearned,
        e?.clearnRequestTime
      ]);

  @override
  bool isValidKey(Object? o) => o is RoomsRecord;
}

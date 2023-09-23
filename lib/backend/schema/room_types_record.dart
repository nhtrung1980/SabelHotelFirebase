import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RoomTypesRecord extends FirestoreRecord {
  RoomTypesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "hotel_id" field.
  String? _hotelId;
  String get hotelId => _hotelId ?? '';
  bool hasHotelId() => _hotelId != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _hotelId = snapshotData['hotel_id'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('roomTypes');

  static Stream<RoomTypesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RoomTypesRecord.fromSnapshot(s));

  static Future<RoomTypesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RoomTypesRecord.fromSnapshot(s));

  static RoomTypesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RoomTypesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RoomTypesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RoomTypesRecord._(reference, mapFromFirestore(data));

  static RoomTypesRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      RoomTypesRecord.getDocumentFromData(
        {
          'name': snapshot.data['name'],
          'description': snapshot.data['description'],
          'hotel_id': snapshot.data['hotel_id'],
        },
        RoomTypesRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<RoomTypesRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'roomTypes',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'RoomTypesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RoomTypesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRoomTypesRecordData({
  String? name,
  String? description,
  String? hotelId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'hotel_id': hotelId,
    }.withoutNulls,
  );

  return firestoreData;
}

class RoomTypesRecordDocumentEquality implements Equality<RoomTypesRecord> {
  const RoomTypesRecordDocumentEquality();

  @override
  bool equals(RoomTypesRecord? e1, RoomTypesRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.hotelId == e2?.hotelId;
  }

  @override
  int hash(RoomTypesRecord? e) =>
      const ListEquality().hash([e?.name, e?.description, e?.hotelId]);

  @override
  bool isValidKey(Object? o) => o is RoomTypesRecord;
}

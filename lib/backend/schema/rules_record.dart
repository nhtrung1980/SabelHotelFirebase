import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RulesRecord extends FirestoreRecord {
  RulesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "hotel_id" field.
  String? _hotelId;
  String get hotelId => _hotelId ?? '';
  bool hasHotelId() => _hotelId != null;

  // "check_in" field.
  DateTime? _checkIn;
  DateTime? get checkIn => _checkIn;
  bool hasCheckIn() => _checkIn != null;

  // "check_out" field.
  DateTime? _checkOut;
  DateTime? get checkOut => _checkOut;
  bool hasCheckOut() => _checkOut != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "surcharge_per_hour" field.
  double? _surchargePerHour;
  double get surchargePerHour => _surchargePerHour ?? 0.0;
  bool hasSurchargePerHour() => _surchargePerHour != null;

  // "extra_adult_price" field.
  double? _extraAdultPrice;
  double get extraAdultPrice => _extraAdultPrice ?? 0.0;
  bool hasExtraAdultPrice() => _extraAdultPrice != null;

  // "extra_children_price" field.
  double? _extraChildrenPrice;
  double get extraChildrenPrice => _extraChildrenPrice ?? 0.0;
  bool hasExtraChildrenPrice() => _extraChildrenPrice != null;

  // "round_minute_to_hour" field.
  int? _roundMinuteToHour;
  int get roundMinuteToHour => _roundMinuteToHour ?? 0;
  bool hasRoundMinuteToHour() => _roundMinuteToHour != null;

  // "friday_price" field.
  double? _fridayPrice;
  double get fridayPrice => _fridayPrice ?? 0.0;
  bool hasFridayPrice() => _fridayPrice != null;

  // "saturday_price" field.
  double? _saturdayPrice;
  double get saturdayPrice => _saturdayPrice ?? 0.0;
  bool hasSaturdayPrice() => _saturdayPrice != null;

  // "sunday_price" field.
  double? _sundayPrice;
  double get sundayPrice => _sundayPrice ?? 0.0;
  bool hasSundayPrice() => _sundayPrice != null;

  // "holiday_price" field.
  double? _holidayPrice;
  double get holidayPrice => _holidayPrice ?? 0.0;
  bool hasHolidayPrice() => _holidayPrice != null;

  // "is_day_price" field.
  bool? _isDayPrice;
  bool get isDayPrice => _isDayPrice ?? false;
  bool hasIsDayPrice() => _isDayPrice != null;

  // "start_block_hour" field.
  int? _startBlockHour;
  int get startBlockHour => _startBlockHour ?? 0;
  bool hasStartBlockHour() => _startBlockHour != null;

  // "start_block_price" field.
  double? _startBlockPrice;
  double get startBlockPrice => _startBlockPrice ?? 0.0;
  bool hasStartBlockPrice() => _startBlockPrice != null;

  // "next_hour_price" field.
  double? _nextHourPrice;
  double get nextHourPrice => _nextHourPrice ?? 0.0;
  bool hasNextHourPrice() => _nextHourPrice != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _hotelId = snapshotData['hotel_id'] as String?;
    _checkIn = snapshotData['check_in'] as DateTime?;
    _checkOut = snapshotData['check_out'] as DateTime?;
    _price = castToType<double>(snapshotData['price']);
    _surchargePerHour = castToType<double>(snapshotData['surcharge_per_hour']);
    _extraAdultPrice = castToType<double>(snapshotData['extra_adult_price']);
    _extraChildrenPrice =
        castToType<double>(snapshotData['extra_children_price']);
    _roundMinuteToHour = castToType<int>(snapshotData['round_minute_to_hour']);
    _fridayPrice = castToType<double>(snapshotData['friday_price']);
    _saturdayPrice = castToType<double>(snapshotData['saturday_price']);
    _sundayPrice = castToType<double>(snapshotData['sunday_price']);
    _holidayPrice = castToType<double>(snapshotData['holiday_price']);
    _isDayPrice = snapshotData['is_day_price'] as bool?;
    _startBlockHour = castToType<int>(snapshotData['start_block_hour']);
    _startBlockPrice = castToType<double>(snapshotData['start_block_price']);
    _nextHourPrice = castToType<double>(snapshotData['next_hour_price']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('rules');

  static Stream<RulesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RulesRecord.fromSnapshot(s));

  static Future<RulesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RulesRecord.fromSnapshot(s));

  static RulesRecord fromSnapshot(DocumentSnapshot snapshot) => RulesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RulesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RulesRecord._(reference, mapFromFirestore(data));

  static RulesRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      RulesRecord.getDocumentFromData(
        {
          'name': snapshot.data['name'],
          'hotel_id': snapshot.data['hotel_id'],
          'check_in': safeGet(
            () =>
                DateTime.fromMillisecondsSinceEpoch(snapshot.data['check_in']),
          ),
          'check_out': safeGet(
            () =>
                DateTime.fromMillisecondsSinceEpoch(snapshot.data['check_out']),
          ),
          'price': snapshot.data['price']?.toDouble(),
          'surcharge_per_hour': snapshot.data['surcharge_per_hour']?.toDouble(),
          'extra_adult_price': snapshot.data['extra_adult_price']?.toDouble(),
          'extra_children_price':
              snapshot.data['extra_children_price']?.toDouble(),
          'round_minute_to_hour':
              snapshot.data['round_minute_to_hour']?.round(),
          'friday_price': snapshot.data['friday_price']?.toDouble(),
          'saturday_price': snapshot.data['saturday_price']?.toDouble(),
          'sunday_price': snapshot.data['sunday_price']?.toDouble(),
          'holiday_price': snapshot.data['holiday_price']?.toDouble(),
          'is_day_price': snapshot.data['is_day_price'],
          'start_block_hour': snapshot.data['start_block_hour']?.round(),
          'start_block_price': snapshot.data['start_block_price']?.toDouble(),
          'next_hour_price': snapshot.data['next_hour_price']?.toDouble(),
        },
        RulesRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<RulesRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'rules',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'RulesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RulesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRulesRecordData({
  String? name,
  String? hotelId,
  DateTime? checkIn,
  DateTime? checkOut,
  double? price,
  double? surchargePerHour,
  double? extraAdultPrice,
  double? extraChildrenPrice,
  int? roundMinuteToHour,
  double? fridayPrice,
  double? saturdayPrice,
  double? sundayPrice,
  double? holidayPrice,
  bool? isDayPrice,
  int? startBlockHour,
  double? startBlockPrice,
  double? nextHourPrice,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'hotel_id': hotelId,
      'check_in': checkIn,
      'check_out': checkOut,
      'price': price,
      'surcharge_per_hour': surchargePerHour,
      'extra_adult_price': extraAdultPrice,
      'extra_children_price': extraChildrenPrice,
      'round_minute_to_hour': roundMinuteToHour,
      'friday_price': fridayPrice,
      'saturday_price': saturdayPrice,
      'sunday_price': sundayPrice,
      'holiday_price': holidayPrice,
      'is_day_price': isDayPrice,
      'start_block_hour': startBlockHour,
      'start_block_price': startBlockPrice,
      'next_hour_price': nextHourPrice,
    }.withoutNulls,
  );

  return firestoreData;
}

class RulesRecordDocumentEquality implements Equality<RulesRecord> {
  const RulesRecordDocumentEquality();

  @override
  bool equals(RulesRecord? e1, RulesRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.hotelId == e2?.hotelId &&
        e1?.checkIn == e2?.checkIn &&
        e1?.checkOut == e2?.checkOut &&
        e1?.price == e2?.price &&
        e1?.surchargePerHour == e2?.surchargePerHour &&
        e1?.extraAdultPrice == e2?.extraAdultPrice &&
        e1?.extraChildrenPrice == e2?.extraChildrenPrice &&
        e1?.roundMinuteToHour == e2?.roundMinuteToHour &&
        e1?.fridayPrice == e2?.fridayPrice &&
        e1?.saturdayPrice == e2?.saturdayPrice &&
        e1?.sundayPrice == e2?.sundayPrice &&
        e1?.holidayPrice == e2?.holidayPrice &&
        e1?.isDayPrice == e2?.isDayPrice &&
        e1?.startBlockHour == e2?.startBlockHour &&
        e1?.startBlockPrice == e2?.startBlockPrice &&
        e1?.nextHourPrice == e2?.nextHourPrice;
  }

  @override
  int hash(RulesRecord? e) => const ListEquality().hash([
        e?.name,
        e?.hotelId,
        e?.checkIn,
        e?.checkOut,
        e?.price,
        e?.surchargePerHour,
        e?.extraAdultPrice,
        e?.extraChildrenPrice,
        e?.roundMinuteToHour,
        e?.fridayPrice,
        e?.saturdayPrice,
        e?.sundayPrice,
        e?.holidayPrice,
        e?.isDayPrice,
        e?.startBlockHour,
        e?.startBlockPrice,
        e?.nextHourPrice
      ]);

  @override
  bool isValidKey(Object? o) => o is RulesRecord;
}

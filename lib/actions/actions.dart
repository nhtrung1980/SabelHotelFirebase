import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

Future getHotel(BuildContext context) async {
  HotelsRecord? hotel;

  hotel = await queryHotelsRecordOnce(
    queryBuilder: (hotelsRecord) =>
        hotelsRecord.where('user_id', isEqualTo: currentUserUid),
    singleRecord: true,
  ).then((s) => s.firstOrNull);
}

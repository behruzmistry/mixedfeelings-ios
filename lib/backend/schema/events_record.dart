import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';



import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EventsRecord extends FirestoreRecord {
  EventsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "eventName" field.
  String? _eventName;
  String get eventName => _eventName ?? '';
  bool hasEventName() => _eventName != null;

  // "eventDate" field.
  DateTime? _eventDate;
  DateTime? get eventDate => _eventDate;
  bool hasEventDate() => _eventDate != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  bool hasLocation() => _location != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "imagePath" field.
  String? _imagePath;
  String get imagePath => _imagePath ?? '';
  bool hasImagePath() => _imagePath != null;

  void _initializeFields() {
    _eventName = snapshotData['eventName'] as String?;
    _eventDate = snapshotData['eventDate'] as DateTime?;
    _location = snapshotData['location'] as String?;
    _description = snapshotData['description'] as String?;
    _imagePath = snapshotData['imagePath'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('events');

  static Stream<EventsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EventsRecord.fromSnapshot(s));

  static Future<EventsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EventsRecord.fromSnapshot(s));

  static EventsRecord fromSnapshot(DocumentSnapshot snapshot) => EventsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EventsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EventsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EventsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EventsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEventsRecordData({
  String? eventName,
  DateTime? eventDate,
  String? location,
  String? description,
  String? imagePath,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'eventName': eventName,
      'eventDate': eventDate,
      'location': location,
      'description': description,
      'imagePath': imagePath,
    }.withoutNulls,
  );

  return firestoreData;
}

class EventsRecordDocumentEquality implements Equality<EventsRecord> {
  const EventsRecordDocumentEquality();

  @override
  bool equals(EventsRecord? e1, EventsRecord? e2) {
    return e1?.eventName == e2?.eventName &&
        e1?.eventDate == e2?.eventDate &&
        e1?.location == e2?.location &&
        e1?.description == e2?.description &&
        e1?.imagePath == e2?.imagePath;
  }

  @override
  int hash(EventsRecord? e) => const ListEquality().hash(
      [e?.eventName, e?.eventDate, e?.location, e?.description, e?.imagePath]);

  @override
  bool isValidKey(Object? o) => o is EventsRecord;
}

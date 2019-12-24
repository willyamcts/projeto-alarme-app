import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class Data {
  Data({
    this.id,
    this.owner,
    @required this.active,
    this.lastActive
  });

  final String id;
  final bool active;
  final int lastActive;
  final String owner;

  factory Data.fromFirestore(DocumentSnapshot taskSnapshot) {
    Map data = taskSnapshot.data;

    return Data(
      id: taskSnapshot.documentID,
      active: data['done'] ?? false,
      lastActive: data['lastActive'] ?? '',
      owner: data['owner'] ?? null
    );
  }
}
import 'package:alarme_app/model/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DataService {

  static final _path = 'tasks';
  static final Firestore _db = Firestore.instance;
  static final _collection = _db.collection(_path);




  Future<List<Data>> getTasks() async {
    try {
      QuerySnapshot tasks = await _collection.getDocuments();

      return tasks.documents
        .map((DocumentSnapshot document) => Data.fromFirestore(document))
        .toList();

    } catch (error) {
      print(error);
      return null;
    }
  }


}



// code to commit
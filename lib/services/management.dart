import 'package:firebase_database/firebase_database.dart';

// root key db;
String owner = 'laT1udjSw8VORuaYuW15-Mec_Castro';

/*
  Docs with fields
 */
String docState = owner + '/state/';


/*
  Fields in db
*/
String fieldState = docState + 'on';
String fieldBootHour = owner + '/bootHour';
String fieldUptimeOn = docState + 'uptimeOn';





DatabaseReference dbRef = new FirebaseDatabase().reference();

// push(): create key random
// dbRef.child('Teste').push().set({})




dynamic gets(String field) {
  return (
      dbRef.child(field).once().then((DataSnapshot snapshot) {
    print('Key: ${snapshot.key} - ' + 'Data: ${snapshot.value}');
  })
  );
}



void createDoc() {

  dbRef.child(owner + '/boot').set({
    'on': 0
  }).then((_) {
    print('Documentos criado.');
  });
}



void post() {
}




// Get state on/off alarm
bool getState() {
  bool state;

  dbRef.child(fieldState).once().then((DataSnapshot snapshot) {
    state = snapshot.value;
    print('Key: ${snapshot.key} - ' + 'Data: ${snapshot.value}');
  });

  return state;
}


// desusing
bool updateState(int state) {

  dbRef.child(docState).update({
    'on' : state,
  }).then((_) {

    print('State alterado para: ${state}');
  });

}



double getUptimeOn(){
  return gets(fieldUptimeOn);
}




bool toBool(int value) {
  if (value == 1) {
    return true;
  } else {
    return false;
  }
}



/*

  FIRESTORE - CLOUD

    Firestore.instance.collection('teste').document('main').setData({
      'on': false,
    });

 */
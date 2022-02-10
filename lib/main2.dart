
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key,  this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  //final Stream<QuerySnapshot>_userStream=FirebaseFirestore.instance.collection('n').where('dd',isEqualTo: 'vlxx.com').snapshots();
  final Stream<QuerySnapshot>_userStream=FirebaseFirestore.instance.collection('n').snapshots();
  CollectionReference _user=FirebaseFirestore.instance.collection('n');

  Future<void> _addDoc()  {
    return _user.add({
      'dd':'cai lon be nhu dep lam'
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),

      body: StreamBuilder<QuerySnapshot>(
        stream: _userStream,
        builder: (
        BuildContext context,
        AsyncSnapshot<QuerySnapshot>snapshot,
        ){
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }
          if(!snapshot.hasData)return const SizedBox.shrink();

           return ListView.builder(
               itemCount: snapshot.data?.docs.length,
               itemBuilder: (BuildContext context,int index){
                 Map<String,dynamic> docData=snapshot.data?.docs[index].data() as Map<String,dynamic>;
                 final dataText= docData['dd'] as String ;
                return ListTile(
                  title: Text(dataText),
                );
           });
          //------------------------------------------------------
          // return ListView(
          //     children: snapshot.data!.docs.map((DocumentSnapshot document) {
          //   Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
          //   return ListTile(
          //     title: Text(data['dd']),
          //   );
          // }).toList());

        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addDoc,
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

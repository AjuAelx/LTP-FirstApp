import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/LoginScreen.dart';
import 'package:flutter_application_1/data_model/NotesProvider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'IndividualDest.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePage createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  SharedPreferences logindata;
  bool username;

  @override
  void initState() {
    super.initState();
    checkAlready();
  }
  //sobin007

  void checkAlready() async {
    logindata = await SharedPreferences.getInstance();
    username = (logindata.getBool('login') ?? true);
    if (username == false) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    int len;
    return Scaffold(
      // body: Container(
      //   children: [
      //     OrientationBuilder(builder: (context, orientation) {
      //       return new CustomScrollView(
      //         slivers: <Widget>[
      //           SliverAppBar(
      //             backgroundColor: Color.fromRGBO(20, 59, 84, 1),
      //             pinned: true,
      //             snap: true,
      //             elevation: 50,
      //             floating: true,
      //             expandedHeight: 200.0,
      //             flexibleSpace: FlexibleSpaceBar(
      //               title: Text(
      //                 'Gods Own Country',
      //                 style: TextStyle(
      //                     fontSize: 16, fontWeight: FontWeight.bold),
      //               ),
      //               centerTitle: true,
      //               background: Image.network(
      //                 'https://www.ekeralatourism.net/wp-content/uploads/2018/03/Alleppey.jpg',
      //                 fit: BoxFit.cover,
      //               ),
      //             ),
      //             leading: Icon(Icons.arrow_back),
      //             actions: [
      //               Icon(Icons.explore),
      //               SizedBox(width: 12),
      //             ],
      //           ),
      //         ],
      //       );
      //     })
      //   ],
      // ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Color.fromRGBO(20, 59, 84, 1),
            pinned: true,
            snap: true,
            elevation: 50,
            floating: true,
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Gods Own Country',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
              background: Image.asset(
                // https://img.onmanorama.com/content/dam/mm/en/travel/getting-about-kerala/Idukki/images/2018/11/26/munnar-trip.jpg
                'assets/munnarHill.jpg',
                // https://www.ekeralatourism.net/wp-content/uploads/2018/03/Alleppey.jpg
                fit: BoxFit.cover,
              ),
            ),
            leading: Icon(Icons.arrow_back),
            actions: [
              // PopupMenuButton<String>(
              //   onSelected: choiceAction,
              //   itemBuilder: (BuildContext context) {
              //     return MenuItems.choices.map((String choice) {
              //       return PopupMenuItem<String>(
              //           value: choice, child: Text(choice));
              //     }).toList();
              //   },
              // ),
              IconButton(
                  icon: new Icon(Icons.logout),
                  onPressed: () {
                    logindata.setBool('login', false);
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  }),
            ],
          ),
          Consumer<NotesProvider>(
            builder: (context, data, child) {
              len = data.getNotes.length;
              // GestureDetector(
              //   onTap: () => ,
              // );
              // len = data.getNotes.length;
              if (data.getNotes.length != 0) {
                return SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    return Consumer<NotesProvider>(
                        builder: (context, data, child) {
                      len = data.getNotes.length;
                      if (data.getNotes.length != 0) {
                        return NewGridView(data.getNotes[index], index);
                      } else {
                        return Center(
                          child: Text((data.getNotes.length).toString()),
                        );
                      }
                    });
                  }, childCount: len),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 2,
                    crossAxisSpacing: 2,
                  ),
                );
              } else {
                return Center(
                  child: Text((data.getNotes.length).toString()),
                );
              }
            },
          ),
          // SliverGrid(
          //   delegate:
          //       SliverChildBuilderDelegate((BuildContext context, int index) {
          //     return Consumer<NotesProvider>(builder: (context, data, child) {
          //       len = data.getNotes.length;
          //       // len = data.getNotes.length;
          //       if (data.getNotes.length != 0) {
          //         return NewGridView(data.getNotes[index], index);
          //       } else {
          //         return Center(
          //           child: Text((data.getNotes.length).toString()),
          //         );
          //       }
          //     });
          //   }, childCount: len),
          //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //     crossAxisCount: 2,
          //     mainAxisSpacing: 2,
          //     crossAxisSpacing: 2,
          //   ),
          // ),
          //     // body: Consumer<NotesProvider>(
          //     //   builder: (context, data, child) {
          //     //     if (data.getNotes.length != 0) {
          //     //       return GridView.builder(
          //     //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //     //           crossAxisCount: 2,
          //     //         ),
          //     //         itemCount: data.getNotes.length,
          //     //         itemBuilder: (context, index) {
          //     //           return NewGridView(data.getNotes[index], index);
          //     //         },
          //     //       );
          //     //     } else {
          //     //       return Center(
          //     //         child: Text("oops"),
          //     //       );
          //     //     }
          //     //   },
          //     // ),

          //     //   // SliverGrid(
          //     //   //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //     //   //     ///no.of items in the horizontal axis
          //     //   //     crossAxisCount: 2,
          //     //   //     mainAxisSpacing: 2,
          //     //   //     crossAxisSpacing: 2,
          //     //   //   ),

          //     //   //   ///Lazy building of list
          //     //   //   delegate: SliverChildBuilderDelegate(
          //     //   //     (BuildContext context, int index) {
          //     //   //       /// To convert this infinite list to a list with "n" no of items,
          //     //   //       /// uncomment the following line:
          //     //   //       /// if (index > n) return null;
          //     //   //       /// return listItem("Sliver Grid item:\n$index");
          //     //   //       return listItem();
          //     //   //     },

          //     //   //     /// Set childCount to limit no.of items
          //     //   //     /// childCount: 100,
          //     //   //   ),
          //     //   // ),
          //     //   // SliverList(delegate: SliverChildListDelegate(_gridList(6)),)
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialogBox(context);
        },
        icon: Icon(Icons.add),
        backgroundColor: Color.fromRGBO(20, 59, 84, 1),
        label: Text('New Destination'),
      ),
    );
  }

  // Widget listItem() => Card(
  //       clipBehavior: Clip.antiAliasWithSaveLayer,
  //       elevation: 1,
  //     );
}

class NewGridView extends StatelessWidget {
  final Notes notes;
  final int index;

  NewGridView(this.notes, this.index);
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    IndividualDest(notes.title, notes.imageUrl)));
      },
      child: Card(
        elevation: 4,
        // semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Column(
          children: <Widget>[
            Image(
              image: AssetImage(notes.imageUrl),
              fit: BoxFit.cover,
              height: 120,
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: new Text(
                notes.title,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void showDialogBox(BuildContext context) {
  TextEditingController _titleController = new TextEditingController();
  TextEditingController _descController = new TextEditingController();
  AlertDialog alertDialog = AlertDialog(
    title: Text('Add new destination'),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: _titleController,
          decoration: InputDecoration(hintText: 'Destination'),
        ),
        TextField(
          controller: _descController,
          decoration: InputDecoration(hintText: 'Image URL'),
        ),
      ],
    ),
    actions: [
      TextButton(
          onPressed: () {
            Provider.of<NotesProvider>(context, listen: false)
                .addNotes(_titleController.text, _descController.text);
            Navigator.of(context).pop();
          },
          child: Text('Add Place'))
    ],
  );
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialog;
      });
}

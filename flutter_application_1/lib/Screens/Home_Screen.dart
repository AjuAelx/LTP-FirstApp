import 'package:flutter/material.dart';
import 'package:flutter_application_1/Data_Model/Notes.dart';
import 'package:flutter_application_1/Data_Model/NotesProvider.dart';
import 'package:flutter_application_1/Screens/timer_screen.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import 'HomePage.dart';
import 'LoginScreen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: Icon(Icons.menu),
        title: Text('swissnotes'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Swiss Notes',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.indigo,
                image: DecorationImage(
                  image: NetworkImage('https://www.ekeralatourism.net/wp-content/uploads/2018/03/Alleppey.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyHomePage()));
              },
            ),
            ListTile(
              title: Text('Timer'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TimerScreen()),
                );
              },
            ),
            ListTile(
              title: Text('Login'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
            ),
          ],
        ),
      ),
      body: Consumer<NotesProvider>(
        builder: (context, data, child) {
          return data.getNotes.length != 0
              ? ListView.builder(
                  itemCount: data.getNotes.length,
                  itemBuilder: (context, index) {
                    return NewCardList(data.getNotes[index], index);
                  })
              : Center(
                  child: Text('Add Notes'),
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialogBox(context);
        },
        backgroundColor: Colors.indigo,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

void showDialogBox(BuildContext context) {
  TextEditingController _titleController = new TextEditingController();
  TextEditingController _descController = new TextEditingController();
  AlertDialog alertDialog = AlertDialog(
    title: Text('Add a note'),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: _titleController,
          decoration: InputDecoration(hintText: 'Enter title'),
        ),
        TextField(
          controller: _descController,
          decoration: InputDecoration(hintText: 'Enter description'),
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
          child: Text('Add Note'))
    ],
  );
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialog;
      });
}

class NewCardList extends StatelessWidget {
  final Notes notes;
  final int index;

  NewCardList(this.notes, this.index);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: Padding(
        padding: EdgeInsets.all(1.5),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.lightBlue,
            borderRadius: BorderRadius.circular(8),
          ),
          child: ListTile(
            leading: Icon(
              Icons.notes,
              color: Colors.white,
            ),
            title: Text(
              notes.title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              notes.description,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
      secondaryActions: [
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () {
            Provider.of<NotesProvider>(context, listen: false)
                .removeNotes(index);
          },
        )
      ],
    );
  }
}

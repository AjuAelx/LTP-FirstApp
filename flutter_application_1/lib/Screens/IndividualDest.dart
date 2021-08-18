import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/data_model/DescriptionAndOtherProvider.dart';
import 'package:provider/provider.dart';

class IndividualDest extends StatelessWidget {
  final String title;
  final String description;

  IndividualDest(this.title, this.description);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        iconTheme: new IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          title,
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: new Container(
        child: new SingleChildScrollView(
          child: Column(
            children: <Widget>[
              new Row(
                children: <Widget>[
                  new Expanded(
                    child: new Image.asset(
                      description,
                      fit: BoxFit.cover,
                      height: 150.0,
                    ),
                  ),
                ],
              ),
              new Column(
                children: [
                  new Row(
                    children: [
                      new Expanded(
                        child: Container(
                          height: 150.0,
                          child: new Card(
                            elevation: 1.0,
                            child: new Padding(
                              padding: EdgeInsets.all(8.0),
                              child: new Column(
                                children: <Widget>[
                                  new Row(
                                    children: [
                                      new Text(
                                        'Description about ' + title,
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                  new SizedBox(
                                    height: 10.0,
                                  ),
                                  Consumer<DescriptionProvider>(
                                    // ignore: missing_return
                                    builder: (context, data, child) {
                                      print(title);
                                    
                                      if (data.getDescriptions.length != 0) {

                                        return Row(
                                          children: [
                                            new Expanded(
                                              child: new Text(
                                                data.getDescriptions.indexOf(element),
                                                style: TextStyle(
                                                  fontSize: 12,
                                                ),
                                                textAlign: TextAlign.justify,
                                                maxLines: 10,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        );
                                      } else {
                                        return Row(
                                          children: [
                                            new Expanded(
                                              child: new Text(
                                                '$data',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.grey,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            new IconButton(
                                                icon: Icon(Icons.add),
                                                onPressed: () {
                                                  addDesPopup(context, title);
                                                }),
                                          ],
                                        );
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void addDesPopup(BuildContext context, String title) {
  // TextEditingController _titleController = new TextEditingController();
  TextEditingController _descController = new TextEditingController();
  AlertDialog alertDialog = AlertDialog(
    title: Text(
      'Describe about ',
      style: new TextStyle(fontSize: 14),
    ),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          maxLines: 5,
          keyboardType: TextInputType.multiline,
          controller: _descController,
          decoration: InputDecoration(hintText: 'Description'),
        ),
      ],
    ),
    actions: [
      TextButton(
        onPressed: () {
          Provider.of<DescriptionProvider>(context, listen: false)
              .addDescription(_descController.text, title);
          print(title + _descController.text);
          Navigator.of(context).pop();
        },
        child: Text('Save Description'),
      ),
    ],
  );
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialog;
      });
}

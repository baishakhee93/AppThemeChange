import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ThemeList {
  String name;
  int index;
  ThemeList({required this.name, required this.index});
}

class Price extends StatefulWidget {
  @override
  _PriceState createState() => _PriceState();
}

class _PriceState extends State<Price> {
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  int currentIndex = 0;
    String? person;
   String? age;
  String? job;

  // Default Radio Button Item
  String radioItem = 'Mango';

  // Group Value for Radio Button.
  int id = 1;
  //int _selectedRadioIndex = 1;
  List<int> _selectedRadioIndexList = [];

  List<ThemeList> fList = [
    ThemeList(
      index: 1,
      name: "Light Theme",
    ),
    ThemeList(
      index: 2,
      name: "Dark Theme",
    ),

  ];
  int CardNo = -1;
  @override
  void initState() {
    super.initState();
    cards.add(createCard());
  }

  var nameTECs = <TextEditingController>[];
  var ageTECs = <TextEditingController>[];
  var jobTECs = <TextEditingController>[];

  var cards = <Card>[];

  Card createCard() {
    var nameController = TextEditingController();
    var ageController = TextEditingController();
    var jobController = TextEditingController();
    nameTECs.add(nameController);
    ageTECs.add(ageController);
    jobTECs.add(jobController);
    _selectedRadioIndexList.add(0);
    CardNo = CardNo + 1;
    int thisCardNo = CardNo;

    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text('Service ${cards.length + 1}'),
          TextFormField(
            style: TextStyle(color: Colors.blue),
            controller: nameController,
            decoration: InputDecoration(labelText: 'Name'),
            onSaved: (val) {
              print('saved');
              person = val;

            },
            validator: (val) {
              print('validating');

            },
            /*
            onSaved: (String val) {
              person = val.toString();
            },*/
          ),

          TextFormField(
            onSaved: (val) {
              print('saved');
              age = val;

            },
            validator: (val) {
              print('validating');

            },

            style: TextStyle(color: Colors.blue),
            controller: ageController,
            decoration: InputDecoration(labelText: 'age'),
            /*validator: validatetext,
            onSaved: (String val) {
              age = val;
            },*/
          ),
          TextFormField(
            style: TextStyle(color: Colors.blue),
            controller: jobController,
            decoration: InputDecoration(labelText: 'Job'),
            onSaved: (val) {
              print('saved');
              job = val;

            },
            validator: (val) {
              print('validating');

            },
           /* validator: validatetext,
            onSaved: (String val) {
              job = val;
            },*/
          ),

          //Expanded(
          //            child: Container(
          //            height: 350.0,
          //            child:
          StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Column(
                  children: fList
                      .map((data) => Container(
                    width: 100,
                    child: RadioListTile(
                      title: Text("${data.name}"),
                      groupValue: id,
                      value: data.index,
                      onChanged: (val) {
                        setState(() {
                          radioItem = data.name;
                          id = data.index;
                          print(id);
                          print(radioItem);
                          print(val);
                          _selectedRadioIndexList[0] = val! ;
                        });
                      },
                    ),
                  ))
                      .toList(),
                );
              }),
          //)),

          /* CheckboxListTile(
        title: Text("title text"),
        value: checkedValue,
        onChanged: (newValue) {
                     setState(() {
                       checkedValue = newValue;
                     });
                   },
        //onChanged: (newValue) { ... },
        controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
      ), */

          SizedBox(height: 10),
        ],
      ),

      //   ),
    );
  }

  void _validateInputs() {
    print('button');
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _onDone();
    } else {}
  }

  _onDone() {
    updateProfile();
    List<PersonEntry> entries = [];
    for (int i = 0; i < cards.length; i++) {
      var name = nameTECs[i].text;
      var age = ageTECs[i].text;
      var job = jobTECs[i].text;
      entries.add(PersonEntry(name, age, job));
    }
  }

  ///////// Save to DB ////////////////////
  Future updateProfile() async {
    try {
      for (int i = 0; i < cards.length; i++) {
        var name = nameTECs[i].text;
        var age = ageTECs[i].text;
        var job = jobTECs[i].text;

        Map<String, dynamic> body = {'name': name, 'age': age, 'job': job};

        print(body);
        nameTECs[i].clear();
        //if(rang == true){

        Response response = await Dio()
            .post("http://192.168.1.102:8080/adddetails.php", data: body);
        print(response.statusCode);
        if (response.statusCode == 404) {
          print('404');
        }
        if (response.statusCode == 200) {
          nameTECs[i].clear();
        }
      }
    } catch (e) {
      print("Exception Caught: $e");
    }
  }

  ///////////////////////////////

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      //appBar: myAppBar(),
      //endDrawer: myDrawer(),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Form(
              key: _formKey,
              child: ListView.builder(
                itemCount: cards.length,
                itemBuilder: (BuildContext context, int index) {
                  return cards[index];
                },
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 2.0),
            color: Colors.grey,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //    Container(
                Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: FloatingActionButton(
                      heroTag: "btn1",
                      child: Icon(Icons.add),
                      onPressed: () => setState(() => cards.add(createCard())),
                      backgroundColor: Colors.green,
                    )

                  /*RaisedButton(
                  child: Text('Add new'),
                  onPressed: () => setState(() => cards.add(createCard())),
                ),*/
                ),
                Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: FloatingActionButton(
                      heroTag: "btn2",
                      child: Icon(Icons.remove),
                      onPressed: () => setState(() => cards.removeLast()),
                      backgroundColor: Colors.red,
                    )),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: FloatingActionButton(
                      heroTag: "btn3",
                      child: Icon(Icons.save),
                      onPressed: _validateInputs),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PersonEntry {
  final String name;
  final String age;
  final String studyJob;

  PersonEntry(this.name, this.age, this.studyJob);
  @override
  String toString() {
    return 'Person: name= $name, age= $age, study job= $studyJob';
  }
}

Size get preferredSize => Size.fromHeight(kToolbarHeight);

String? validatetext(String value) {
  if (value.length < 5)
    return 'More than 5 char is required';
  else
    return null;
}

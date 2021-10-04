import 'package:flutter/material.dart';

class CitySearchScreen extends StatefulWidget {
  const CitySearchScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CitySearchScreenState();
}

class _CitySearchScreenState extends State<CitySearchScreen> {
  final TextEditingController _cityTextController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Enter a city'),),
      body: Form(
        child: Row(
          children: <Widget>[
            Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: TextField(
                    controller: _cityTextController,
                    decoration: InputDecoration(
                      labelText: 'Enter a city',
                      hintText: 'Example: Chicago'
                    ),
                  ),
                )),
            IconButton(
                onPressed: (){
                  Navigator.pop(context, _cityTextController.text);
                },
                icon: Icon(Icons.search))
          ],
        ),
      ),
    );
  }
}

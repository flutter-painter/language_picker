import 'package:flutter/material.dart';

import 'package:language_picker/languages.dart';
import 'package:language_picker/language_picker.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'language_picker Example',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
        buttonTheme: const ButtonThemeData(
          buttonColor: Color(0xFF0097A7),
          textTheme: ButtonTextTheme.normal,
        ),
        indicatorColor: Color(0xfffffe9d),
      ),
      home: MyHomePage(title: 'language_picker Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Language _selectedDialogLanguage = Languages.korean;

  // It's sample code of Dropdown Item.

  // It's sample code of Dialog Item.
  Widget _buildDialogItem(Language language) => ListTile(
        leading: CircleAvatar(
          child: Text(language.name.isEmpty
              ? language.nameEn.substring(0, 1).toUpperCase()
              : language.name.substring(0, 1).toUpperCase()),
        ),
        title: Text(language.name),
        subtitle: Text(language.nameEn),
      );

  void _openLanguagePickerDialog() => showDialog(
        context: context,
        builder: (context) => Theme(
            data: Theme.of(context),
            child: LanguagePickerDialog(
                // searchCursorColor: Colors.pinkAccent,
                searchInputDecoration:
                    InputDecoration(icon: const Icon(Icons.search)),
                isSearchable: true,
                title: const Icon(Icons.translate,
                    size: 44), // Text('Select your language'),
                onValuePicked: (Language language) => setState(() {
                      // _selectedDialogLanguage = language;
                    }),
                itemBuilder: _buildDialogItem)),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.translate, size: 44),
                onPressed: _openLanguagePickerDialog,
              ),
            ]),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

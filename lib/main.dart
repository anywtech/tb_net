import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tb_net/pages/dispatcher.dart';
import 'package:tb_net/providers/login_form.dart';
import 'package:tb_net/utils/locator.dart';
import 'package:tb_net/utils/routers.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  setupLocator();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginFormProvider>(
          create: (_) => LoginFormProvider(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          // brightness: Brightness.light,
          primaryColor: Colors.orange,
          accentColor: Colors.red,

          // Define the default font family.
          fontFamily: 'Georgia',

          // Define the default TextTheme. Use this to specify the default
          // text styling for headlines, titles, bodies of text, and more.
          textTheme: TextTheme(
            headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
            bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
          ),
        ),
        home: Dispatcher(),
        onGenerateRoute: Routers.materialPageRoute,
      ),
    );
  }
}

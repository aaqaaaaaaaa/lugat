import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'entity/element_card.dart';
import 'home_page.dart';
import 'styles/styles.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter<ElementCard>(ElementCardAdapter());
  await Hive.openBox<ElementCard>('group_box');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          textTheme: textTheme,
          buttonTheme: const ButtonThemeData(
            buttonColor:  Colors.black26,

          ),
        ),
      home:  InOnePage(labelIndex: 0, index:0 )
    );
  }
}
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   // int labelIndex = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Главный экран'),
//         centerTitle: true,
//       ),
//       body: ListView.builder(
//         itemCount: Labels.sample.length,
//         itemBuilder: (context, index) {
//           return ElevatedButton(
//             onPressed: () {
//               Labels.sample[index].listValuesAdd(index);
//               Labels.sample[index].listKeysAdd(index);
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) =>
//                         InOnePage(labelIndex: index, index: index),
//                   ));
//             },
//             style: buttonStyle,
//             child: Text(Labels.sample[index].label),
//           );
//         },
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//       ),
//     );
//   }
// }
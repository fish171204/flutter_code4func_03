import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Code4Function 03'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  double _width = 50;
  double _height = 50;
  GlobalKey textKey = GlobalKey();
  GlobalKey btnKey = GlobalKey();

  void _incrementCounter() {
    setState(() {
      _counter++;

      // build UI -> setState() neu co -> build UI
      _height += 10;
      _width += 10;
    });

    RenderBox? renderText =
        textKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderText != null) {
      print(renderText.localToGlobal(Offset.zero));
      print(renderText.size);
    }

    print("---------------------");

    RenderBox? renderBtnBtn =
        btnKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBtnBtn != null) {
      print(renderBtnBtn.localToGlobal(Offset.zero));
      print(renderBtnBtn.size);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              key: textKey,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Container(
              color: Colors.red,
              height: _height,
              width: _width,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        key: btnKey,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

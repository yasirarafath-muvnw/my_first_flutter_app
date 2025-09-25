import 'package:flutter/material.dart';
import 'package:flutter_application_1/details_page.dart';

void main() {
  runApp(const MyApp()); 
  // like AppRegistry.registerComponent in RN
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      // like NavigationContainer + ThemeProvider
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true, // modern Material design
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      // like setting initialRoute or Stack.Navigator initialScreen
    );
  }
}

class MyHomePage extends StatefulWidget {
  // like a RN component with useState hooks
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0; // state variable

  void _incrementCounter() {
    setState(() => _counter++); // like setState in RN class components
  }

  void _resetCounter() {
    setState(() => _counter = 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // like a top-level Screen with header + body + FAB
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(widget.title),
      ),
      body: Center(
        // like <View style={{alignItems:'center', justifyContent:'center'}}>
        child: Padding(
          padding: const EdgeInsets.all(16), // RN style={{padding:16}}
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, 
            // flexbox alignItems in RN
            children: <Widget>[
              const Text(
                "Hello Flutter!",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ), // like RN <Text style={...}>
              ),
              const SizedBox(height: 10), // RN <View style={{height:10}} />
              Text(
                "Counter value: $_counter",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 30),
              Row(
                // RN flexDirection:"row"
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    // like RN <Button> with default Material style
                    onPressed: _incrementCounter,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "Increment",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DetailsPage(),
                          // like navigation.navigate("Details")
                        ),
                      );
                    },
                    child: const Text("Go to Details"),
                  ),
                  const SizedBox(width: 16),
                  OutlinedButton(
                    // like RN Pressable + border styling
                    onPressed: _resetCounter,
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.deepPurple),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                    ),
                    child: const Text(
                      "Reset",
                      style: TextStyle(color: Colors.deepPurple, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // like RN floatingActionButton prop in Paper or custom absolute button
        onPressed: _incrementCounter,
        tooltip: "Increment",
        backgroundColor: Colors.deepPurple,
        child: const Icon(Icons.add),
      ),
    );
  }
}

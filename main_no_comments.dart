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
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  final GlobalKey<FormFieldState<String>> _formFieldKey = GlobalKey();
  List<String> notes = [];

  void createNote(BuildContext context) {
    if (_formFieldKey.currentState!.validate()) {
      setState(() {
        notes.add(_formFieldKey.currentState!.value!);
      });

      Form.of(context).reset();
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
          children: [
            SizedBox(height: 30),
            Form(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 200,
                    child: Builder(
                      builder: (context) {
                        return TextFormField(
                          key: _formFieldKey,
                          onFieldSubmitted: (value) {
                            createNote(context);
                          }, //optional
                          // . . .
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Note cannot be empty";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            labelText: "Enter your note!",
                          ),
                        );
                      },
                    ),
                  ),
                  Builder(
                    builder: (BuildContext context) {
                      return ElevatedButton(
                        onPressed: () {
                          createNote(context);
                        },
                        child: const Row(
                          children: [
                            Icon(Icons.note_add),
                            Text(" Create note!"),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
            SizedBox(
              width: 400,
              child: ListView.separated(
                itemBuilder: (context, i) {
                  return ListTile(
                    title: Text(notes[i]),
                    leading: Icon(Icons.note),
                    trailing: IconButton(
                      onPressed: () {
                        setState(() {
                          notes.removeAt(i);
                        });
                      },
                      icon: Icon(Icons.delete_forever),
                    ),
                  );
                },
                separatorBuilder: (_, _) {
                  return Divider();
                },
                itemCount: notes.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  //this command blows up the widget you pass inside to the entire app viewport.
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //defines that this app is a 'material style' app, Google's design system
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        //Here we define the color scheme that we use for
        //the entire app, unifying the design
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      // establish app body as the MyHomePage Widget, which is defined below
      home: const MyHomePage(title: 'FOSS Note-taker'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  //when creating a Stateful Widget, the State needs to be initialized on build, the core of the widget is below.
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //This globalKey gives us global access to the TextField below,
  //which we use for setting new states in the method 'createNote()'
  final GlobalKey<FormFieldState<String>> _formFieldKey = GlobalKey();

  //this is where we store our notes. This is a 'State' and we
  //update it throughout the runtime of the app.
  List<String> notes = [];

  //this method adds the value in our TextField using the GlobalKey defined earlier,
  //and
  void createNote(BuildContext context) {
    if (_formFieldKey.currentState!.validate()) {
      //the setState method tells the app the state has changed, and should rebuild to reflect those changes
      setState(() {
        //since we want to update our notes list, we put
        //the command inside of setState(), and perform our change.
        notes.insert(0, (_formFieldKey.currentState!.value!));
      });

      //this clears the TextField of any input, so the user
      //can start a new note immediately. This is purely for
      //user experience purposes.
      Form.of(context).reset();
    }
  }

  //The build method is what tells the app how to build our widget.
  //This is where we return exactly what we want displayed for the
  //body of the app.
  @override
  Widget build(BuildContext context) {
    //in the build method, we return the widget tree we construct for our app.
    //Scaffold defines the structure of our app, and gives us a few ways to
    //do so through arguments passed at initialization.
    return Scaffold(
      //the appBar is the bar that shows up at the top of the screen.
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      //this is the body of our app, below the appBar
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Form is a functional widget (not visible) and allows us to group
            //multiple input widgets for easy management. This allows the
            //elevatedButton to interact with the TextFormField
            Form(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 300,
                    //Builder widgets provide a BuildContext for its children to access.
                    //BuildContext allows widgets to understand where in the
                    //widget tree it is located so it can interact with its ancestors.
                    //In this case, we use it so we can clear the Form contents
                    //in the createNote method.
                    child: Builder(
                      builder: (context) {
                        return TextFormField(
                          //this is the key we made earlier for global access to this widget
                          key: _formFieldKey,
                          //this argument defines what happens when we press enter when
                          //focused on the TextField. In this case, createNote!
                          onFieldSubmitted: (value) {
                            //notice how we pass context from the builder here!
                            createNote(context);
                          },
                          //validator defines if we should reject or accept the
                          //current value inside the TextFormField. If it's bad,
                          //we return a String; otherwise return null. Here, all
                          //we do is reject if and only if it's empty/null.
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Note cannot be empty";
                            }
                            return null;
                          },
                          //decoration describes the look of the TextFormField.
                          //Mess around with it! There are plenty of ways to
                          //make it your own.
                          decoration: const InputDecoration(
                            labelText: "Enter your note!",
                          ),
                        );
                      },
                    ),
                  ),
                  Builder(
                    builder: (BuildContext context) {
                      //this is just a normal button widget.
                      //It has an elevation and casts a 'shadow'.
                      //If you want to see it, modify the 'elevation'
                      //attribute inside of ButtonStyle. I recommend
                      //anything higher than 0.
                      return ElevatedButton(
                        style: ButtonStyle(
                          elevation: WidgetStatePropertyAll(1),
                        ),
                        onPressed: () {
                          createNote(context);
                        },
                        child: Row(
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
            //SizedBoxes really only serve to create whitespace
            //and confine widgets to certain dimensions.
            SizedBox(height: 50),
            SizedBox(
              height: 600,
              width: 400,
              //ListView widgets provide a structure like Columns,
              //but have the added benefit of being scrollable if
              //the content exceeds the space provided.
              //This 'separated' named method provides a way to
              //dynamically create and render object inside the ListView
              //and also separate them efficiently.
              child: ListView.separated(
                //itembuilder is defined by a method that
                //describes how to create items. Here we
                //create ListTiles that contain the note
                //contents in the title. We also create an
                //extra few Icons and Buttons to add to the
                //experience and functionality.
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(notes[index]),
                    leading: Icon(Icons.note),
                    trailing: IconButton(
                      //this method deletes notes at a given index
                      onPressed: () {
                        setState(() {
                          notes.removeAt(index);
                        });
                      },
                      icon: Icon(Icons.delete_forever),
                    ),
                  );
                },
                //separatorBuilder defines what the
                //separator should look like. we just
                //return the built-in divider widget
                //for simplicity :)
                //Notice how we make the params underscores,
                //we don't need them so why name them and waste
                //storage? Underscores do that for us.
                separatorBuilder: (_, _) {
                  return Divider();
                },
                //ListView needs to know how many items
                //its building, so simply pass in the
                //length of our notes list
                itemCount: notes.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

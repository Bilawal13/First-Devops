// 1. uuid is a package that helps us with creating unique user ids dynamically

// install by writing flutter pub add uuid or dart pub add uuid

// then import 'package:flutter/material.dart';

// import by - import 'package:uuid/uuid.dart'; 

// then select as const uuid = Uuid();

// 2. The concept of Enums;
//   enums is a key word that allows us to create a custom type, which simply is a combination of predefined allowed values
//   -> enum Category {movie, pleasure } etc IMP: no = sign or ; at the end and the values within the curly brackets are not put within quotes  


// 3. DateTime datatype; this helps us with putting date and time values in a variable;
//    Simply assign it like -> DateTime data = DateTime.now() //.now uses the current data / time, we can put diff things in the brackets;

// 4. ListView: if we have lists of unclear length that can get potentially quite long, users could add 100+ expenses so when we have a
//    list of unknown length that will potentialy get very long, column is not ideal bcuz with column all the widgets are created by flutter
//    behind the scenes at the point of time when this list widget is displayed on the screen.
//    so we shouldn't use column for for long lists' instead flutter gives us listvew 

//    we can use children in it like ListView(children: [],) //we get a scrollable list but not ideal for many items scenario 

//    use a special constructor offered by it, ListView.builder() //builder tells the list that is should create those list items only if they are visible or about to become visible, not if they aren't visible
//    // it takes a itemBuilder value and u can pass context(ctx) and index value automatically provided by flutter

//     ListView.builder(itemBuilder: (ctx,index)=> Text()) ex.
//     //itemBuilder is required but we can pass more arguments 

// 5.    Card() - this widget helps us with styling purposes as it will give us a nice card look

// 6.   toStringAsFixed(2) - it tells the string how many characters there should be after a dot for ex: here 2

// 7. to inject a $ sign into a String we need to write it as ('\$${expense.toStringAsFixed(2)}') -> the first backwards slash and 
//    dollar sign tells dart to put that in the string and the seconds one tells to inject the curly brackets into the string

// 8. const Spacer(),  it is built into flutter and can be created with const, it can be used in any column or row that tells flutter that
//   it should create a widget that takes up all the space it can get between the other widgets between which it is placed.

// 9. appBar: AppBar(); it's a function in the scaffold widget that can provide a Bar on the top o an app
//    it has multiple functions like actions where u can pass buttons, it has titles to put on the bar.

// 10.showModalBottomSheet() -> built-in flutter option avsailable cause of material dart package, this fnc will dynamically add a new UI element
//    such a modal overlay when it's being executed

// context: whenever we make a class that extends State, it makes context available for that class which is required in the modalSheet
// but what is context?  Understanding: Context object/value has some sort of meta data collection,an object full of meta data managed
// by flutter that belongs to a specific widget so every widget has their own context obj and that contains meta data information related
// to the widget and VERY IMP related to the widget's position in the overall UI/ Widget Tree.
// so in the expense class the context value holds information about the expense class's information and it's position in the tree

// builder means we should provide a function to the constructor which must have a type written in builder method;

// TextField : used for input handling and includes fncts like Maxlength,deoration, KeyboardType: text.name etc

// 12. TextEditingController(); // for user input
  // @override
  // void dispose() {         // using dispose is important since it doesn't close in memory without dispose, this method only works in stateful widgets so better to do it in stateful
  //   _titleController.dispose();
  //   super.dispose();
  // }

//13. Navigator.pop(context); useful for closing the overlay screen

//14. showDatePicker(context: context, firstDate: firstDate, lastDate: nowTime); shows a picker to pick date 
//15. Future is a datatype that tells flutter that the value isn't in the var yet but it will be at some point in the future, we'll learn more bout this during https process

//16. .then((){}) can be used in shwoDatePicker which will be executed by flutter once a date has been picked here, similar to buttons

//17. more convinient method is to add a special async keyword before the parenthesis and await keyword infront of the code that does yield such a future

//18. ! mark after a possibly null value we tell dart that it will never be null.

//19. DropdownButton(items:,onChanged:) ->it renders a button which will display a dropdown once clicked, it has 2 arguements that must be set 
//20. .trim() this function can be called after a string etc and it erases any white data being consumed 
//21 .isEmpty checks if a string etc is empty

//22. showDialog(   //this is used to show an error or a pop up on the display
      //   context: context,      // it needs a context that is provided by flutter
      //   builder:               // we pass ctx as context which is provided by flutter  
      //       (ctx) => AlertDialog(            //we can use the AlertDialog or many others here to show an error
      //         title: Text('Invalid Input'),
      //         content: const Text(
      //           'Please Check If You Have Entered Correct Amount / Date / Title!',
      //         ),
      //         actions: [
      //           TextButton(
      //             onPressed: () {
      //               Navigator.pop(ctx);              // to close the error.
      //             },
      //             child: const Text('Okay'),
      //           ),
      //         ],
      //       ),
      // );

//23. Dismissible(   -> this widget tells dart to make the context in it swipable, it removes the swiped data but not from the memory then the onDismmised fnc helps us with removing the swiped data from the memory as well
          //   key: ValueKey(expenses[index]),
          //   onDismissed: (direction) => onRemove(expenses[index]),
          //   child: ExpenseItem(expense: expenses[index]),
          // ),

// 24.    indexOf() method can help store the index of a given element
//25.     ScaffoldMessenger.of(context).clearSnackBars(); helps removing the already spawned snackbars if new one spawns
//26.     ScaffoldMessenger.of(context).showSnackBar() ScaffoldMessenger is an object which then has a of method which wants a context value which is available in the class
//        based on the state class and then this scaffold messenger thing offers us various utility functions and methods that help us with controlling the ui and showing things on that ui.

//27. theme: ThemeData() if we just pass an object between these parenthesis , we're telling flutter that we're setting up the entire theme from scratch
      //which means that we should configure all the aspects that make up our applications(all styles etc) which is a lot of extra work 
      // theme: ThemeData().copyWith() -> now we're preserving some better default styles that are provided by flutter and we can now override
      // selected styles with that copyWith method, so instead of doing it from scratch and having to style everything, we're now using some defaut themese
      // provided by flutter and we're only overriding selected styles/themes

//28.  Use cardTheme,TextTheme, ElevatedButtonTheme , etc in themeData > such themes exist to theme ur app as u wish.

//29. Theme.of(context).cardTheme.margin!.horizontal, we can do such things in widgets to pass the themes or we can create our own theme for that specific widget using copywith() in the widget.

//30. darkTheme: is a utility in Theme that helps us change the theme of the app acc to the phone.

//31. for (final expense in expenses) {   for loop using in
    //   sum += expense.amount;
    // }

//32.   ExpenseBucket.forCategory(List<Expense> allExpenses, this.category) : expenses = allExpenses.where((expense)=> expense.category == category).toList(); // logic being used is that we filter out all the expenses that belong to a specific category 
//      this way we can create an alternative constructor ,after the semi colon we tell it that expenses should store those expenses where the category is matched with that of the expense.


// ~ RESPONSIVE & ADAPTIVE ~
// 1. WidgetsFlutterBinding.ensureInitialized(); -REQUIRED TO MAKE SURE LOCKING THE ORIENTATION AND THEN RUNNING THE APP WORKS AS INTENDED
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
  //   (fnc) => 'put runapp here'

  //2. print(MediaQuery.of(context).size.width);
  //   print(MediaQuery.of(context).size.height);

  //3. Size constraints : Col cons == width = 0 -> depends on children , height = 0 -> INFINITY 
  //                      wid cons == height = 0 -> depends on children , width = 0 -> INFINITY 

//4. MediaQuery.of(context).viewInsets.bottom; // viewInsets in an oject that contains extra inf aout ui elements that might be overlapping
//certain parts of the UI , if we access the bottom , we get any extra elements that are overlapping the ui from bottom.

//5. Flutter automatically uses safeArea to fix height in somewidgets such as scaffold but we can use it manually in some by
// useSafeArea:true , in such as showModalSheet etx.

//6. LayoutBuilder widget is used when we only care about the parent widget ('s contraints) and not the entire screen
// it takes a builder which then takes a ctx and constraints . LayoutBuilder(builder: (ctx,constraints){});


//7. apadtive apps mean all the apps are adaptive according to their respective platforms and shit 
// showDialog (and) vs showCupertinoDialog(ios) -> cupertino is the IOS libraray
//  more widgets like cupetinoAlert etc
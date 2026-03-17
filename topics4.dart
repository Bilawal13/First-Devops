// 1. Form() widget used to handle input fields 
// THIS FORM WIDGET THEN HAS A LOT OF WIDGETS THAT ARE USED FOR MAKING OF A FORM
// 2. TextFormField() -> one of the widgets in form that helps us with a text field
// it has many options avail such as maxlength , decoration -> inputdecorator , keyboardtype, initial value, and validator 
// validator takes a value and makes sure the value is validated as we wanted it to,
// onSaved helps with what to do when it issaved, so save the value to another variable.
// 3. DropdownButtonFormField() this fnc helps us with a drop down button in the form field, got value , items which then can take a dropdownMenuItem() , and on Changed
// 4. GloabalKey is a key that is globally available to all fncs/widgets and we can give it a <FormState> to unlock some form features
// 5. formKey.currentState!.validate makes sure the form is validated and .save helps with saving.
// 6. Navigator.of(ctx).pop(context); we already know about this but we can pass the value back to a screen if we removethe context and pass a widget to it.
//.pop(GroceryItem(id: enteredid , name: enteredName))  etc;

// 7. void _addItem() async { call async to this as the value will be added in the future
  //   final newItem = await Navigator.of(
  //     context,
  //   ).push<GroceryItem>(MaterialPageRoute(builder: (ctx) => const NewItem())); push Grocery bcuz we can this type returned

  //   if (newItem == null) { // if null return normally
  //     return;
  //   }

  //   setState(() { //else add to list
  //     _groceryItem.add(newItem);
  //   });
  // }

  // Lecture HTTP:
  // 1. import 'package:http/http.dart' as Http; as -> tells flutter to put all the services from the package into the name we have 
  // provided such as http here!, makes working with it easier
  //2. http.post(url); used to push new data to the db, takes some arguments 
  //3. Uri is a widget that has many fncs such as Uri.https() constructor to create a URL that points at a https backend
  // IN THE Uri , proivde a link like this : Uri.https(
      //   'shopping-list-237bc-default-rtdb.firebaseio.com',
      //   'shopping-list.json',
      // ); -> provide a link from the database without the https and /'s after or before then put a ',' and use any name with .json
  //4. http.post(
        // url, provide the Uri we jjust made
        // headers: {'Content-Type': 'application/json'}, u can name it anythng but provide /json in the second one
        // body: json.encode({  -> provide values u want in the database, it encodes the values to json type
        //   'name': _enteredName,
        //   'quantity': _enteredQuantity,
        //   'category': _selectedCategory.category,
        // }), -> this will push the data into a database.

        //5.     print(response.body); shows a body like name : and some json code
      // print(response.statusCode); //shows status if 200 smthng then it works else error
  
  // 6. if (!context.mounted) { sometimes dart doesn't know if the context is the same of not bcuz of async await so check if not mounted
      //   return; if yes then return
      // }

      // Navigator.of(context).pop(); else pop

    //   //7.final url = Uri.https(
    //   'shopping-list-237bc-default-rtdb.firebaseio.com',
    //   'shopping-list.json', 
    // ); // get url
    // final response = await http.get(url); //use get to fetch data 
    // final Map<String, dynamic> listData = json.decode(response.body); decode the fetched data from json, it's type is a map of <String , dynamic>

    //8. final List<GroceryItem> loadedItems = []; ->create a new list to store added values and overwrite old list
    // for (final item in listData.entries) { .entries give access to a value and a key options
    //   final categoryItem = 
    //       categories.entries
    //           .firstWhere( -> it's like where but returns the very first one that matches
    //             (catItem) => catItem.value.category == item.value['category'], catItem is from categories and item is from loop
    //           )
    //           .value; -> convert  it back to a single value 
    //  loadedItems.add( -> then add like this
    //     GroceryItem(
    //       id: item.key, -> key gives us a unique value from db
    //       name: item.value['name'],
    //       quantity: item.value['quantity'],
    //       category: categoryItem, 
    //     ),
    //   );
    // }
    // setState(() {
    //   _groceryItem = loadedItems;
    // });

    //9. load the fnc in initState first so that we get previous items loaded.

    //10.  final Map<String,dynamic> resData = json.decode(response.body); decode from jason

      // if (!context.mounted) { 
      //   return;
      // }

      // Navigator.of(context).pop(
      //   GroceryItem(
      //     id: resData['name'], add the id here and the rest are given and pop the info back to screen
      //     name: _enteredName,
      //     quantity: _enteredQuantity,
      //     category: _selectedCategory,
      //   ),
      // );

      //11. CircularProgressIndicator() -> shows a loading circle 
      //12. we can use ternary expressions for fncs too since in the end they are just a value
      //13. handle errors by checking status code by response.statusCode if it's eq or above 400-> then provide a string to show if it is

      //14. void _removeItem(GroceryItem item) async { deleting from backend and error handling
  //   final index = _groceryItem.indexOf(item);

  //   setState(() {
  //     _groceryItem.remove(item); remove locally
  //   });

  //   final url = Uri.https( get the url but in the end add a slash and inject item id as we want to delete one item
  //     'shoppig-list-237bc-default-rtdb.firebaseio.com',
  //     'shopping-list/${item.id}.json',
  //   );

  //   final response = await http.delete(url); async await is not needed for deleting but it is good for error handling

  //   if (response.statusCode >= 400) { if error
  //     ScaffoldMessenger.of(
  //       context,
  //     ).showSnackBar(SnackBar(content: Text('Something went wrong'))); show snackbar
  //     setState(() {
  //       _groceryItem.insert(index, item); add item back locally
  //     });
  //   }
  // }

  //15. handle no data cases -> else the loading will loop forever 
  // if there is no data the json code returns a null which makes the data in flutter loop forever
  // in such cases we can check if the body is null by if == 'null' or '' (depends on backend)
  // if (response.body == 'null') { checks for null
  //     setState(() { 
  //       _isLoading = false; put loading to false
  //     });
  //     return; and just return 

  //16. the error handling might not be the best if there's internet issues and stuff
  // in such cases we should use try catch

//17. FutureBuilder is a widget that listen to some future and keeps producing , it needs at least 2 key parameters , a future to which it should listen
// and a builder which wants a function which should be executed whenever the future produces data
// the snapshot gives us some options like snapshot.connection etc .data .error to handle all sorts of data handling, 
// we should make a future<> widget fnct etc to provide to the future parameter, functions should be in init state first.
// such a widget is bad for apps like this but can be useful later
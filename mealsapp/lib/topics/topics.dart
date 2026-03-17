// 1. Grid means like a container , a grid item is any direct child element of a container 
// GridView is like aa listview but instead of providing a simple list, it provieds grid items which helps us with making a list with multiple columns
// GridView takes some arguments 
// GridView(
        // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //   crossAxisCount: 2, // how many columns should be there
        //   childAspectRatio: 2 / 3, // size of the grid items
        //   crossAxisSpacing: 20, //sp
        //   mainAxisSpacing: 20,//sp
        // ),
        // children: [//yk

//2. category.color.withValues(alpha: 0.55),
//            category.color.withValues(alpha: 0.9), keep this in mind nibber

//3. GestureDetector and InkWell can both be used for tapping on some item/ widget/ container blah blah
// but gesture won't give u a visual feedback and inkwell will -> it takes a function as to where should it go after being tapped
// a color splash for visual effect , border etc

//4. Navigator widget helps navigate between different screens 
// as it's just a stack of screens and the one at the top most is the only one visible at the moment so as we did before with
// Navigator.pop -> we removed/closed the top most screen so we could see the one before it
// Navigator.push(ctx,route) helps us with pushing a new screen in the stack
// can also be written as Navigator.of(ctx).push(route)
// the route here takes a MaterialPageRoute which then takes a builder 

//5. sometimes if we're passing ctx or similar we can do it like this category: category,
            //   selectCat: () {
            //     _selectCategory(context);
            //   },
            // ), so we dont have to pass it in functions which wouldnt work anyways

// //6.  some settings for card Card(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)), for the shape of the card
//       margin: const EdgeInsets.all(8), for margin
//       elevation: 2, to give it an elevation look
//       clipBehavior: Clip.hardEdge, to force the settings on any of the children such as stack

// 7.  Stack() take children and it puts all the items on top of each other with the first children being in the bottom of the stack
// 8.  FadeInImage( gives umages a fade in effect  so it doesnt look ass when loading in
            //   placeholder: MemoryImage(kTransparentImage), -> this basically means there is some place holder bfr the image load.
            //kTr"" is a extra added feature by typing dart pub add transparent_imgae -> helps with a place holder
            //   image: NetworkImage(meal.imageUrl), -> helps with images from the internet
            //   fit: BoxFit.cover, -> helps with covering any overlapping shit 
            //   height: 200,
            //   width: double.infinity,
            // ),

// // 9. Positioned( -> this is a very useful widget in especially stack 
//               bottom: 0, adjusts the position of the child
//               right: 0,
//               left: 0,
//               child: Container(

// 10.  Text( -> some more text settings 
                    //   meal.title, 
                    //   textAlign: TextAlign.center, 
                    //   maxLines: 2, -> the text should cut if there's more than 2 lines
                    //   overflow: TextOverflow.ellipsis, -> will add ... after the text cuts
                    //   softWrap: true, // the text wrap looks good
                    //   style: const TextStyle(
                    //     fontSize: 20,
                    //     fontWeight: FontWeight.bold,
                    //     color: Colors.white,
                    //   ),
                    // ),

                    //11. Image.network(
      //   meals.imageUrl,
      //   height: 300,
      //   width: double.infinity,
      //   fit: BoxFit.cover,
      // ), 

//12. bottomNavigationBar: BottomNavigationBar( Provided by flutter in scaffold
      //   onTap: switchScreen, -> what to do when tapped
      //   currentIndex: currentIndex, -> highlights the currently tapped item
      //   items: [ -> items to show in the bottombar
      //     BottomNavigationBarItem( -> item for the bar
      //       icon: Icon(Icons.set_meal),
      //       label: 'Categories',
      //     ),
      //     BottomNavigationBarItem(icon: Icon(Icons.start), label: 'Favorites'),
      //   ],
      // ),
      //13. _favoriteMeals.contains(meal); returns a true false value 

      //14. Drawer() is a function that makes a side drawer on an app for you,
      //15. DrawerHeader() is a function for a drawer that provides a convenient way to make the top of a drawer
      //15 . ListTile() A ListTile is a convenient, prebuilt widget that represents a single row in a list — typically with an icon, 
      //title, subtitle, and a trailing widget (like an arrow or switch).
      //16. A SwitchListTile is just like a ListTile, but it automatically includes a toggle switch (Switch) at the end of the tile. 
      //It’s used when you want users to enable or disable a setting with a single tap.
      // takes title,subttile,value , on changed , active color, 

      // //17. Navigator.of(
      //   context,
      // ).pushReplacement(MaterialPageRoute(builder: (ctx) => const FiltersScreen())); 
      // it simply replaces the previous screen with the new given screen instead of pushing it on top of it

      //18.  PopScope( -> helps us control how our app responds to the back navigation or gestures
        // canPop: false, -> do not pop aautomatically / dont close screen automatically
        // onPopInvokedWithResult: (bool didPop, dynamic result) { -> this callback function happens whenever a pop is attempted
        //   if (didPop) { -> if pops simply exit
        //     return;
        //   }
        //   Navigator.of(context).pop({ -> else send some data back then pop, in this case a map of filter values
        //     Filter.glutenFree: _glutenFreeFilterSet,
        //     Filter.lactoseFree: _lactoseFreeFilterSet,
        //     Filter.vegan: _veganFilterSet,
        //     Filter.vegetarian: _vegetarianFilterSet,
        //   });
        // },
      
      // LECUTRE STATE-MANAGEMENT

      // 19. Install river-pod : flutter pub add flutter_riverpod
      // we can create a provider which is some kind of object created based on the class that is provided by the riverpod package
      // -> it can provide a dynamic value and also methods that can change that value
      // basically we dont have to pass down thing from widget to widget instead we can do it through this proivder object

      //20. import the riverpod and you get a Provider() widget which therefore needs a function (ref) {} which receives such a ref 
      // which would be of type ProviderRef and inside of this function we should put the thing we wanna provide
      //21. import provider and riverpod the the wanted class and replace statelesswidget with consumerwidget
      // and stateful widget with consumerstatefulwidget
      // ConsumerState instead of state

      //22. ref is a property that allows us to set up listeners to our providers 
      // ref.read() gets data from a provider once 
      // ref.watch() sets up a listener makes sure the build method executes again as our data changes
      // the official riverpod doc mentions to use watch as much as possible
      // ref.watch() needs a provider such as the one we made earlier 
      // 23. in our runApp in the main file we must wrap our any widgets with ProviderScope to unlock riverpod for all of our apps

      // 24. StateNotifierProvider() is another fnc provider by riverpod which is better to be used for complex data rather than the provider class
      // 25. StateNotifierProvider() works with StateNotifer() class
      // 26. we should use this class to build our own class which extends StateNotifier<Type of data we want>
      // In this class, we initiate an empty list in the start such as   FavoritemealsProvider() : super([]);
      // where our class is being assigned the super class and we're returning an empty list
      //  now this statenotifier class doesn't support add or remove fncs like in lists so
      //27. void toggleMealFavouriteStatus(Meal meal) { we make a fnc where we pass the meal
//     final mealIsFavorite = state.contains(meal); store the true or false if the meal contains in mealIsFav

//     if (mealIsFavorite) { // if it already contains
//       state = state.where((m) => m.id != meal.id).toList(); we removeit this wayy
//     } else { 
//       state = [...state, meal]; or add by spreading to make all the items ind and then adding the meal
//     }
//   }
// }

//   28. ConsumerWidget takes another parameter after context of a WidgetRef type 
// this ref can then be used in the class
// for widgets like buttons we should use ref.read 
// 29.  ref.read(favoriteMealsProvider.notifier) the provider takes a .notifer to access the notifier class
                  // .toggleMealFavouriteStatus(meals); // .function that we wrote and then provided the meals
                  
// 30. providers can also depend on other providers

// Animations :
// 1 : Explicit Animations : we have detailed control over the animation , more control but also more work and complexity
// 2 : Implicit Animations : Flutter controls the animation , less control but also less work and complexity, use pre-built as muchas possible
// if we are adding an explicit animation to a widget ,we must add it to a state object of that widget 
// we should create an animationcontroller inside an initState 
// the late keyword tells dart that the given is a variable which tells dart that this will have a value as soon as it's being used
// the first time but not as soon as the class is created 
// AnimationController is a type/class povided by flutter
// AnimationController() class has many parameters , vsync makes sure the animation is 60fps,
// vsync needs a TickerProvider which can be received using another class provided by flutter.
// after extend State<etc> , write with (which helps merges two classes to use both their benefits) SingleTickerProviderStateMixin.
// if we have multiple animation controllers then the right choice would be to use TickerProviderStateMixin 
//  AnimatedBuilder is another wdget that takes some arguments such as child , build to build the animation
// the animation argument simply takes the controller we built earlier, the child argument takes some widget
// that shouldn't be completely rebuilt but a part of it does during the animation,
// the builder argument takes context and child as an argument and then u can give it whatever u want to animate such as padding andstuff to animate
// Instead the builder can also take pre-defined transition methods sch as SlideTransition( position :)
// u can either use _animationController.drive() which helps us drive our 0,1 value to an offset value
// or use Tween().animate() which does the same but with a lot more better options
// tween takes anoffsetvalue withend,begin etc
// animate(parent: _animationController, curve : pre-defined cruves. methods)
// AnimatedSwitcher is an implicit animation method provided by flutter that works like this 
// // AnimatedSwitcher(
//               duration: Duration(milliseconds: 300),
//               transitionBuilder: 
//                   (child, animation) => 
//                       RotationTransition(turns: animation, child: child), the turns are provided by animation
//               child: Icon(isFav ? Icons.star : Icons.star_border),

// we need to give icon a key as well ass flutter doesn't yet understand if the icon has changed or not and treats it the same
// if we dont like the default animation we can tweak the turns by giving it Tween<double>( begin: 0.5 , end: 1).animate(animation)
// Tween is a generic type so we can tell it to return a double value or just write in double form within the parenthesis

// Flutter allows animating through multiple screens - > refactoring the widgets we want to animate using the hero widget
// which then takes a tag as well to uniquely identify each object , in our case meal.id
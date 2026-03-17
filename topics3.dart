// widgets trees -> 3
// Widget Tree -> simple a combination of widget si n the code 
// Element Tree -> in-memory representation of your widgets  , used for determining the necessary UI updates 
// build() is called frequestly to check new shit, elements reused if possible
// Render Tree -> this element tree is used to determine what UI should render , 
// Render tree is the combination of visible UI building blocks 

// how ui gets updated -> when the build method is called, flutter checks the element tree and reuses the existing elements as needed 
// then it compares the new element tree to the old one and if there are any differences then those are appleid to the render tree
// but it doesnt re-render the entire screen so it partially renders for some few things 

// in the todo list , whenever the todo items change asc or desc the element structure stays the same which wrks with the todo list
// but becomes a problem inthe checkable list and it's only the widgets changing but their states dont!
// Widgets -> elements -> state
// Keys help us to not let that happen , simpleuse key: in ur widgets and pass one of the two key methods - ValueKey() or ObjectKey()

// ValueKey takes a value while object takes an object , valuekey is more lightweight etc.

// List.of(slkla) for duplicate list 
// smthng.sort((a,b){ a.text.compareTo(b.text)}) -> sorts list

// if bcomes returns a list in an order , adding - so -bcomes would return it's opposite list
# Counter 7 (Tugas 7)

## Stateless and Stateful Widgets
Stateless widgets are widgets that are static, which means they never change. Stateful widgets on the other hand are dynamic, which means they can change their appearance based on events that triggered them.

## Widgets
In this project, I used
- `Scaffold`, visual layout structure
- `AppBar`, used alongside scaffold, acts as a toolbar
- `Center`, centers the content
- `Column`, creates a column layout
- `Text`, a text widget
- `TextStyle`, applies style to text
- `Stack`, positions the children relative to the edges of the box
- `Visibility`, sets the visibility of the child
- `Align`, aligns the child based on the asigned alignment
- `FloatingActionButton`, creates a floating action button

## `setState()`
By using `setState()` to change the value of a variable, it invokes the reactivity of the widgets which trigger a build for the State object.
The variable that is affected are the objects of that particular state widgets.

## `const` and `final`
`const` and `final` are both immutable at its core. The difference is that the variable declared using `const` must have its value known at compile-time, whilst `final` must have its value known at run-time.

## Implementation
I added a `floatingActionButton` which has the `onPressed` listener which invokes the `_incrementCounter` function. As well as another floatingActionButton which also has the same listener, just calls a different one `_decrementCounter` function.

To change the text above the number, I used a Text widget which has an anonymous function that calculates whether to return `GENAP` or `GANJIL` in response to the `_counter` variable, and applies the style with a similar method.

To hide the decrement button, I used the `Visibility` widget. The widget has a `visible` property, which I used to determine whether or not I should make it visible or not based on the `_counter` variable.

# Flutter Form (Tugas 8)

## Navigator.push and Navigator.pushReplacement
When we use `push()`, we're pushing the new route into the stack. If we use 'pushReplacement()' instead, we're replacing the top of the stack with the new route. In essence, using `pushReplacement()` would not go back to the previous page when `navigator.pop()` is called, but `push()` would still be able to do that, since the previous route is still in the stack.

## Widgets used
The widgets I used are basically `Form` widgets, such as `TextFormField`, `DropdownButtonFormField`, and other widgets for styling purposes. `TextFormField` provides a way for users to input for submission purposes. For this task, I used two of these, one for the name of the item, and the other for the price of the item.

For the name of the item, I did not do anything special in particular. For the price of the item, I used the `services.dart` package to compliment the `TextFormField` widget. I used that since I needed to make sure that the user actually inputs a number into the form field by using the `FilteringTextInputFormatter` function.

For the dropdown button, I used the `DropdownButtonFormField` widget instead of the usual `DropdownButton`. The reason I used that is because I needed to validate the user's selection, since selecting the initial value is considered not meaningful, and it just so happens that `DropdownButton` does not provide that functionality. 

## Types of events
- `onPressed`, an event that is fired when a particular widget is pressed
- `onChanged`, an event that is fired everytime when the value changes
- `onSaved`, an event that is fired when a form field is saved
- `onTap`, basically `onPressed`
- ...

## How Navigator works
Navigator essentially stores a stack of routes (pages). When you push a new route onto the stack, that route (page) would then be the page that you will see. When the user let's say press the 'back' button, the stack is going to pop the top-most route, and goes to the second highest route on the stack and presents that page to you.

Essentially it's just navigating through pages like a stack.

## Implementation
To implement this, I added the drawer to allow users the ability to navigate through the available routes. There are 3 available routes, one of which is finished, whilst the other two has yet to be implemented.
The first one is `form.dart`, which contains the FormFields necessary for the user to input to.
The other one is `data.dart`, which contains the data that the user has submitted into the form.
To link the data, I created a global list that all application can access using the `import 'globals.dart' as globals`. This is to ease the fact that the variables that contain the data for the user input are all inside `form.dart`, but then we need to access that variable from `data.dart`. So having a global variable helps a ton.

Inside `data.dart`, what it does is basically rendering or outputting the entire list that the user has submitted by using a for loop.s

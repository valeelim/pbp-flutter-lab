# Counter 7

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

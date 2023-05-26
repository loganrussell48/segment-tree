<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

# Segment Trees - Now in Dart!

## What is a Segment Tree useful for?

### Features
- Fast lookup for a "Range Query" `O(log(n))`
- Fast update for particular values (while maintaining fast lookup for ranges) `O(log(n))`
- They are ✨*generic*✨
- Allow you to provide your own merge function

### Usage

Below are some examples showing different uses for the Segment Tree

#### A Segment Tree that can calculate the sum of a given range
```dart
List<int> arr = [1, 3, 5, 7, 9, 11];
var segmentTree1 = SegmentTree<int>(arr, SegmentTree.plus<int>);
print(segmentTree1.query(0, 5)); // Output: 36

// Alternatively, you can create one like this
// Note that the generic type needs to be <num>
// This is because behind the scenes, this is expecting the type to be comparable to itself
// and <int> is only comparable to num
var segmentTree2 = SegmentTree.sum<num>(arr);
print(segmentTree2.query(0, 5))
```

#### A Segment Tree that returns the min in a given range
```dart
// Here the generic type is <String>
// Since it is comparable to itself, no additional parameters are needed for creation
List<String> arr2 = ['apple', 'banana', 'cherry', "app"];
var st3 = SegmentTree.min<String>(arr2);

// The "min" is based on the Comparator of the objects
// For Strings, this means the lexicographically smallest String is the min
// In other words, by alphabetical order, smaller words before larger words
print(st3.query(1, 2)); // Output: banana - Range['banana', 'cherry'] 'banana' comes first/is the min when sorted
print(st3.query(0, 3)); // Output: app - since "app" and "apple" start the same, "app" is first because it is smaller in length
```

#### A Segment Tree that returns the min in a given range with a custom merge function
```dart
minLengthMerger(String a, String b) => (a.length <= b.length) ? a : b;
var st5 = SegmentTree<String>(arr2, minLengthMerger);
print(st5.query(0, 2)); // Output: 'apple'
print(st5.query(1, 2)); // Output: 'banana' - since length is tie, the first one wins
print(st5.query(0, 3)); // Output: 'app' - smallest(by length) string is 'app' with 3 letters
```

##### Custom Merge Function
This function is basically a comparator, but rather than return a negative, positive, or 0 that 
represents the ordering, it should return the actual object that is desired. So, a custom "*max merger*"
will return the object that is "bigger" than the other, whether this is based on length, complexity,
number of bits, etc. 

#### A Segment Tree that returns the max in a given range with a custom merge function
```dart
  maxLengthMerger(String a, String b) => (a.length >= b.length) ? a : b;
var st6 = SegmentTree<String>(arr2, maxLengthMerger);
print(st6.query(0, 2)); // Output: 'cherry'
print(st6.query(1, 2)); // Output: 'banana' - since length is tie, the first one wins
print(st6.query(0, 3)); // Output: 'banana' - smallest(by length) string is 'app' with 3 letters
```
##### Note: The query method returns the ***FIRST*** max/min that it encounters while traversing up the tree. This is why the first `print` line in section above outputs 'cherry' rather than 'banana'. 'banana' occurs first in the original list, but is encountered 2nd based on the query indices while traversing the tree.
##### Note 2: This may be "*fixed*" in a future update. We'll see. 


### Getting started

This package has no dependencies. Just add it to your pubspec.yaml and use it :)

### Additional information
I may end up adding additional data structures and renaming this package. Or, I may end up creating a bunch of different packages. Haven't decided yet. Stay tuned lol. 

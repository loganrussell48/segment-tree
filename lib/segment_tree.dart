/// Support for doing something awesome.
///
/// More dartdocs go here.
library;

import 'package:segment_tree/segment_tree.dart';


export 'src/segment_tree_base.dart';




// void main() {
//   List<int> arr = [1, 3, 5, 7, 9, 11];
//   comparator(int a, int b) => a.compareTo(b);
//   SegmentTree<int> segmentTree = SegmentTree<int>(arr, comparator);
//
//   // Query example
//   int queryStart = 1;
//   int queryEnd = 4;
//   int result = segmentTree.query(queryStart, queryEnd);
//   print('Minimum value from index $queryStart to $queryEnd: $result');
//
//   // Update example
//   int index = 2;
//   int newValue = 6;
//   segmentTree.update(index, newValue);
//   print('Element at index $index updated to $newValue');
//
//   // Query after update
//   result = segmentTree.query(queryStart, queryEnd);
//   print('Minimum value from index $queryStart to $queryEnd: $result');
// }


void main() {

  List<int> arr = [1, 3, 5, 7, 9, 11];
  var segmentTree1 = SegmentTree<int>(arr, SegmentTree.plus<int>);


  // Named constructor 'SegmentTree.min'
  // SegmentTree<num> segmentTree2 = SegmentTree<num>.min(arr, defaultValue: 0);

  // assert(segmentTree1.query(0, 5) == 36);
  // assert(segmentTree2.query(0, 5) == 1);
  // print(segmentTree1);
  print(segmentTree1.query(0, 5)); // Output: 36
  // print(segmentTree2.query(0, 5)); // Output: 1


  List<String> arr2 = ['apple', 'banana', 'cherry', "app"];
  var st2 = SegmentTree.min<String>(arr2);
  print(st2.query(1, 2)); // Output: banana
  print(st2.query(0, 3));

  var st3 = SegmentTree(arr, SegmentTree.plus<int>);
  print(st3.query(0, 5));

  var st4 = SegmentTree(arr2, SegmentTree.plus<String>);
  print(st4.query(0, 3)); //Output: 'applebananacherryapp'
  // Comparator<String> lengthComparator = (a, b) => (a.length == 0) ? 1 : a.length.compareTo(b.length);
  // var segmentTree2 = SegmentTree.min(arr2, comparator: lengthComparator, defaultValue: "");
  // print(segmentTree2);
  // print("min string: ${segmentTree2.query(0, 2)}"); // Output: apple
}
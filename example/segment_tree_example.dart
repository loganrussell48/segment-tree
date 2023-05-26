
import 'package:segment_tree/segment_tree.dart';

void main() {

  print('Sum Segment Tree (ints)\n---------------------------------');
  List<int> arr = [1, 3, 5, 7, 9, 11];
  var segmentTree1 = SegmentTree.sum<num>(arr);

  // Named constructor 'SegmentTree.min'
  // SegmentTree<num> segmentTree2 = SegmentTree<num>.min(arr, defaultValue: 0);

  // assert(segmentTree1.query(0, 5) == 36);
  // assert(segmentTree2.query(0, 5) == 1);
  // print(segmentTree1);
  print(segmentTree1.query(0, 5)); // Output: 36
  print('\n');
  // print(segmentTree2.query(0, 5)); // Output: 1


  print('Min (compareTo method) Segment Tree\n---------------------------------');
  List<String> arr2 = ['apple', 'banana', 'cherry', "app"];
  var st2 = SegmentTree.min<String>(arr2);
  print(st2.query(1, 2)); // Output: banana
  print(st2.query(0, 3));
  print('\n');

  print('Plus Operator Segment Tree (ints)\n---------------------------------');
  var st3 = SegmentTree(arr, SegmentTree.plus<int>);
  print(st3.query(0, 5));
  print('\n');

  print('Plus Operator Segment Tree (Strings)\n---------------------------------');
  var st4 = SegmentTree(arr2, SegmentTree.plus<String>);
  print(st4.query(0, 3)); //Output: 'applebananacherryapp'
  print('\n');
  // Comparator<String> lengthComparator = (a, b) => (a.length == 0) ? 1 : a.length.compareTo(b.length);
  // var segmentTree2 = SegmentTree.min(arr2, comparator: lengthComparator, defaultValue: "");
  // print(segmentTree2);
  // print("min string: ${segmentTree2.query(0, 2)}"); // Output: apple

  print('Min Length Segment Tree\n---------------------------------');
  minLengthMerger(String a, String b) => (a.length <= b.length) ? a : b;
  var st5 = SegmentTree<String>(arr2, minLengthMerger);
  print(st5.query(0, 2)); // Output: 'apple'
  print(st5.query(1, 2)); // Output: 'banana' - since length is tie, the first one wins
  print(st5.query(0, 3)); // Output: 'app' - smallest(by length) string is 'app' with 3 letters
  print('\n');

  print('Max Length Segment Tree\n---------------------------------');
  maxLengthMerger(String a, String b) => (a.length >= b.length) ? a : b;
  var st6 = SegmentTree<String>(arr2, maxLengthMerger);
  print(st6.query(0, 2)); // Output: 'cherry'
  print(st6.query(1, 2)); // Output: 'banana' - since length is tie, the first one wins
  print(st6.query(0, 3)); // Output: 'banana' - smallest(by length) string is 'app' with 3 letters
  print('\n');


  print('Alternate Query Syntax using [record]\n---------------------------------');
  print(segmentTree1.query(0, 2));
  print(segmentTree1[(0, 2)]);
  print('\n');
}

import 'package:segment_tree/segment_tree.dart';
import 'package:test/test.dart';

void main() {
  group('SegmentTree Tests', () {
    test('Query Min', () {
      List<num> arr = [5, 3, 7, 1, 9, 11];
      var segmentTree = SegmentTree.min<num>(arr);
      expect(segmentTree.query(0, 5), equals(1));
    });

    test('Query Max', () {
      List<int> arr = [5, 3, 7, 1, 9, 11];
      var segmentTree = SegmentTree.max<num>(arr);
      print(segmentTree.tree);
      expect(segmentTree.query(0, 5), equals(11));
    });

    test('Query Sum', () {
      List<int> arr = [1, 3, 5, 7, 9, 11];
      var segmentTree = SegmentTree<int>(arr, SegmentTree.plus<int>);
      expect(segmentTree.query(0, 5), equals(36));
    });

    test('Update Value', () {
      List<int> arr = [1, 3, 5, 7, 9, 11];
      var segmentTree = SegmentTree<int>(arr, SegmentTree.plus<int>);

      // Original sum: 36
      expect(segmentTree.query(0, 5), equals(36));

      // Update index 2 with value 4
      segmentTree.update(2, 4);

      // New sum: 35 (1 + 3 + 4 + 7 + 9 + 11)
      expect(segmentTree.query(0, 5), equals(35));
    });
  });
}

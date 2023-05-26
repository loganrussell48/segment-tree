extension <T> on Comparable<T> {
  bool operator < (T other) => compareTo(other)  < 0;
  bool operator <=(T other) => compareTo(other) <= 0;
  bool operator > (T other) => compareTo(other)  > 0;
  bool operator >=(T other) => compareTo(other) >= 0;
}

class SegmentTree<T> {
  late List<T?> tree;
  late List<T> input;
  late int n;
  late T Function(T, T) merge;

  SegmentTree(this.input, this.merge) {
    n = input.length;
    tree = List<T?>.filled(2 * n, null);
    buildTree();
  }

  static SegmentTree<U> min<U extends Comparable<U>>(List<U> input){
    return SegmentTree(input, (U a, U b) => a <= b ? a : b);
  }

  static SegmentTree<U> max<U extends Comparable<U>>(List<U> input){
    return SegmentTree(input, (a, b) => b <= a ? a : b);
  }

  static SegmentTree<U> sum<U extends Comparable<U>>(List<U> input){
    return SegmentTree(input, plus<U>);
  }

  static U plus<U>(dynamic a, dynamic b) => ((a + b) as U);

  void buildTree() {
    for (int i = 0; i < n; i++) {
      tree[n + i] = input[i];
    }

    for (int i = n - 1; i > 0; i--) {
      tree[i] = merge(tree[2 * i] as T, tree[2 * i + 1] as T);
    }
  }

  T query(int queryStart, int queryEnd) {
    queryStart += n;
    queryEnd += n;
    T? result;

    while (queryStart <= queryEnd && queryStart > 0) {
      if (queryStart % 2 == 1) {
        result = switch(result){
          null => tree[queryStart] as T,
          _ => merge(result, tree[queryStart] as T)
        };
        queryStart++;
      }

      if (queryEnd % 2 == 0) {
        result = switch(result){
          null => tree[queryEnd] as T,
          _ => merge(result, tree[queryEnd] as T)
        };
        queryEnd--;
      }

      queryStart ~/= 2;
      queryEnd ~/= 2;
    }

    return result!;
  }

  void update(int index, T newValue) {
    index += n;
    tree[index] = newValue;

    while (index > 1) {
      index ~/= 2;
      tree[index] = merge(tree[2 * index] as T, tree[2 * index + 1] as T);
    }
  }
}

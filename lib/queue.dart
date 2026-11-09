/// A first-in, first-out (FIFO) queue.
class Queue<T> {
  final List<T> _items = <T>[];

  int get length => _items.length;

  bool get isEmpty => _items.isEmpty;

  /// Adds [item] to the back of the queue.
  void enqueue(T item) {
    _items.add(item);
  }

  /// Removes and returns the front item.
  ///
  /// Throws a [StateError] when the queue is empty.
  T pop() {
    if (_items.isEmpty) {
      throw StateError('Cannot pop from an empty queue.');
    }
    return _items.removeAt(0);
  }

  @override
  String toString() => _items.toString();
}

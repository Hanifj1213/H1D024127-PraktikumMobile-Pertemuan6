import 'package:queue_assignment/queue.dart';
import 'package:test/test.dart';

void main() {
  test('a new queue has zero length', () {
    final queue = Queue<int>();

    expect(queue.length, 0);
  });

  test('enqueue adds an item to the queue', () {
    final queue = Queue<int>();

    queue.enqueue(10);

    expect(queue.length, 1);
  });

  test('pop removes and returns the oldest item first', () {
    final queue = Queue<int>();
    queue.enqueue(10);
    queue.enqueue(20);
    queue.enqueue(30);

    expect(queue.pop(), 10);
    expect(queue.pop(), 20);
    expect(queue.pop(), 30);
    expect(queue.length, 0);
  });

  test('pop throws StateError when the queue is empty', () {
    final queue = Queue<int>();

    expect(() => queue.pop(), throwsStateError);
    expect(queue.length, 0);
  });

  test('isEmpty follows the queue state', () {
    final queue = Queue<int>();
    expect(queue.isEmpty, isTrue);

    queue.enqueue(1);
    expect(queue.isEmpty, isFalse);

    queue.pop();
    expect(queue.isEmpty, isTrue);
  });

  test('toString displays items from front to back', () {
    final queue = Queue<int>();
    expect(queue.toString(), '[]');

    queue.enqueue(10);
    queue.enqueue(20);
    expect(queue.toString(), '[10, 20]');

    queue.pop();
    expect(queue.toString(), '[20]');
  });

  test('a queue can store strings', () {
    final queue = Queue<String>();
    queue.enqueue('Alice');
    queue.enqueue('Bob');

    expect(queue.pop(), 'Alice');
    expect(queue.pop(), 'Bob');
  });

  test('duplicate items are preserved', () {
    final queue = Queue<int>();
    queue.enqueue(7);
    queue.enqueue(7);

    expect(queue.length, 2);
    expect(queue.pop(), 7);
    expect(queue.pop(), 7);
  });

  test('a nullable queue preserves null as a regular item', () {
    final queue = Queue<int?>();
    queue.enqueue(null);
    queue.enqueue(42);

    expect(queue.pop(), isNull);
    expect(queue.pop(), 42);
    expect(queue.isEmpty, isTrue);
  });

  test('interleaving enqueue and pop preserves FIFO order', () {
    final queue = Queue<int>();
    queue.enqueue(1);
    queue.enqueue(2);
    expect(queue.pop(), 1);

    queue.enqueue(3);
    expect(queue.pop(), 2);
    expect(queue.pop(), 3);
    expect(queue.isEmpty, isTrue);
  });

  test('a queue is reusable after an empty pop', () {
    final queue = Queue<int>();
    queue.enqueue(1);
    expect(queue.pop(), 1);
    expect(() => queue.pop(), throwsStateError);

    queue.enqueue(2);
    expect(queue.pop(), 2);
    expect(queue.isEmpty, isTrue);
  });

  test('queue instances have independent storage', () {
    final first = Queue<int>();
    final second = Queue<int>();
    first.enqueue(1);
    second.enqueue(2);

    expect(first.pop(), 1);
    expect(second.pop(), 2);
  });
}

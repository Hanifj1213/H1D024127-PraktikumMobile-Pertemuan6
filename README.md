# Meeting 6 - Queue in Dart

A Dart implementation of a **Queue** with the required `enqueue()` and `pop()` methods for the Mobile Programming course.

## Student

| Field | Value |
| --- | --- |
| Name | Muhammad Hanif Jundin |
| Student ID | H1D024127 |
| Class | C |
| Program | Informatics, Universitas Jenderal Soedirman |

## Queue behavior

A queue follows **FIFO (First In, First Out)**: the first item inserted is the first item removed.

- `enqueue(item)` adds an item to the **back** of the queue.
- `pop()` removes and returns the item at the **front** of the queue.
- Calling `pop()` on an empty queue throws a `StateError` without changing its state.

Although the removal method is often called `dequeue()`, this implementation uses `pop()` as required by the assignment. It does **not** remove from the back like a stack.

The generic `Queue<T>` class uses a private Dart `List<T>` for storage. It does not wrap or import the built-in `Queue` from `dart:collection`.

## Project structure

```text
bin/
  main.dart          Console demonstration
lib/
  queue.dart         Custom Queue<T> implementation
test/
  queue_test.dart    Automated unit tests
pubspec.yaml         Package configuration
pubspec.lock         Locked test dependencies
```

## Run

Install the [Dart SDK](https://dart.dev/get-dart) and make sure its `bin` directory is on your `PATH`.

From the project directory:

```bash
dart pub get
dart run bin/main.dart
```

### Demonstration output

```text
Demo Queue - FIFO (First In, First Out)
Antrian awal: []
enqueue(10): [10]
enqueue(20): [10, 20]
enqueue(30): [10, 20, 30]
pop(): 10
Antrian sekarang: [20, 30]
enqueue(40): [20, 30, 40]
pop(): 20 | Sisa antrian: [30, 40]
pop(): 30 | Sisa antrian: [40]
pop(): 40 | Sisa antrian: []
Jumlah elemen: 0
pop() ditolak: antrian kosong.
```

## Usage

```dart
import 'package:queue_assignment/queue.dart';

void main() {
  final queue = Queue<String>();

  queue.enqueue('Alice');
  queue.enqueue('Bob');

  print(queue.pop()); // Alice
  print(queue); // [Bob]
}
```

## API

| Member | Behavior |
| --- | --- |
| `void enqueue(T item)` | Adds an item to the back |
| `T pop()` | Removes and returns the front item; throws `StateError` if empty |
| `int get length` | Returns the current item count |
| `bool get isEmpty` | Reports whether the queue is empty |
| `String toString()` | Displays items from front to back |

### Complexity

- `enqueue()`: amortized **O(1)** using `List.add()`.
- `pop()`: **O(n)** using `List.removeAt(0)`, which shifts the remaining items.
- Storage: **O(n)** for `n` items.

The list-based implementation prioritizes readability for this introductory assignment.

## Tests

```bash
dart test --reporter expanded
```

The 12 tests cover initial state, insertion, FIFO removal, empty queue errors, length and emptiness, display order, strings, duplicate values, nullable items, interleaved operations, reuse after an empty pop, and independent queue instances.

The implementation and demonstration have been run with Dart SDK **3.13.7**. The demonstration has also been compiled and executed as a Windows executable.

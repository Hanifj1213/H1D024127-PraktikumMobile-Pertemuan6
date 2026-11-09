import 'package:queue_assignment/queue.dart';

void main() {
  final queue = Queue<int>();

  print('Demo Queue - FIFO (First In, First Out)');
  print('Antrian awal: $queue');

  for (final item in [10, 20, 30]) {
    queue.enqueue(item);
    print('enqueue($item): $queue');
  }

  print('pop(): ${queue.pop()}');
  print('Antrian sekarang: $queue');

  queue.enqueue(40);
  print('enqueue(40): $queue');

  while (!queue.isEmpty) {
    print('pop(): ${queue.pop()} | Sisa antrian: $queue');
  }

  print('Jumlah elemen: ${queue.length}');

  try {
    queue.pop();
  } on StateError {
    print('pop() ditolak: antrian kosong.');
  }
}

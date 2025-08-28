import 'dart:async';
import 'dart:math';

Future<String> simulateNetworkCall() async {
  await Future.delayed(const Duration(seconds: 2));
  if (Random().nextBool()) {
    throw Exception('Network error');
  }
  return 'Data received';
}

Future<String> multiStepProcess() async {
  await Future.delayed(Duration(seconds: 1));
  print("Step 1");

  await Future.delayed(Duration(seconds: 1));
  print("Step 2");

  return "Done";
}

Stream<int> emitWithDelay(List<int> values) async* {
  for (final value in values) {
    await Future.delayed(Duration(milliseconds: 500));
    yield value; // "emite" el valor al stream
  }
}

void listenAndCancel(Stream<int> stream) {
  late StreamSubscription<int> subscription; // Declaramos antes

  int count = 0;

  subscription = stream.listen((value) {
    print(value);
    count++;
    if (count >= 3) {
      subscription.cancel(); // Ahora sí lo podemos cancelar
    }
  });
}

Future<String> safeNetworkCall() async {
  try {
    return await simulateNetworkCall();
  } catch (_) {
    return 'Fallback data';
  }
}
Future<List<String>> runParallelCalls() async {
  // Creamos 3 "llamadas" simuladas que terminan en distinto tiempo
  final call1 = Future.delayed(Duration(seconds: 1), () => "First");
  final call2 = Future.delayed(Duration(seconds: 2), () => "Second");
  final call3 = Future.delayed(Duration(seconds: 3), () => "Third");

  // Ejecutamos en paralelo y esperamos el resultado de todas
  return await Future.wait([call1, call2, call3]);
}

void main() async {
  print("Starting parallel calls...");
  final results = await runParallelCalls();
  print(results); 
}


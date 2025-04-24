import 'dart:async';
import 'dart:isolate';
import 'package:flutter/material.dart';

class BenchmarkListIsolate extends StatefulWidget {
  final Widget Function() listFactory;
  const BenchmarkListIsolate({super.key, required this.listFactory});

  @override
  State<BenchmarkListIsolate> createState() => _BenchmarkListIsolateState();
}

class _BenchmarkListIsolateState extends State<BenchmarkListIsolate> {
  int _buildMs = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final sw = Stopwatch()..start();
      setState(() {});
      WidgetsBinding.instance.addPostFrameCallback((_) {
        sw.stop();
        setState(() {
          _buildMs = sw.elapsedMilliseconds;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text(widget.listFactory().toString())),
        body: Column(
          children: [
            Text('Build time: $_buildMs ms', style: const TextStyle(fontSize: 18, color: Colors.blue)),
            const Divider(),
            Expanded(child: widget.listFactory()),
          ],
        ),
      ),
    );
  }
}

class MakeStatelessIsolate extends StatelessWidget {
  final Widget child;
  const MakeStatelessIsolate({super.key, required this.child});

  @override
  Widget build(BuildContext context) => child;
}

class MakeStatefulIsolate extends StatefulWidget {
  final Widget child;
  const MakeStatefulIsolate({super.key, required this.child});

  @override
  State<MakeStatefulIsolate> createState() => _MakeStatefulIsolateState();
}

class _MakeStatefulIsolateState extends State<MakeStatefulIsolate> {
  @override
  Widget build(BuildContext context) => widget.child;
}

// Isolate data generation
Future<List<String>> _generateItems(int count) async {
  final receivePort = ReceivePort();
  await Isolate.spawn(_itemGenerator, [receivePort.sendPort, count]);
  return await receivePort.first as List<String>;
}

void _itemGenerator(List<dynamic> args) {
  final sendPort = args[0] as SendPort;
  final count = args[1] as int;
  final items = List<String>.generate(count, (i) => 'Item ${i + 1}');
  sendPort.send(items);
}

Widget makeListViewIsolate() {
  return FutureBuilder<List<String>>(
    future: _generateItems(1000),
    builder: (context, snapshot) {
      if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
      final items = snapshot.data!;
      return ListView(children: items.map((item) => ListTile(title: Text(item))).toList());
    },
  );
}

Widget makeBuilderIsolate() {
  return FutureBuilder<List<String>>(
    future: _generateItems(1000),
    builder: (context, snapshot) {
      if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
      final items = snapshot.data!;
      return ListView.builder(itemCount: items.length, itemBuilder: (_, index) => ListTile(title: Text(items[index])));
    },
  );
}

Widget makeSeparatedIsolate() {
  return FutureBuilder<List<String>>(
    future: _generateItems(1000),
    builder: (context, snapshot) {
      if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
      final items = snapshot.data!;
      return ListView.separated(
        itemCount: items.length,
        itemBuilder: (_, index) => ListTile(title: Text(items[index])),
        separatorBuilder: (_, __) => const Divider(),
      );
    },
  );
}

Widget makeColumnIsolate() {
  return FutureBuilder<List<String>>(
    future: _generateItems(1000),
    builder: (context, snapshot) {
      if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
      final items = snapshot.data!;
      return SingleChildScrollView(child: Column(children: items.map((item) => ListTile(title: Text(item))).toList()));
    },
  );
}

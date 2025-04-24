import 'package:flutter/material.dart';
import 'package:todo_app_tcc/benchmarks/benchmark_isolates_page.dart';
import 'package:todo_app_tcc/benchmarks/benchmark_page.dart';

class BenchmarkPageList extends StatelessWidget {
  const BenchmarkPageList({super.key});

  @override
  Widget build(BuildContext context) {
    _navigateToPage(Widget page) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => page));
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Benchmark List')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            PageExampleWidget(
              name: "Default Stateless ListView",
              onTap: () => _navigateToPage(BenchmarkList(listFactory: () => MakeStateless(child: makeListView()))),
            ),
            PageExampleWidget(
              name: "Default Stateless ListView Builder",
              onTap: () => _navigateToPage(BenchmarkList(listFactory: () => MakeStateless(child: makeBuilder()))),
            ),
            PageExampleWidget(
              name: "Default Stateless ListView Separated",
              onTap: () => _navigateToPage(BenchmarkList(listFactory: () => MakeStateless(child: makeSeparated()))),
            ),
            PageExampleWidget(
              name: "Default Stateless Column",
              onTap: () => _navigateToPage(BenchmarkList(listFactory: () => MakeStateless(child: makeColumn()))),
            ),
            PageExampleWidget(
              name: "Default Stateful ListView",
              onTap: () => _navigateToPage(BenchmarkList(listFactory: () => MakeStateful(child: makeListView()))),
            ),
            PageExampleWidget(
              name: "Default Stateful ListView Builder",
              onTap: () => _navigateToPage(BenchmarkList(listFactory: () => MakeStateful(child: makeBuilder()))),
            ),
            PageExampleWidget(
              name: "Default Stateful ListView Separated",
              onTap: () => _navigateToPage(BenchmarkList(listFactory: () => MakeStateful(child: makeSeparated()))),
            ),
            PageExampleWidget(
              name: "Default Stateful Column",
              onTap: () => _navigateToPage(BenchmarkList(listFactory: () => MakeStateful(child: makeColumn()))),
            ),
            PageExampleWidget(
              name: "Isolate Stateless ListView",
              onTap:
                  () => _navigateToPage(
                    BenchmarkListIsolate(listFactory: () => MakeStatelessIsolate(child: makeListViewIsolate())),
                  ),
            ),
            PageExampleWidget(
              name: "Isolate Stateless ListView Builder",
              onTap:
                  () => _navigateToPage(
                    BenchmarkListIsolate(listFactory: () => MakeStatelessIsolate(child: makeBuilderIsolate())),
                  ),
            ),
            PageExampleWidget(
              name: "Isolate Stateless ListView Separated",
              onTap:
                  () => _navigateToPage(
                    BenchmarkListIsolate(listFactory: () => MakeStatelessIsolate(child: makeSeparatedIsolate())),
                  ),
            ),
            PageExampleWidget(
              name: "Isolate Stateless Column",
              onTap:
                  () => _navigateToPage(
                    BenchmarkListIsolate(listFactory: () => MakeStatelessIsolate(child: makeColumnIsolate())),
                  ),
            ),
            PageExampleWidget(
              name: "Isolate Stateful ListView",
              onTap:
                  () => _navigateToPage(
                    BenchmarkListIsolate(listFactory: () => MakeStatefulIsolate(child: makeListViewIsolate())),
                  ),
            ),
            PageExampleWidget(
              name: "Isolate Stateful ListView Builder",
              onTap:
                  () => _navigateToPage(
                    BenchmarkListIsolate(listFactory: () => MakeStatefulIsolate(child: makeBuilderIsolate())),
                  ),
            ),
            PageExampleWidget(
              name: "Isolate Stateful ListView Separated",
              onTap:
                  () => _navigateToPage(
                    BenchmarkListIsolate(listFactory: () => MakeStatefulIsolate(child: makeSeparatedIsolate())),
                  ),
            ),
            PageExampleWidget(
              name: "Isolate Stateful Column",
              onTap:
                  () => _navigateToPage(
                    BenchmarkListIsolate(listFactory: () => MakeStatefulIsolate(child: makeColumnIsolate())),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class PageExampleWidget extends StatelessWidget {
  final String name;
  final VoidCallback onTap;

  const PageExampleWidget({super.key, required this.name, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.all(8),
      width: double.infinity,
      child: ElevatedButton(onPressed: onTap, child: Text(name)),
    );
  }
}

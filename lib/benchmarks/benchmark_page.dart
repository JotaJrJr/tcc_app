import 'package:flutter/material.dart';

class BenchmarkPage extends StatelessWidget {
  const BenchmarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 17,
        child: Scaffold(
          appBar: TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: 'Initial Page'),
              Tab(text: 'Stateless\nListView'),
              Tab(text: 'Stateless\nBuilder'),
              Tab(text: 'Stateless\nSeparated'),
              Tab(text: 'Stateless\nColumn'),

              Tab(text: 'Stateful\nListView'),
              Tab(text: 'Stateful\nBuilder'),
              Tab(text: 'Stateful\nSeparated'),
              Tab(text: 'Stateful\nColumn'),

              /// Custom Widgets
              Tab(text: 'Stateless\nCustom ListView'),
              Tab(text: 'Stateless\nBuilder Custom'),
              Tab(text: 'Stateless\nSeparated Custom'),
              Tab(text: 'Stateless\nCustom Column'),

              Tab(text: 'Stateful\nCustom ListView'),
              Tab(text: 'Stateful\nBuilder Custom'),
              Tab(text: 'Stateful\nSeparated Custom'),
              Tab(text: 'Stateful\nCustom Column'),
            ],
          ),
          body: TabBarView(
            children: [
              Center(child: Text('Initial Page', style: TextStyle(fontSize: 20, color: Colors.blue))),

              // 3. Stateless + ListView
              BenchmarkList(listFactory: () => MakeStateless(child: makeListView())),
              // 5. Stateless + ListView.builder
              BenchmarkList(listFactory: () => MakeStateless(child: makeBuilder())),
              // 7. Stateless + ListView.separated
              BenchmarkList(listFactory: () => MakeStateless(child: makeSeparated())),
              // 1. Stateless + Column
              BenchmarkList(listFactory: () => MakeStateless(child: makeColumn())),
              // 2. Stateful + Column
              BenchmarkList(listFactory: () => MakeStateful(child: makeColumn())),
              // 4. Stateful + ListView
              BenchmarkList(listFactory: () => MakeStateful(child: makeListView())),
              // 6. Stateful + ListView.builder
              BenchmarkList(listFactory: () => MakeStateful(child: makeBuilder())),
              // 8. Stateful + ListView.separated
              BenchmarkList(listFactory: () => MakeStateful(child: makeSeparated())),

              /// Custom Widgets
              // 11. Stateless + Custom ListView
              BenchmarkList(listFactory: () => MakeStateless(child: makeListViewCustomWidget())),
              // 13. Stateless + ListView.builder Custom
              BenchmarkList(listFactory: () => MakeStateless(child: makeBuilderCustomWidget())),
              // 15. Stateless + ListView.separated Custom
              BenchmarkList(listFactory: () => MakeStateless(child: makeSeparatedCustomWidget())),
              // 9. Stateless + Custom Column
              BenchmarkList(listFactory: () => MakeStateless(child: makeColumnCustomWidget())),

              // 10. Stateful + Custom Column
              BenchmarkList(listFactory: () => MakeStateful(child: makeColumnCustomWidget())),
              // 12. Stateful + Custom ListView
              BenchmarkList(listFactory: () => MakeStateful(child: makeListViewCustomWidget())),
              // 14. Stateful + ListView.builder Custom
              BenchmarkList(listFactory: () => MakeStateful(child: makeBuilderCustomWidget())),
              // 16. Stateful + ListView.separated Custom
              BenchmarkList(listFactory: () => MakeStateful(child: makeSeparatedCustomWidget())),
            ],
          ),
        ),
      ),
    );
  }
}

class BenchmarkList extends StatefulWidget {
  final Widget Function() listFactory;

  const BenchmarkList({super.key, required this.listFactory});

  @override
  State<BenchmarkList> createState() => _BenchmarkListState();
}

class _BenchmarkListState extends State<BenchmarkList> {
  int _buildMs = 0;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final sw = Stopwatch()..start();
      setState(() {
        // gatilho pra dar um rebuild
      });

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
    return Column(
      children: [
        Text("Build time: $_buildMs ms", style: const TextStyle(fontSize: 20, color: Colors.blue)),
        const Divider(),
        Expanded(child: widget.listFactory()),
      ],
    );
  }
}

class MakeStateless extends StatelessWidget {
  final Widget child;
  const MakeStateless({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return child;
  }
}

class MakeStateful extends StatefulWidget {
  final Widget child;
  const MakeStateful({super.key, required this.child});

  @override
  State<MakeStateful> createState() => _MakeStatefulState();
}

class _MakeStatefulState extends State<MakeStateful> {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

Widget makeColumn() {
  return SingleChildScrollView(child: Column(children: List.generate(1000, (i) => ListTile(title: Text('Item $i')))));
}

Widget makeListView() {
  return ListView(children: List.generate(1000, (i) => ListTile(title: Text('Item $i'))));
}

Widget makeBuilder() {
  return ListView.builder(
    itemCount: 1000,
    itemBuilder: (_, index) {
      return ListTile(title: Text('Item $index'));
    },
  );
}

Widget makeSeparated() {
  return ListView.separated(
    itemCount: 1000,
    itemBuilder: (_, index) {
      return ListTile(title: Text('Item $index'));
    },
    separatorBuilder: (_, index) {
      return const Divider();
    },
  );
}

Widget makeColumnCustomWidget() {
  return SingleChildScrollView(
    child: Column(
      children: List.generate(1000, (i) {
        return CustomWidget(icon: Icon(Icons.people), title: 'Title $i', subTitle: 'Subtitle $i');
      }),
    ),
  );
}

Widget makeListViewCustomWidget() {
  return ListView(
    children: List.generate(1000, (i) {
      return CustomWidget(icon: Icon(Icons.people), title: 'Title $i', subTitle: 'Subtitle $i');
    }),
  );
}

Widget makeBuilderCustomWidget() {
  return ListView.builder(
    itemCount: 1000,
    itemBuilder: (_, index) {
      return CustomWidget(icon: Icon(Icons.people), title: 'Title $index', subTitle: 'Subtitle $index');
    },
  );
}

Widget makeSeparatedCustomWidget() {
  return ListView.separated(
    itemCount: 1000,
    itemBuilder: (_, index) {
      return CustomWidget(icon: Icon(Icons.people), title: 'Title $index', subTitle: 'Subtitle $index');
    },
    separatorBuilder: (_, index) {
      return const Divider();
    },
  );
}

class CustomWidget extends StatelessWidget {
  final Icon icon;
  final String? iconText;
  final String title;
  final String? type;
  final String subTitle;
  final void Function()? onTap;
  final TextButton? actionButton;

  const CustomWidget({
    super.key,
    required this.icon,
    this.iconText,
    required this.title,
    this.type,
    required this.subTitle,
    this.onTap,
    this.actionButton,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 75,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(8)),
                child: icon,
              ),
              iconText != null
                  ? Positioned(bottom: -2, child: CumtomChip(icon: const Icon(Icons.people), text: iconText!))
                  : const SizedBox.shrink(),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  ...type == null ? [] : [CumtomChip(text: type ?? "type")],
                ],
              ),
              const SizedBox(height: 4),
              Text(subTitle, overflow: TextOverflow.ellipsis, maxLines: 2),
            ],
          ),
        ),
        actionButton ?? const SizedBox.shrink(),
      ],
    );
  }
}

class CumtomChip extends StatelessWidget {
  final String text;
  final Widget? icon;

  const CumtomChip({super.key, required this.text, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 0.3),
      decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(4)),
      child: Row(
        children: [
          Visibility(visible: icon != null, child: icon ?? Container()),
          Visibility(visible: icon != null, child: const SizedBox(width: 4)),
          Text(text, style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}

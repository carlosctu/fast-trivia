import 'package:flutter/material.dart';

import 'package:fast_trivia/utils/ui/export_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController(initialPage: 0);
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
    _tabController.addListener(() {
      if (_tabController.previousIndex != _tabController.index) {
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fast Trivia'),
      ),
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverPersistentHeader(
            delegate: _HomePageTabBar(_tabController),
          )
        ],
        body: SafeArea(
          child: TabBarView(
            controller: _tabController,
            children: [
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) {
                  return Divider(
                    height: 1,
                    color: Colors.grey[350],
                  );
                },
                itemCount: 20,
                itemBuilder: (context, index) {
                  return ActionRow(
                    title: const Text("Naturezas brasileiras"),
                    subtitle: const Text("Questões: 12"),
                    onPressed: () {},
                  );
                },
              ),
              Container(
                color: Colors.green,
                child: Center(
                  child: Text(
                    'Page ${_tabController.index}',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HomePageTabBar extends SliverPersistentHeaderDelegate {
  final TabController tabController;
  const _HomePageTabBar(
    this.tabController,
  );

  @override
  double get minExtent => 50;

  @override
  double get maxExtent => 50;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: TabBar(
        splashFactory: NoSplash.splashFactory,
        controller: tabController,
        tabs: const [
          Tab(
            child: Text(
              "Listas",
              style: TextStyle(color: Colors.black),
            ),
          ),
          Tab(
            child: Text(
              "Historico",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(_HomePageTabBar oldDelegate) => false;
}

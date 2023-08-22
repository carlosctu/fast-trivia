import 'package:fast_trivia/modules/home_page/bloc/home_bloc.dart';
import 'package:fast_trivia/modules/home_page/bloc/home_state.dart';
import 'package:fast_trivia/modules/home_page/widgets/available_questions_tab.dart';
import 'package:fast_trivia/modules/home_page/widgets/history_questions_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const route = "/";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
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
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return SafeArea(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  AvailableQuestionsTab(),
                  HistoryQuestionsTab(),
                ],
              ),
            );
          },
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

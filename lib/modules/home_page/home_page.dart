import 'package:fast_trivia/modules/home_page/bloc/home_bloc.dart';
import 'package:fast_trivia/modules/home_page/bloc/home_event.dart';
import 'package:fast_trivia/modules/home_page/bloc/home_state.dart';
import 'package:fast_trivia/modules/quizz_page/quiz_page.dart';
import 'package:fast_trivia/utils/ui/export_widgets.dart';
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

  HomeBloc get homePageBloc => context.read<HomeBloc>();

  @override
  void initState() {
    homePageBloc.add(HomeEventFetchQuizzes());
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
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return SafeArea(
              child: TabBarView(
                controller: _tabController,
                children: [
                  StreamBuilder(
                      stream: homePageBloc.stream,
                      builder: (context, snapshot) {
                        final state = snapshot.data?.status;

                        switch (state) {
                          case HomeStatus.complete:
                            final quizzes = snapshot.data!.quizzes;

                            return ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              separatorBuilder: (context, index) {
                                return Divider(
                                  height: 1,
                                  color: Colors.grey[350],
                                );
                              },
                              itemCount: quizzes.length,
                              itemBuilder: (context, index) {
                                final quiz = quizzes[index];

                                return ActionRow(
                                  title: Text(quiz.title),
                                  subtitle: Text(
                                    "Questões: ${quiz.questions.length}",
                                  ),
                                  onPressed: () => Navigator.pushNamed(
                                    context,
                                    QuizPage.route,
                                    arguments: QuizPageArguments(
                                      quizTitle: quiz.title,
                                      quizSection: quiz,
                                    ),
                                  ),
                                );
                              },
                            );
                          case HomeStatus.loading:
                            return const Center(
                              child: Text("Carregando..."),
                            );
                          case HomeStatus.error:
                            return const Center(
                              child: Text("Deu erro..."),
                            );
                          default:
                            return Text("Error");
                        }
                      }),
                  Container(
                    color: Colors.green,
                    child: Center(
                      child: Text(
                        'Page ${_tabController.index}',
                        style: const TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
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

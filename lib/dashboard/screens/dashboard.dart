import 'package:dads_joke/constants/colors.dart';
import 'package:dads_joke/dashboard/provider/jokes_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  ScrollController scrollController = ScrollController();
  late JokesProvider jokesProvider;
  @override
  void initState() {
    scrollController.addListener(() {
      scrollListner();
    });
    super.initState();
  }

  scrollListner() {
    if ((scrollController.position.pixels >
        scrollController.position.maxScrollExtent - 90)) {
      jokesProvider.fetchData();
    }
  }

  @override
  Widget build(BuildContext context) {
    jokesProvider = context.watch<JokesProvider>();
    return Consumer<JokesProvider>(
      builder: (context, jokesProvider, child) => Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.deepPurple, Colors.purple.shade300],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          title: TextField(
            // controller: _searchController,
            style: const TextStyle(color: Colors.white),
            cursorColor: Colors.white,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.search,
                color: AppColors.accent(),
              ),
              hintText: 'Search...',
              hintStyle: const TextStyle(color: Colors.white54),
              border: InputBorder.none,
            ),
            onChanged: (value) {
              // Perform search functionality here
            },
          ),
        ),
        body: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            children: [
              jokesProvider.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: jokesProvider.jokeSearchResult.results?.length,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            color: AppColors.containerBackground(),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.all(9),
                          margin: const EdgeInsets.all(9),
                          child: Text(
                            jokesProvider
                                    .jokeSearchResult.results?[index].joke ??
                                '',
                            style: TextStyle(
                                fontSize: 19, color: AppColors.text()),
                          ),
                        );
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

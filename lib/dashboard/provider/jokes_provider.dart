import 'package:dads_joke/models/joke_search_result.dart';
import 'package:dads_joke/network/apis.dart';
import 'package:flutter/material.dart';

class JokesProvider extends ChangeNotifier {
  JokeSearchResult jokeSearchResult = JokeSearchResult();
  int _currentPageNumber = 1; // Current Page to get Data from API
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  JokesProvider() {
    if ((jokeSearchResult.results ?? []).isEmpty) fetchData();
  }

  fetchData({String? query}) async {
    _isLoading = true;
    try {
      if (_currentPageNumber > 1) {
        JokeSearchResult results = await API()
            .getSearchedJokes(pageId: _currentPageNumber, query: query);
        jokeSearchResult.results =
            ((jokeSearchResult.results ?? []) + (results.results ?? []));
      } else {
        jokeSearchResult = await API()
            .getSearchedJokes(pageId: _currentPageNumber, query: query);
      }
      _currentPageNumber += 1;
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      notifyListeners();
    }
  }
}

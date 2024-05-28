import 'dart:async';
import 'package:game_galaxy/models/game_model.dart';
import 'base_network.dart';

class ApiDataSource {
  static final ApiDataSource instance = ApiDataSource._internal();

  ApiDataSource._internal();

  List<Game> _allGames = [];
  bool _gamesLoaded = false;

  // Method to load all games
  Future<List<Game>> loadGames() async {
    // If games are already loaded, return immediately
    if (_gamesLoaded) return _allGames;

    // Otherwise, fetch games from the API
    final List<dynamic> response = await BaseNetwork.get('games');
    _allGames = response.map((json) => Game.fromJson(json)).toList();

    // Set the flag to true indicating that games are loaded
    _gamesLoaded = true;

    return _allGames;
  }

  // Method to search games based on a pattern using the already fetched data
  List<Game> searchGames(String pattern) {
    // Ensure games are loaded before searching
    if (!_gamesLoaded) {
      throw Exception('Games are not loaded. Call loadGames() first.');
    }

    // Filter the list of games based on the provided pattern
    return _allGames.where((game) {
      return game.title!.toLowerCase().contains(pattern.toLowerCase()) ||
          game.genre!.toLowerCase().contains(pattern.toLowerCase()) ||
          game.platform!.toLowerCase().contains(pattern.toLowerCase());
    }).toList();
  }
}

import '../../../Remote/network_api_service.dart';
import '../../../Remote/api_endpoints.dart';
import '../../../Remote/network_response.dart';

class HomeRepo {
  final _apiService = NetworkApiService();

  Future<NetworkResponse> searchMorePokemons(
    String? nextSearchUrl,
  ) async {
    NetworkResponse response = await _apiService.getResponse(
      nextSearchUrl ?? ApiEndPoints.getInitialPokemons,
      isCompleteUrl: nextSearchUrl != null,
    );
    return response;
  }

  Future<NetworkResponse> getPokemonInfo(
    String pokemonUrl,
  ) async {
    NetworkResponse response = await _apiService.getResponse(
      pokemonUrl,
      isCompleteUrl: true,
    );
    return response;
  }

  Future<NetworkResponse> getPokemonTypes(
    String? nextSearchUrl,
  ) async {
    NetworkResponse response = await _apiService.getResponse(
      nextSearchUrl ?? ApiEndPoints.getPokemonTypes,
      isCompleteUrl: nextSearchUrl != null,
    );
    return response;
  }
}

import 'package:community_with_legends_mobile/src/core/data/network/http_client.dart';
import 'package:community_with_legends_mobile/src/features/profile/domain/models/hardware_model.dart';
import 'package:community_with_legends_mobile/src/features/profile/domain/models/user_game_status_enum.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileDatasource extends HttpClient {
  ProfileDatasource({required super.baseUrl});

  Future<Map<String, dynamic>> getUserProfile(int userId) {
    return getRequest(urlPath: 'api/users/$userId');
  }

  Future<Map<String, dynamic>> getCurrentUserProfile() {
    return getRequest(urlPath: 'api/user');
  }

  Future<Map<String, dynamic>> changeUserNickname(String nickname) {
    return postRequest(
      urlPath: 'api/user/name',
      body: {
        'name': nickname,
      },
    );
  }

  Future<Map<String, dynamic>> deleteUserAvatar() async {
    return deleteRequest(
      urlPath: 'api/user/avatar',
    );
  }

  Future<bool> changeUserAvatar(XFile avatar) async {
    return _updateAvatarRequest(
      urlPath: 'api/user/avatar',
      filePath: avatar.path,
    );
  }

  Future<bool> _updateAvatarRequest({
    required String urlPath,
    required String filePath,
  }) async {
    final url = Uri.parse('$baseUrl/$urlPath');
    final request = http.MultipartRequest('post', url);
    final file = await http.MultipartFile.fromPath('avatar', filePath);

    request.files.add(file);

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token') ?? '';

    request.headers['Authorization'] = 'Bearer $token';

    final response = await request.send();

    return response.statusCode == 200;
  }

  Future<Map<String, dynamic>> getUserHardware(int userId) async {
    return getRequest(
      urlPath: 'api/users/$userId/hardware',
    );
  }

  Future<Map<String, dynamic>> updateUserHardware(
    Hardware hardware,
  ) async {
    return postRequest(
      urlPath: 'api/user/hardware/${hardware.id}',
      body: {
        'title': hardware.title,
        'value': hardware.value,
      },
    );
  }

  Future<Map<String, dynamic>> deleteUserHardware(int id) async {
    return deleteRequest(
      urlPath: 'api/user/hardware/$id',
    );
  }

  Future<Map<String, dynamic>> addUserHardware(Hardware hardware) async {
    return postRequest(
      urlPath: 'api/user/hardware',
      body: {
        'title': hardware.title,
        'value': hardware.value,
      },
    );
  }

  Future<Map<String, dynamic>> getUserGames(int userId) async {
    return getRequest(
      urlPath: 'api/users/$userId/games',
    );
  }

  Future<Map<String, dynamic>> getUserGame(int userGameId) async {
    return getRequest(
      urlPath: 'api/user-games/$userGameId',
    );
  }

  Future<Map<String, dynamic>> addGameToUserList(int gameId, UserGameStatus status) async {
    return postRequest(
      urlPath: 'api/user-games',
      body: {
        'game_id': gameId,
        'status': status.name,
      },
    );
  }

  Future<Map<String, dynamic>> modifyUserGame(int userGameId, int gameId, UserGameStatus status) async {
    return postRequest(
      urlPath: 'api/user-games/$userGameId',
      body: {
        'game_id': gameId,
        'status': status.name,
      },
    );
  }

  Future<Map<String, dynamic>> deleteUserGame(int userGameId) async {
    return deleteRequest(
      urlPath: 'api/user-games/$userGameId',
    );
  }

  Future<Map<String, dynamic>> getUserProposals(int userId) async {
    return getRequest(
      urlPath: 'api/users/$userId/proposals',
    );
  }

  Future<Map<String, dynamic>> createProposal(int userId, int gameId) async {
    return postRequest(
      urlPath: 'api/users/$userId/games/$gameId/propose',
    );
  }

  Future<Map<String, dynamic>> acceptProposal(int proposalId) async {
    return postRequest(
      urlPath: 'api/proposals/$proposalId/accept',
    );
  }

  Future<Map<String, dynamic>> rejectProposal(int proposalId) async {
    return postRequest(
      urlPath: 'api/proposals/$proposalId/reject',
    );
  }

  Future<Map<String, dynamic>> likeProposal(int proposalId) async {
    return postRequest(
      urlPath: 'api/proposals/$proposalId/like',
    );
  }

  Future<Map<String, dynamic>> dislikeProposal(int proposalId) async {
    return postRequest(
      urlPath: 'api/proposals/$proposalId/dislike',
    );
  }

  Future<Map<String, dynamic>> removeProposalVote(int proposalId) async {
    return deleteRequest(
      urlPath: 'api/proposals/$proposalId/like',
    );
  }
}

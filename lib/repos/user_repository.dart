import '../core/storage/secure_session_storage.dart';
import '../datasources/user_datasource.dart';
import '../models/user_model.dart';

class UserRepository {
  final UserDataSource userDataSource;
  final SecureSessionStorage secureSessionStorage;

  UserRepository({
    required this.userDataSource,
    required this.secureSessionStorage,
  });

  Future<UserModel> getProfile() async {
    final userSession = await secureSessionStorage.getSession();

    if (userSession == null) {
      throw Exception('User is not logged in');
    }

    final response = await userDataSource.getProfile(
      token: userSession.token,
    );

    final Map<String, dynamic> data = response.data['data'];

    return UserModel.fromMap(data);
  }
}
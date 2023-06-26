import 'package:appwrite/appwrite.dart';

class Appwrite {
  static final Appwrite instance = Appwrite._internal();

  late final Client client;

  factory Appwrite._() {
    return instance;
  }

  Appwrite._internal() {
    client = Client()
        .setEndpoint('https://ck.moevedigital.com/v1')
        .setProject('CKLOTTO88')
        .setSelfSigned(
            status:
                true); // For self signed certificates, only use for development
  }
}

class AppwriteService {
  final Account account = Account(Appwrite.instance.client);

  Future<void> checkUser(String phone) async {
    try {
      // const response = await account.
    } catch (e) {
      print('error checkUser AppwriteService: $e');
    }
  }

  Future<void> createUser(String email, String password, String name) async {
    try {
      final user = await account.create(
        userId: ID.unique(),
        email: email,
        password: password,
        name: name,
      );

      print('user: ${user.email}');

      // final response = await account.createPhoneSession(
      //   phone: '+66968908467',
      //   userId: ID.unique(),
      // );

      // print('User created: ${response.toMap()}');
      // print('user: ${user.hashOptions}');
      // print('userID: ${user.$id}');
      // final response = await account.updatePhone(
      //   password: 'testpassword',
      //   phone: '+66844444444',
      // );
      // final response = await account.createPhoneSession(
      //   userId: ID.unique(),
      //   phone: ''
      // );
      // print('success ${response.toString()}');
    } catch (e) {
      print('errro 29 appwrite_service: $e');
    }
  }
}

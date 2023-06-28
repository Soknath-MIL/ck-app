import 'package:appwrite/appwrite.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
  final Databases databases = Databases(Appwrite.instance.client);

  Future<void> checkUser(String phone) async {
    try {
      // const response = await account.
    } catch (e) {
      print('error checkUser AppwriteService: $e');
    }
  }

  Future<bool> loginUser(String email, String password) async {
    try {
      final response =
          await account.createEmailSession(email: email, password: password);
      print('AppService loginUser: 38 $response');
      return true;
    } catch (e) {
      print('loginUser error: $e');
      return false;
    }
  }

  Future<bool> createUser(
    String email,
    String password,
    String name,
  ) async {
    final userFirebase = FirebaseAuth.instance.currentUser;
    if (userFirebase?.phoneNumber != null) {
      try {
        try {
          final user = await account.create(
            userId: ID.unique(),
            email: '+$email',
            password: password,
            name: name,
          );
        } catch (e) {
          print('error createUser 47: $e');
        }

        // login with appwrite
        final resultLoginWithAppwrite = await account.createEmailSession(
          email: '+$email',
          password: password,
        );

        try {
          await databases.createDocument(
            databaseId: 'lotto',
            collectionId: 'users',
            documentId: resultLoginWithAppwrite.userId,
            data: {
              "userId": resultLoginWithAppwrite.userId,
              "name": name,
              "tel": userFirebase?.phoneNumber,
              "email": email,
              "username": email,
            },
          );
        } catch (e) {
          print('error createUser 62 $e');
        }

        // print('user: ${user.email}');
        return true;

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
        return false;
      }
    }
    return false;
  }
}

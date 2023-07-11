import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:get/get.dart';
import 'package:lottery/res/routes/routes_name.dart';

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

  Future<bool> checkUser() async {
    try {
      final response = await account.get();
      print('checkUser: ${response.email}');
      return true;
    } catch (e) {
      print('error checkUser AppwriteService: $e');
      return false;
    }
  }

  Future<bool> loginUser(String email, String password) async {
    try {
      final response =
          await account.createEmailSession(email: email, password: password);
      print('AppService loginUser: 38 ${response.userId}');
      return true;
    } catch (e) {
      print('loginUser error: $e');
      return false;
    }
  }

  Future<bool> logoutUser() async {
    try {
      final response = await account.deleteSessions();
      print('response logoutUser: $response');
      Get.toNamed(RouteName.login_view);
      return true;
    } catch (e) {
      print('error logoutUser: $e');
      return false;
    }
  }

  Future<bool> updatePassword(String phoneNumber) async {
    try {
      final email = '$phoneNumber@ckmail.com';
      final response = await account.createRecovery(
          email: email, url: 'https://ck.moevedigital.com');
      print('updatePassword 68 $response');
      return true;
    } catch (e) {
      print('error updatePassword: $e');
      return false;
    }
  }

  Future<dynamic> findAccumulate(String lottery) async {
    try {
      // print('findAccumulate run');
      final response = await databases.listDocuments(
        databaseId: 'lotto',
        collectionId: '20230830_accumulate',
        queries: [
          Query.equal('lottery', lottery),
        ],
      );
      // print('response ${response.documents}');
      // response.documents.forEach((element) {
      //   print('response per loop: ${element.data}');
      // });
      return response;
    } catch (e) {
      print('error: findAccumulate: $e');
      return false;
    }
  }

  Future<dynamic> createAccumulate(
    String lottery,
    int amount,
    String transactionsData,
  ) async {
    try {
      final user = await account.get();
      print('createAccumulate $transactionsData');
      DocumentList response = await findAccumulate(lottery);
      print('response ${response.total}');
      if (response.total == 0) {
        // create
        await databases.createDocument(
          databaseId: 'lotto',
          collectionId: '20230830_accumulate',
          documentId: ID.unique(),
          data: {
            'lottery': lottery,
            'amount': amount,
            'updateAt': [DateTime.now().toUtc().toString()],
            'updateBy': [user.email],
            'lastFiveTransactions': [transactionsData],
          },
        );
      } else {
        print('data: ${response.documents[0].data['lottery']}');
        final responseFromUpdate = await updateAccumulate(
          lottery,
          amount,
          transactionsData,
          response.documents[0],
          user,
        );
        print('responseFromUpdate $responseFromUpdate');
      }
    } catch (e) {
      print('error createAccumulate: $e');
    }
  }

  Future<dynamic> updateAccumulate(
    String lottery,
    int amount,
    String transactionsData,
    Document document,
    User user,
  ) async {
    try {
      print(
          'updateAccumulate run lottery: $lottery, amount: $amount, $transactionsData');
      print('updateAccumulate 119: ${[
        ...document.data['lastFiveTransactions']
      ]}');
      final response = await databases.updateDocument(
          databaseId: 'lotto',
          collectionId: '20230830_accumulate',
          documentId: document.$id,
          data: {
            'amount': document.data['amount'] + amount,
            'updateAt': [
              ...document.data['updateAt'],
              DateTime.now().toUtc().toString()
            ],
            'updateBy': [...document.data['updateBy'], user.email],
            'lastFiveTransactions': [
              ...document.data['lastFiveTransactions'],
              transactionsData,
            ],
          });
      print('response updateAccumulate ${response.data}');
      return true;
    } catch (e) {
      print('error updateAccumulate: $e');
      return false;
    }
  }

  Future<dynamic> createInvoice(
    List arrLotterise,
    List arrAmount,
    List arrLotteryType,
    int totalAmount,
  ) async {
    try {
      print('createInvoice');
      final user = await account.get();
      final response = await databases.createDocument(
        databaseId: 'lotto',
        collectionId: '20230830_invoice',
        documentId: ID.unique(),
        data: {
          "lotteryArray": arrLotterise,
          "amountArray": arrAmount,
          "lotteryTypeArray": arrLotteryType,
          "users": user.$id,
          "lotteryDate": "20230830",
          "phoneNumber": "123",
          "paymentMethod": "bank",
          "bankName": "bk",
          "totalAmount": totalAmount,
        },
      );
      return response;
    } catch (e) {
      print('error createInvoice: $e');
      return false;
    }
  }

  Future<dynamic> createTransaction(
    String lottery,
    int amount,
    String invoiceId,
  ) async {
    try {
      final user = await account.get();
      print(
          'createTransaction: 183 lottery: $lottery, amount: $amount, invoiceId: ${invoiceId.toString()}');
      final response = await databases.createDocument(
          databaseId: 'lotto',
          collectionId: '20230830',
          documentId: ID.unique(),
          data: {
            // "userId": user.$id,
            "users": user.$id,
            "lottery": lottery,
            "lotteryType": lottery.length,
            "amount": amount,
            "paymentMethod": "bank",
            "bankName": "bk",
            // "createdAt": DateTime.now().toUtc().toString(),
            "20230830_invoice": invoiceId,
          });
      return response;
    } catch (e) {
      print('error $e');
      return false;
    }
  }

  Future<bool> createUser(
    String email,
    String password,
    String name,
  ) async {
    final userFirebase = firebase.FirebaseAuth.instance.currentUser;
    if (userFirebase?.phoneNumber != null) {
      try {
        try {
          final user = await account.create(
            userId: ID.unique(),
            email: email,
            password: password,
            name: name,
          );
        } catch (e) {
          print('error createUser 47: $e');
        }

        // login with appwrite
        final resultLoginWithAppwrite = await account.createEmailSession(
          email: email,
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

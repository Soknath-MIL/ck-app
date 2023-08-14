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
        .setSelfSigned(status: true); // For self signed certificates, only use for development
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
      final response = await account.createEmailSession(email: email, password: password);
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
      final response = await account.createRecovery(email: email, url: 'https://ck.moevedigital.com');
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
    String lotteryDateString,
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
          collectionId: '${lotteryDateString}_accumulate',
          documentId: ID.unique(),
          data: {
            'lottery': lottery,
            'amount': amount,
            'lotteryType': lottery.length,
            // 'updateAt': [DateTime.now().toUtc().toString()],
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
      print('updateAccumulate run lottery: $lottery, amount: $amount, $transactionsData');
      print('updateAccumulate 119: ${[...document.data['lastFiveTransactions']]}');
      final response = await databases
          .updateDocument(databaseId: 'lotto', collectionId: '20230830_accumulate', documentId: document.$id, data: {
        'amount': document.data['amount'] + amount,
        'updateAt': [...document.data['updateAt'], DateTime.now().toUtc().toString()],
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
    String lotteryDateString,
  ) async {
    try {
      print('createInvoice');
      final user = await account.get();
      final response = await databases.createDocument(
        databaseId: 'lotto',
        collectionId: '${lotteryDateString}_invoice',
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
    String lotteryDateString,
  ) async {
    try {
      final user = await account.get();
      print('createTransaction: 183 lottery: $lottery, amount: $amount, invoiceId: ${invoiceId.toString()}');
      final response = await databases.createDocument(
        databaseId: 'lotto',
        collectionId: lotteryDateString,
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
          "${lotteryDateString}_invoice": invoiceId,
          "transferAmount": 0,
        },
      );
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
          print('email: $email, password: $password, name: $name');
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
        print('error 29 appwrite_service: $e');
        return false;
      }
    }
    return false;
  }

  Future<dynamic> getAds() async {
    try {
      final response = await databases.listDocuments(
          databaseId: 'lotto',
          collectionId: 'ads',
          queries: [Query.greaterThanEqual('endDate', DateTime.now().toUtc().toString())]);
      return response;
    } catch (e) {
      print('error getAds: $e');
      return false;
    }
  }

  Future<dynamic> getNews() async {
    try {
      final response = await databases.listDocuments(databaseId: 'lotto', collectionId: 'news', queries: [
        Query.greaterThanEqual('endDate', DateTime.now().toUtc().toString()),
        Query.orderDesc('endDate'),
        Query.limit(3),
      ]);
      return response;
    } catch (e) {
      print('error getNews 327: $e');
      return false;
    }
  }

  Future<dynamic> getLotteryDate() async {
    try {
      final response = await databases.listDocuments(databaseId: 'lotto', collectionId: 'lottery_date', queries: [
        Query.greaterThan('date', DateTime.now().toUtc().toString()),
        Query.orderAsc('date'),
        Query.limit(1),
      ]);
      return response;
    } catch (e) {
      print('error getLotteryDate: $e');
      return false;
    }
  }

  Future<dynamic> getUserInfo() async {
    try {
      final user = await account.get();
      final response = await databases.getDocument(
        databaseId: 'lotto',
        collectionId: 'users',
        documentId: user.$id,
      );
      print('getUserInfo: ${response.data}');
      return response.data;
    } catch (e) {
      print('error getUserInfo 342: $e');
      return false;
    }
  }

  Future<dynamic> createFeedback(String rate, String comment) async {
    try {
      final user = await account.get();
      final response = await databases.createDocument(
        databaseId: 'lotto',
        collectionId: 'feedback',
        documentId: ID.unique(),
        data: {
          "rate": rate,
          "comment": comment,
          "date": DateTime.now().toUtc().toString(),
          "users": user.$id,
        },
      );
      return response;
    } catch (e) {
      print('error createFeedback 377: $e');
      return false;
    }
  }

  Future<dynamic> getHistory() async {
    try {
      // final user = await account.get();
      final lotteryDates = await databases.listDocuments(
        databaseId: 'lotto',
        collectionId: 'lottery_date',
        queries: [
          Query.equal('isDelete', false),
        ],
      );
      print('lotteryDate: ${lotteryDates.documents}');
      List<String> collectionNames = [];
      Map<String, List> listOfMonthMap = {};
      for (var i = 0; i < lotteryDates.documents.length; i++) {
        final lotteryDate = lotteryDates.documents[i];
        final parsed = DateTime.parse(lotteryDate.data['date']).toLocal();
        // print('parse 408: ${parsed}');
        final collectionName =
            '${parsed.year}${parsed.month.toString().padLeft(2, '0')}${parsed.day.toString().padLeft(2, '0')}_invoice';
        // print('collectionName: $collectionName');
        collectionNames.add(collectionName);
        final listName = "${parsed.month.toString().padLeft(2, "0")}-${parsed.year}";
        if (listOfMonthMap[listName] == null) {
          listOfMonthMap[listName] = [collectionName];
        } else {
          listOfMonthMap[listName]!.add(collectionName);
        }
        print(listOfMonthMap[listName]);
      }
      // print("listOfMonthMap: $listOfMonthMap");
      return listOfMonthMap;
      // final response = await databases.getDocument(
      //   databaseId: 'lotto',
      //   collectionId: '',
      //   documentId: documentId,
      // );
    } catch (e) {
      print('getHistory error 396: $e');
      return false;
    }
  }

  Future<dynamic> getInvoice(String collectionId) async {
    try {
      final response = await databases.listDocuments(databaseId: 'lotto', collectionId: collectionId);
      return response;
    } catch (e) {
      print('error getInvoice 417: $e');
    }
  }

  Future<dynamic> getLotteryHistory() async {
    try {
      final response = await databases.listDocuments(databaseId: 'lotto', collectionId: 'lotto_history', queries: [
        Query.equal('isDelete', false),
      ]);
      return response;
    } catch (e) {
      print('error getHistory 427: $e');
      return false;
    }
  }
}

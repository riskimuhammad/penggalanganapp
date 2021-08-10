import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ServiceApp {
  // ignore: unused_field
  static FirebaseUser _user;

  static FirebaseAuth _auth = FirebaseAuth.instance;

  // create user
  static Future<String> userCreate(
      String nama, String email, String password, nik) async {
    try {
      final currentUser = await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .catchError((error) {
        print(error);
      }).onError((error, stackTrace) {
        return;
      });

      var userUpdateInfo = UserUpdateInfo();
      userUpdateInfo.displayName = nama;

      _user = currentUser.user;

      _user = await _auth.currentUser();
      await currentUser.user.updateProfile(userUpdateInfo);
      await currentUser.user.reload();
      var ref = Firestore.instance.collection('users');
      ref.add(({
        "nama": nama,
        "type": 'user',
        "email": email,
        "nik": nik,
        "saldo": 0,
        "verifikasi": ""
      }));
      return currentUser.user.uid;
    } catch (e) {
      return e;
    }
  }

  //login user
  static Future<FirebaseUser> loginEmailPassword(
      String email, String password) async {
    try {
      AuthResult result = await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .catchError((eror) {
        print(eror);
      }).onError((error, stackTrace) {
        return;
      });

      FirebaseUser firebaseUser = result.user;
      if (firebaseUser == null) {
        print("user kosong");
      }
      return firebaseUser;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future addDonasiUser(nama, jenis, jumlah, document, bukti, rek) async {
    await Firestore.instance
        .collection("users")
        .document(document)
        .collection("donasi user")
        .add({
      "nama": nama,
      "type": jenis,
      "jumlah": jumlah,
      "rek": rek,
      "verifikasi": "",
      "bukti": bukti
    });
  }

  Future addDonasi(nama, jumlah, nodebit, norek) async {
    await Firestore.instance.collection("donasi").add({
      "nama instansi": nama,
      "no debit": nodebit,
      "no rek": norek,
      "jumlah saldo": jumlah,
    });
  }

  Future updateDonasi(index, jumlah) async {
    Firestore.instance.runTransaction((transaction) async {
      await transaction.get(index);
      await transaction.update(index, {
        "jumlah saldo": jumlah,
      });
    });
  }

  Future addCreditCard(nama, noRek, mmTh, cvv, document) async {
    await Firestore.instance
        .collection("users")
        .document(document)
        .collection("kredit user")
        .add({
      "nama": nama,
      "no rek": noRek,
      "mmTh": mmTh,
      "cvv": cvv,
      "verifikasi": ""
    });
  }

  Future addDebittCard(nama, noRek, bank, document) async {
    await Firestore.instance
        .collection("users")
        .document(document)
        .collection("debit")
        .add({"nama": nama, "no rek": noRek, "bank": bank, "verifikasi": ""});
  }

  //updaDOnasi
  Future updateDonasiUser(index) async {
    Firestore.instance.runTransaction((transaction) async {
      await transaction.get(index);
      await transaction.update(index, {
        'verifikasi': 'sukses',
      });
    });
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      FirebaseUser firebaseUser = await FirebaseAuth.instance.currentUser();
      print(firebaseUser);
    } catch (e) {
      print(e);
    }
  }
}





























//   //saldo update
//   Future saldoUpdate(index, saldo) async {
//     Firestore.instance.runTransaction((transaction) async {
//       await transaction.get(index);
//       await transaction.update(index, ({"saldo": saldo, "verifikasi": ""}));
//     });
//   }

//   Future addTransaksiUser(document, namaBus, tujuan, jumlah, id) async {
//     await Firestore.instance
//         .collection("users")
//         .document(document)
//         .collection("transaksi user")
//         .add({
//       "id_bus": id,
//       "nama": namaBus,
//       "tujuan": tujuan,
//       "jumlah": jumlah,
//       "status": ""
//     });
//   }

//   Future addTransaksi(nama, plat, tujuan, jumlah, status, id, kursi,
//       kursiTerpakai, tanggal) async {
//     await Firestore.instance.collection("transaksi").add(({
//           "id": id,
//           "nama": nama,
//           "plat": plat,
//           "tujuan": tujuan,
//           "jumlah": jumlah,
//           "jumlah_kursi": kursi,
//           "kursi_terpakai": kursiTerpakai,
//           "tanggal": tanggal,
//         }));
//   }

//   Future updateTransaksi(jum, index) async {
//     Firestore.instance.runTransaction((transaction) async {
//       await transaction.get(index);
//       await transaction.update(
//           index,
//           ({
//             "status": jum,
//           }));
//     });
//   }

//   Future updateTransaksiUserKursi(jum, index) async {
//     Firestore.instance.runTransaction((transaction) async {
//       await transaction.get(index);
//       await transaction.update(
//           index,
//           ({
//             "jumlah": jum,
//           }));
//     });
//   }

//   Future updateTransaksiTransaksi(jum, index) async {
//     Firestore.instance.runTransaction((transaction) async {
//       await transaction.get(index);
//       await transaction.update(
//           index,
//           ({
//             "kursi_terpakai": jum,
//           }));
//     });
//   }

// //BUS
//   Future inputCondekturAccount(nama, email, password) async {
//     try {
//       final currentUser = await _auth
//           .createUserWithEmailAndPassword(email: email, password: password)
//           .catchError((error) {
//         print(error);
//       }).onError((error, stackTrace) {
//         return;
//       });

//       var userUpdateInfo = UserUpdateInfo();
//       userUpdateInfo.displayName = nama;
//     } catch (e) {
//       return e;
//     }
//   }

//   Future addUser(nama, email, password, id) async {
//     var ref = Firestore.instance.collection('users');
//     ref.add(({
//       "nama": nama,
//       "type": 'bus',
//       "email": email,
//       "id_bus": id,
//     }));
//   }

//   Future deletBusUser(index) async {
//     Firestore.instance.runTransaction((transaction) async {
//       await transaction.get(index);
//       await transaction.delete(index);
//     });
//   }

//   Future editBusUser(index, nama) async {
//     Firestore.instance.runTransaction((transaction) async {
//       await transaction.get(index);
//       await transaction.update(index, {
//         "nama": nama,
//       });
//     });
//   }

//   Future editBusUserId(index, id) async {
//     Firestore.instance.runTransaction((transaction) async {
//       await transaction.get(index);
//       await transaction.update(index, {
//         "id_bus": id,
//       });
//     });
//   }

//   Future editUserKOnfirmasi(index, verifikasi) async {
//     Firestore.instance.runTransaction((transaction) async {
//       await transaction.get(index);
//       await transaction.update(index, {
//         "verifikasi": verifikasi,
//       });
//     });
//   }

//   Future addDataBus(email, fasilitas, id, jadwal, jumKursi, namaBus, plat,
//       sopir, tujuan) async {
//     var ref = Firestore.instance.collection('Bus');
//     ref.add({
//       "Latitude": 5.185904981427964,
//       "Longitude": 97.142309334741,
//       "email": email,
//       "fasilitas": fasilitas,
//       "id": id,
//       "jadwal": jadwal,
//       "jumlah_kursi": jumKursi,
//       "kursi_terpakai": 0,
//       "nama": namaBus,
//       "plat": plat,
//       "posisi": "Lhokseumawe",
//       "sopir": sopir,
//       "tujuan": tujuan,
//     });
//   }

//   Future updateDataBus(email, fasilitas, id, jadwal, jumKursi, namaBus, plat,
//       sopir, tujuan, index) async {
//     Firestore.instance.runTransaction((transaction) async {
//       await transaction.get(index);
//       await transaction.update(index, {
//         "email": email,
//         "fasilitas": fasilitas,
//         "id": id,
//         "jadwal": jadwal,
//         "jumlah_kursi": jumKursi,
//         "nama": namaBus,
//         "plat": plat,
//         "sopir": sopir,
//         "tujuan": tujuan,
//       });
//     });
//   }

//   //logout
//   Future<void> signOut() async {
//     try {
//       await _auth.signOut();
//       FirebaseUser firebaseUser = await FirebaseAuth.instance.currentUser();
//       print(firebaseUser);
//     } catch (e) {
//       print(e);
//     }
//   }
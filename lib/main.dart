import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_project_baws/firebase_options.dart';
import 'package:my_project_baws/src/app.dart';
import 'package:my_project_baws/src/data/auth_repository.dart';
import 'package:my_project_baws/src/data/database_repository.dart';
import 'package:provider/provider.dart';

import 'src/data/firestore_database.dart';
import 'src/data/user_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Database einmal an der Wurzel erzeugt
  FirestoreDatabase databaseRepository = FirestoreDatabase();
  AuthRepository authRepository = AuthRepository(FirebaseAuth.instance);
  UserRepository userRepository = UserRepository(FirebaseFirestore.instance);

  runApp(
    MultiProvider(
      providers: [
        Provider<DatabaseRepository>(
          create: (_) => databaseRepository,
        ),
        Provider<AuthRepository>(
          create: (_) => authRepository,
        ),
        Provider<UserRepository>(
          create: (_) => userRepository,
        )
      ],
      child: const App(),
    ),
  );
}

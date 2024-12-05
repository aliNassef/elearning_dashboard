import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/cache/cache_helper.dart';
import 'core/services/service_locator.dart';
import 'core/shared/widgets/custom_bloc_observer.dart';
import 'e_learning_app.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await CacheHelper.init();
  await setupServiceLocator();
  Bloc.observer = CustomBlocObserver();
  runApp(const ELearningApp());
}

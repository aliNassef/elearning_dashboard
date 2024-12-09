import 'package:elearning_dashboard/core/services/firebase_auth_service.dart';
import 'package:elearning_dashboard/features/login/data/repo/login_repo_impl.dart';
import 'package:elearning_dashboard/features/login/data/source/login_source.dart';
import 'package:elearning_dashboard/features/login/domain/repo/login_repo.dart';
import 'package:elearning_dashboard/features/questions/data/repo/questions_repo_impl.dart';
import 'package:elearning_dashboard/features/questions/data/source/questions_source.dart';
import 'package:elearning_dashboard/features/questions/domain/repo/questions_repo.dart';
import '../../features/lessons/data/source/lesson_source.dart';
import '../../features/lessons/domain/repo/lesson_repo.dart';
import '../../features/quizes/data/source/quize_source.dart';
import '../../features/quizes/domain/repo/quize_repo.dart';
import '../../features/lessons/data/repo/lesson_repo_impl.dart';
import '../../features/quizes/data/repo/quize_repo_impl.dart';
import '../repos/image_repo/image_rep_impl.dart';
import '../repos/image_repo/image_repo.dart';
import 'fire_storage.dart';
import 'storage_service.dart';

import 'firestore_database.dart';
import '../../features/courses/data/repo/courses_repo_impl.dart';
import '../../features/courses/data/source/courses_remote_source.dart';
import 'package:get_it/get_it.dart';

import '../../features/courses/domain/repo/courses_repo.dart';

final injector = GetIt.instance;

Future<void> setupServiceLocator() async {
  injector.registerSingleton<FirestoreService>(
    FirestoreService(),
  );
  injector.registerSingleton<CoursesRemoteSource>(
    CoursesRemoteSource(
      firestoreService: injector<FirestoreService>(),
    ),
  );
  injector.registerSingleton<CoursesRepo>(
    CoursesRepoImpl(
      coursesRemoteSource: injector<CoursesRemoteSource>(),
    ),
  );
  injector.registerSingleton<StorageService>(
    FireStorage(),
  );
  injector.registerSingleton<ImageRepo>(
    ImageRepImpl(
      storageService: injector<StorageService>(),
    ),
  );

  injector.registerSingleton<LessonSource>(
    LessonSource(service: injector<FirestoreService>()),
  );

  injector.registerSingleton<LessonRepo>(
    LessonRepoImpl(
      source: injector<LessonSource>(),
    ),
  );
  injector.registerSingleton<QuizeSource>(
    QuizeSource(
      firestoreService: injector<FirestoreService>(),
    ),
  );
  injector.registerSingleton<QuizeRepo>(
    QuizeRepoImpl(
      quizeSource: injector<QuizeSource>(),
    ),
  );
  injector.registerSingleton<QuestionsSource>(
    QuestionsSource(
      firestoreService: injector<FirestoreService>(),
    ),
  );
  injector.registerSingleton<QuestionsRepo>(
    QuestionsRepoImpl(
      questionsSource: injector<QuestionsSource>(),
    ),
  );
  injector.registerSingleton<FirebaseAuthService>(
    FirebaseAuthService(),
  );
  injector.registerSingleton<LoginSource>(
    LoginSource(
      authService: injector<FirebaseAuthService>(),
    ),
  );
  injector.registerSingleton<LoginRepo>(
    LoginRepoImpl(
      authService: injector<LoginSource>(),
    ),
  );
}

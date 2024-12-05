import 'package:elearning_dashboard/features/lessons/data/source/lesson_source.dart';
import 'package:elearning_dashboard/features/lessons/domain/repo/lesson_repo.dart';
import 'package:elearning_dashboard/features/quizes/data/source/quize_source.dart';
import 'package:elearning_dashboard/features/quizes/domain/repo/quize_repo.dart';

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
}

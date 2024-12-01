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
    CoursesRemoteSource(firestoreService: injector<FirestoreService>()),
  );
  injector.registerSingleton<CoursesRepo>(
    CoursesRepoImpl(coursesRemoteSource: injector<CoursesRemoteSource>()),
  );
}

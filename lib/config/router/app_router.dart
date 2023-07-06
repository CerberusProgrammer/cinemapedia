import 'package:go_router/go_router.dart';

import '../../presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: 'movie/:id',
          name: MovieScreen.appRouterName,
          builder: (context, state) {
            final movieID = state.pathParameters['id'] ?? 'no-id';

            return MovieScreen(movieID: movieID);
          },
        )
      ],
    ),
  ],
);

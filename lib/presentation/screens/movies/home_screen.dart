import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer: SideBar(),
      body: _HomeView(),
      bottomNavigationBar: CustomButtonNavigation(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();

    // Aqui estamos inicializando a nuestro metodo
    // que esta en nuestro provider, debemos usar
    // ref.read() ya que solo queremos leer y no
    // agregar nada nuevo a nuestro estado del
    // provider que nos proporciona RiverPod.
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    // final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final nowPlayingRecentMovies = ref.watch(moviesSlideshowProvider);

    if (nowPlayingRecentMovies.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    return Column(
      children: [
        const CustomAppBar(),
        MoviesSlideshow(movies: nowPlayingRecentMovies),
        MovieHorizontalListView(
          title: 'En Cines',
          movies: nowPlayingRecentMovies,
        ),
      ],
    );
  }
}

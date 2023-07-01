import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/screens/widgets/shared/custom_appbar.dart';
import 'package:cinemapedia/presentation/screens/widgets/shared/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer: SideBar(),
      body: _HomeView(),
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
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);

    if (nowPlayingMovies.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    return Column(
      children: [
        CustomAppBar(),
        Expanded(
          child: ListView.builder(
            itemCount: nowPlayingMovies.length,
            itemBuilder: ((context, index) {
              final movie = nowPlayingMovies[index];

              return ListTile(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Image.network(movie.posterPath);
                      });
                },
                trailing: Image.network(movie.posterPath),
                title: Text(movie.title),
              );
            }),
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hoegen_fietsverhuur/di.dart';
import 'package:hoegen_fietsverhuur/presentation/bikes/bikes_cubit.dart';
import 'package:hoegen_fietsverhuur/presentation/bikes/bikes_state.dart';
import 'package:hoegen_fietsverhuur/presentation/utils/transparent_image.dart';

class BikesScreen extends StatelessWidget {
  const BikesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<BikesCubit>(),
      child: const _BikesContent(),
    );
  }
}

class _BikesContent extends StatelessWidget {
  const _BikesContent();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BikesCubit, BikesState>(
        builder: (context, state) => switch (state) {
          BikesLoadingState() =>
            const Center(child: CircularProgressIndicator()),
          BikesLoadedState() => GridView.count(
              crossAxisCount:
                  (MediaQuery.of(context).size.width ~/ 400).clamp(1, 100),
              children: state.bikes.map((e) {
                return BikeTile(
                  id: e.id,
                  albumId: e.albumId,
                  title: e.title,
                  url: e.url,
                  thumbnailUrl: e.thumbnailUrl,
                );
              }).toList(),
            ),
          BikesErrorState() => const Placeholder(),
        },
      ),
    );
  }
}

class BikeTile extends StatelessWidget {
  final int id;
  final int albumId;
  final String title;
  final String url;
  final String thumbnailUrl;

  const BikeTile({
    super.key,
    required this.id,
    required this.albumId,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: url,
          ),
        ),
        Text(title),
      ],
    );
  }
}

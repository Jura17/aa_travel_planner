import 'package:aa_travel_planner/repositories/destination_repository.dart';
import 'package:aa_travel_planner/repositories/favorites_repository.dart';
import 'package:aa_travel_planner/screens/destination_details_screen.dart';
import 'package:aa_travel_planner/widgets/destination_card.dart';
import 'package:flutter/material.dart';

class ExploreDestinationsScreen extends StatelessWidget {
  final DestinationRepository destinationRepository;
  final FavoritesRepository favoritesRepository;

  const ExploreDestinationsScreen({
    super.key,
    required this.destinationRepository,
    required this.favoritesRepository,
  });

  @override
  Widget build(BuildContext context) {
    final destinations = destinationRepository.getAllDestinations();

    return ListView.builder(
      itemCount: destinations.length,
      itemBuilder: (context, index) {
        final destination = destinations[index];
        return DestinationCard(
          destination: destination,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DestinationDetailsScreen(
                  destination: destination,
                  favoritesRepository: favoritesRepository,
                ),
              ),
            );
          },
        );
      },
    );
  }
}

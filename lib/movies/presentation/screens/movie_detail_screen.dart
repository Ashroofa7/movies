import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/movies/presentation/components/movie_details_component/movie_details_component.dart';
import 'package:movies/movies/presentation/controllers/movie_details_controller/movie_details_bloc.dart';
import 'package:movies/movies/presentation/controllers/movie_details_controller/movie_details_event.dart';

import '../../../core/services/services_locator.dart';

class MovieDetailScreen extends StatelessWidget {
  final int id;

  const MovieDetailScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) =>
        sl<MovieDetailsBloc>()
          ..add(GetMovieDetailsEvent(id))..add(GetMovieRecommendation(id)),
        lazy: false,
        child: const Scaffold(
        body: MovieDetailsComponent(),)
    ,
    );
  }
}

// class MovieDetailContent extends StatelessWidget {
//
//
//   const MovieDetailContent({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<MovieDetailsBloc,MovieDetailsStates>(
//       builder: ( context, state) {
//         switch(state.movieDetailsStates){
//           case RequestState.loading:
//         return  Shimmer.fromColors(
//           baseColor: Colors.grey[850]!,
//           highlightColor: Colors.grey[500]!,
//           child: Container(
//
//               color: Colors.white,
//
//           ),
//         );
//           case RequestState.loaded:
//             return  const MovieDetailsComponent();
//
//           case RequestState.error:
//             return Text(state.movieDetailsMessage);
//         }
//         },
//     );
//   }
//
//
//
//
//
//   Widget _showRecommendations() {
//     return BlocBuilder<MovieDetailsBloc,MovieDetailsStates>(
//         builder: (context,state){
//       switch(state.recommendationsState){
//
//         case RequestState.loading:
//           return Container(
//             height: 170,
//             color: Colors.white,
//           );
//         case RequestState.loaded:
//           return SliverGrid(
//             delegate: SliverChildBuilderDelegate(
//                   (context, index) {
//                 final recommendation = state.recommendations[index];
//                 return FadeInUp(
//                   from: 20,
//                   duration: const Duration(milliseconds: 500),
//                   child: ClipRRect(
//                     borderRadius: const BorderRadius.all(Radius.circular(4.0)),
//                     child: CachedNetworkImage(
//                       imageUrl: ApiConstance.imageUrl(recommendation.backdropPath!),
//                       placeholder: (context, url) =>
//                           Shimmer.fromColors(
//                             baseColor: Colors.grey[850]!,
//                             highlightColor: Colors.grey[800]!,
//                             child: Container(
//                               height: 170.0,
//                               width: 120.0,
//                               decoration: BoxDecoration(
//                                 color: Colors.black,
//                                 borderRadius: BorderRadius.circular(8.0),
//                               ),
//                             ),
//                           ),
//                       errorWidget: (context, url, error) => const Icon(Icons.error),
//                       height: 180.0,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 );
//               },
//               childCount: state.recommendations.length,
//             ),
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               mainAxisSpacing: 8.0,
//               crossAxisSpacing: 8.0,
//               childAspectRatio: 0.7,
//               crossAxisCount: 3,
//             ),
//           );
//         case RequestState.error:
//           return Text(state.recommendationsMessage);
//       }
//     });
//   }
//
// }

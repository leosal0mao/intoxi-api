import 'package:equatable/equatable.dart';
import '../dtos/dtos.dart';

abstract class AnimeEvent extends Equatable {}

class AnimeFetched extends AnimeEvent {
  final AnimeDto params;

  AnimeFetched(this.params);

  @override
  List<Object> get props => [params];
}

part of 'publication_cubit.dart';

abstract class PublicationState extends Equatable {}

class PublicationInitial extends PublicationState {
  @override
  List<Object?> get props => [];
}

class PublicationLoading extends PublicationState {
  @override
  List<Object?> get props => [];
}

class PublicationSuccess extends PublicationState {
  final List<Publication> listPublications;

  PublicationSuccess(this.listPublications);
  @override
  List<Object?> get props => [listPublications];
}

class PublicationError extends PublicationState {
  @override
  List<Object?> get props => [];
}

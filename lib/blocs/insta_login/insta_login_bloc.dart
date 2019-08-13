import 'package:bloc/bloc.dart';
import 'insta_bloc.dart';

class InstaLoginBloc extends Bloc<InstaSignInEvent, InstaLoginState> {
  @override
  InstaLoginState get initialState => InstaLoginInitial();

  @override
  Stream<InstaLoginState> mapEventToState(InstaSignInEvent event) async* {
    if (event is InstaLoginEvent) {
      yield InstaLoginLoading();
    } else if (event is InstaReturnInitialState) {
      yield InstaLoginInitial();
    }
  }
}

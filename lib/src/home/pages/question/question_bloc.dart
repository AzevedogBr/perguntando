import 'package:bloc_pattern/bloc_pattern.dart';

class QuestionBloc extends BlocBase {
  final String tag;

  QuestionBloc(this.tag);

  //dispose will be called automatically by closing its streams
  @override
  void dispose() {
    super.dispose();
  }
}

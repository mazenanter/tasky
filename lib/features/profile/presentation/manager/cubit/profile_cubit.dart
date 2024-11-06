import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  List<String> titles = [
    'NAME',
    'PHONE',
    'LEVEL',
    'YEARS OF EXPERIENCE',
    'LOCATION'
  ];
}

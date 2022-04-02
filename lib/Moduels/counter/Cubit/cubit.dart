import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/Moduels/counter/Cubit/state.dart';

class countercubit extends Cubit<counterstate>
{

  countercubit() :super(counterfir()) ;
  static countercubit get(context)=>BlocProvider.of(context);
  int counter=1;

  void min()
  {
    counter--;
    emit(countermin());
    
  }
void plus()
{
  counter++;
  emit(counterplus());
}
  
  


}
import 'package:flutter_bloc/flutter_bloc.dart';
import 'main.dart';

class CounterCubit extends Cubit<int> {
CounterCubit() : super(0);

void increment(){
  emit(state + 1);
}

void decrement() {
  if(state>0){
  emit(state - 1);
  }
  else{emit(0);
  };
}

void reset(){
  emit(0);
}

void multiply() {

}

void divide() {
  emit(state%2);
}
}
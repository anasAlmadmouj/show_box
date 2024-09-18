import 'package:show_box/core/app_imports/app_imports.dart';

enum RequestState{
  loading,
  loaded,
  error;

  const RequestState();




 static  Widget RequestMessageWidget({required RequestState state, required Widget widget,required String message}) {
   switch(state){
     case RequestState.loading:
       return const SizedBox(
         height: 400,
         child: Center(child: CircularProgressIndicator()),
       );
     case RequestState.loaded:
       return widget;
     case RequestState.error:
       return SizedBox(
         height: 400,
         child: Center(child: Text(message)),
       );
   }
}
}
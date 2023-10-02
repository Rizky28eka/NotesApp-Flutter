import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_sapp/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:note_sapp/cubits/notes_cubit/notes_cubit.dart';
import 'add_note_form.dart';

class AddNoteButtomSheet extends StatelessWidget {
  //! دا المكان الى الواجهه بتتغير فيه عشان كدا حطيت عليه البلوك
  const AddNoteButtomSheet(
      {super.key}); //? this is the place that state changes into

  @override
  Widget build(BuildContext context) {
    //! بخلى المكان دا يسمع للتغيرات الى بتحصل فى الاستيت
    //! بدى الصلاحيه للمكان دا و اودجيت التابعه ليه انهم يستخدمو البلوك دا
    return BlocProvider( //! provide this code with bloc to enable it to use it
      create: (context) => AddNoteCubit(), //? enable to use this addnote cubit

      child: BlocConsumer<AddNoteCubit, AddNoteState>( //? write what to do when state change
        //! BlocConsumer → that rebuild UI
        listener: (context, state) {
          //? listener → write what to do when state changes
          if (state is AddNoteFailure) //? if error
          {
            print('Faild: ${state.errMessage}');
          }
          if (state is AddNoteSuccess) //? if state is success change UI pop
          {
            //? اول ما يخزن النوت الجديده بخليه يقرا عشان يخزن النوت الجديده فى الليست
            BlocProvider.of<NotesCubit>(context).getAllNotes(); //! when add Success reapeat geting data again to update UI
            Navigator.pop(context); //? if got good return back
          }
        },
        builder: (context, state) {
          return  AbsorbPointer(
            absorbing: state is AddNoteLoading ? true :false, //! when it is true it make user not able to make any thing
            child: Padding(
              padding:  EdgeInsets.only(left: 16,right: 16,
              bottom: MediaQuery.of(context).viewInsets.bottom //? give it size of keyboard
              ),
              child: const SingleChildScrollView(
                  child:
                      AddNoteForm()),
            ),
          );
        },
      ),
    );
  }
}

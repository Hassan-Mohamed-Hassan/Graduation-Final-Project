import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:untitled15/constants/constants.dart';
import 'package:untitled15/modules/parent/Bloc/Cubit.dart';
import 'package:untitled15/modules/parent/Bloc/States.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

import 'DrawerParent.dart';

class AbsenceChildren extends StatelessWidget {
  const AbsenceChildren({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>CubitParent()..GetChildren(),
        child: BlocConsumer<CubitParent,ParentStates>(
          listener: (context,state){},
            builder: (context,state){
            var cubit=CubitParent.get(context);
            return  Scaffold(
              appBar: AppBar(
                title: Text('Absence'),
              ),
              drawer: Drawer(
                backgroundColor: defaultColor,
                width: MediaQuery.of(context).size.width *0.55 ,
                child: DrawerItem(profileData),
              ),
              body: ConditionalBuilder(
                  condition: state is! GetAbsenceChlidrenLoadingState ,
                  builder: (context)=>
                      Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        FormHelper.dropDownWidgetWithLabel(
                          context,
                          'Choose Student ',
                          'Choose Student',
                          cubit.idStudent,
                          cubit.listIdStudent,
                              (value){
                            cubit.idStudent=value;
                            var id=int.parse(value);
                             cubit.GetAbsence(id: id);
                            print(value);
                          },
                              (onValidate){
                            if(onValidate ==null) {
                              return 'please enter name';
                            }
                            return null;
                          },
                          optionValue: "id",
                          optionLabel: "name",
                          // hintColor: Colors.white,
                          textColor: Colors.black,
                          //  borderColor: color,
                        ),
                        SizedBox(height: 15,),
                        if(state is GetAbsenceChlidrenSuccessState)
                          cubit.getAbsenceChildrenModel!.room!.length !=0?
                          Text('${cubit.getAbsenceChildrenModel!.room![0].name}'):Text(''),
                           SizedBox(height: 15,),
                        Container(
                          height: 40,
                          color: defaultColor,
                          width: double.infinity,
                          child: Center(child: Text('Status',style: TextStyle(color: Colors.white),)),
                        ),
                        SizedBox(height: 15,),
                        if(state is GetAbsenceChlidrenSuccessState)
                          cubit.getAbsenceChildrenModel!.room!.length !=0?
                          cubit.getAbsenceChildrenModel!.room![0].absence!.length !=0?
                            ConditionalBuilder(
                                condition: state is! GetAbsenceChlidrenLoadingState,
                                builder: (context)=>Text('present',style: TextStyle(fontSize: 20,color: secondColor),),
                                fallback: (context)=>Center(child: CircularProgressIndicator())
                            ):
                            ConditionalBuilder(
                            condition: state is! GetAbsenceChlidrenLoadingState,
                            builder: (context)=>Text('absent',style: TextStyle(fontSize: 20,color: Colors.red),),
                            fallback: (context)=>Center(child: CircularProgressIndicator())
                        ):
                              Text(''),










                      ],
                    ),
                  ), 
                  fallback: (context)=>Center(child: CircularProgressIndicator())
              ),
            );
            },
            
        )
    );
  }
}

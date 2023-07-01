import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:untitled15/modules/parent/Bloc/Cubit.dart';
import 'package:untitled15/modules/parent/Bloc/States.dart';
import 'package:flutter/material.dart';
import 'package:untitled15/modules/parent/DrawerParent.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

import '../../constants/constants.dart';

class ResultChildren extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;

    return BlocProvider(
      create: (context)=>CubitParent()..GetChildren(),
      child: BlocConsumer<CubitParent,ParentStates>(
        listener: (context,state){},
        builder: (context,state){
          var cubit=CubitParent.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text('Result'),
              backgroundColor: defaultColor,

            ),
            drawer: Drawer(
              backgroundColor: defaultColor,
              width: MediaQuery.of(context).size.width *0.55 ,
              child: DrawerItem(profileData),
            ),
            body:ConditionalBuilder(
                condition: state is! GetChildrenLoadingState,
                builder: (context)=>Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      FormHelper.dropDownWidgetWithLabel(
                        borderColor:secondColor,
                        contentPadding: 10,
                        labelFontSize: 0,
                        validationColor: secondColor,
                        borderFocusColor: secondColor,
                        context,
                        'Choose Student ',
                        'Choose Student',
                        cubit.idStudent,
                        cubit.listIdStudent,
                            (value){
                          cubit.idStudent=value;
                          var id=int.parse(value);
                           cubit.GetResult(id:id);
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
                      if(state is GetResultParentSuccessState)
                        cubit.getResultToParentModel!.results.length !=0?
                        Text('${cubit.getResultToParentModel!.results[0].room.name}')
                            :Text(' '),
                      SizedBox(height: 15,),
                      Container(
                          height: 50,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          color: defaultColor,
                          width: double.infinity,
                          child: Row(
                            children: [
                              Expanded(flex: 2,child: Text('Name Exam ',maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.white)),),
                              Expanded(flex: 1,child: Text('Degree Exam ',style: TextStyle(color: Colors.white))),

                            ],
                          )
                      ),
                      SizedBox(height: 8,),
                      if(state is GetResultParentSuccessState)
                        cubit.getResultToParentModel!.results!.length !=0?
                        Expanded(
                          child: ListView.separated(
                              itemBuilder:(context,index)=> Row(
                                    children: [
                                      Expanded( flex: 2,child: Text('${cubit.getResultToParentModel!.results[index].name}',maxLines: 2,overflow: TextOverflow.ellipsis,)),
                                      Expanded( flex: 1,child: Text('${cubit.getResultToParentModel!.results[index].results[0].studentdegree}/${cubit.getResultToParentModel!.results[index].results[0].subjectdegree}')),
                                    ],
                                  ),

                              separatorBuilder: (context,index)=>SizedBox(height: 10,),
                              itemCount: cubit.getResultToParentModel!.results.length
                          ),
                        ):
                            Text('Not Found Result Student',style: TextStyle(color: secondColor),)




                    ],
                  ),
                ),
                fallback: (context)=>Center(child: CircularProgressIndicator())
            )

          );
        },

      ),
    );
  }

}



import 'dart:ffi';

double bmiCalculation({required int weight,required int height}){
 double h=  height * 0.01;
//double bmi=
  double result =  weight / (h*h);
return result;
}

String healthState({required double result}){
 String status = '';
 if(18.5 >result){
  status = 'Under Weight';
 }else if (result <= 24.9){
  status = ' Healthy Weight';
 }else if (result <= 29.9){
  status ='Over Weight';
 }else{
  status = 'Obesity';
 }
return status;

}

String healthText({ required double result }){
 String out = '';
 if(result < 18.5){
  out ='   You are in Under Weight category ,you need to gain weight ';
 }else if ( result<= 24.9){
  out = '  You have a normal body weigh. Good job !';
 }else if( result <= 29.9){
  out ='   You are in Over Weight category , you need to loss weight';
 }else{
  out ='  You are in Obesity category , you need to loss weight';
 }
 return out;
}
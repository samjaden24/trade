// void main(){
  // ClassName name=ClassName(name: "Ragav",age: 27);
//  name.name="Value";
  // name.function1();
//   double value1=10.567;
// print(value1.toStringAsFixed(2));

//   ClassName nameOfClass =ClassName();
//   nameOfClass.setAgevalue=-20;
//   nameOfClass.setnamevalue="";

//   print(nameOfClass.getNameData+'\n'+nameOfClass.getAgeData.toString()); 

//   nameOfClass.setAgevalue=27;
//   nameOfClass.setnamevalue="Ragav";

//   print(nameOfClass.getNameData+'\n'+nameOfClass.getAgeData.toString());
  // nameOfClass.
  // }

// class ClassName{
//   String _name='';
//    int _age=0;
// String get getNameData=>this._name;

// set setnamevalue(String data){
// if(data.isEmpty){
//   print("Name should not be Empty!!!");
// }else{
//   this._name=data;
//   print("Hello, ${data.replaceAll("Ragav", "Krishna")}");
// }
// }

// int get getAgeData=>this._age;
// set setAgevalue(int data){
// if(data.isNegative){
//   print("Age should not be in Negative");
// }else{
//   this._age=data;
//   print("Age:, $data");
// }

// }
// }



// void main(){
// StaticClass objects=StaticClass();
// StaticClass.function1();



// }
// const int data=20;

// class StaticClass{
//   static int age =24;
// int notmyAge=40;
// StaticClass objects=StaticClass();
//   static void function1(){
// print(age);
//   }
// }




// abstract class Parant{
//   void function1(){}
// }
// class Cls1 extends Parant {
//   @override
//   void function1(){
// print("Class1");
//   }
// }

// class Cls2 extends Parant{
//   @override
//   void function1(){
//     print("Class2");
//   }
// }

// class Exicute extends Parant{
//   @override
// void function1(){
//   print("Exection1");
// }
// }

// void main(){
// List<Parant> sam =[Cls1(),Cls2(),Exicute()];

// for (var deebug in sam) {

//   deebug.function1();
// }
//   }



// class Inter1{
//   int function1(int val){
//     return val-2;
//   }
// }
// class Inter2{
//   int function2(int val){
//     return val*2;
//   }
// }
// class Inter3{
//   int function3(int val){
//     return val+2;
//   }
// }
// class Cl1{
//   int function1(int val){
//     // print("Test90");
//     return val;
//   }
// }
// class DataClass extends Cl1 implements Inter1,Inter2,Inter3{

// @override
//   int function1(int val) {
  
//  return val+val;
//   }
  
//   @override
//   int function2(int val) {
//    return 50;
//   }
  
//   @override
//   int function3(int val) {
//    return 27;
//   }
// }

// void main(){
// DataClass data =DataClass();
// print(data.function1(5));
// print(data.function2(5));
// print(data.function3(5));
// Inter1 IntVal=Inter1();
// print(IntVal.function1(5));
// }


// mixin Mixin1{
//   void function1(){
//     print("Bala");
//   }
// }
// mixin Mixin2{
//   void function1(){
//     print("BalaSir");
//   }
// }mixin Mixin3{
//   void function1(){
//     print("BalaTL");
//   }
// }mixin Mixin4{
//   void function1(){
//     print("BalaRemo");
//   }
// }mixin Mixin5{
//   void function1(){
//     print("BalaSubu");
//   }
// }
// class Cls4{

// }
// class Cls5{

// }
// class DataClass extends Cls4 with Mixin1,Mixin2,Mixin3,Mixin4,Mixin5 implements Cls5 {
// }

// void main(){

//   DataClass data =DataClass();
//   data.function1();
// }



void main(){
var val=GetString("hgvhgv");
    print("Exception::::::$val");
}

int GetString(String value){
  try {
    int store=int.parse(value);
    if (!store.isNaN) {
      return store;
      
    }else{
      
           print( "Value should not be empty");
           return 0;
    }
  }on FormatException{
    print("This FormatException");
    return 0;
  }
   catch (e) {
print("Exception::::::$e");
     return 0;
  }
  finally{
    print("I'll print always");
  }
 
}
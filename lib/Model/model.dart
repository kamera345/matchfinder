
/*
* Here in this model class we are accepting int value from homepage
* and if it is even we return list[0] object
* or else we return list[1]
*
* the objects inside the list are the names of the image files and text
* */

class Model{
  int value;
  Model({required this.value});

  List content = [
    {
      'image':'match',
      'text':'MATCH FOUND',
    },
    {
      'image':'nomatch',
      'text':'MATCH NOT FOUND',
    },
  ];


  imageShow(){
    if(value.isEven){
      return content[0];
    }else{
      return content[1];
    }
  }
}
package Jquery

class Tab {

   static constraints = {
    //specifies the field display order in the list and edit views
    name(blank:true)
    city(blank:true)
  
   
    
  }
  //define field types
  String name
  String city
  
 
 

  static mapping = {
    // Default Sort is ascending:
    sort "name"
  }

  def beforeInsert() {
    // TODO make this an automagic field/column once the app is aware of the current user:
    //    updatedByEmail = User.current

    // TODO make this an automagic field/column once the app is aware of the
    // current user:
    //    createdByEmail =
  }

  def beforeUpdate() {
    // TODO make this an automagic field/column once the app is aware of the current user:
    //    updatedByEmail = User.current
  }
}
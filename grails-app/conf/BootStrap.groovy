
import Jquery.Customer
import Jquery.Tab
import Jquery.New

class BootStrap {

   def init = { servletContext -> 
       // if we have an empty customer database,   // create some test data   
        if (Customer.count() == 0) {    
            new Customer(firstName:'Betty', lastName:'Rubble',       age:27,       emailAddress:'john@somewhere.com'    ).save()  
            new Customer(firstName:'Wilma', lastName:'Flintstone',       age:37,       emailAddress:'frank@somewhere.com'    ).save()   
            new Customer(firstName:'Fred', lastName:'Flintstone',       age:34,       emailAddress:'dave@somewhere.com'    ).save() 
            new Customer(firstName:'Barney', lastName:'Rubble',       age:44,       emailAddress:'barney@somewhere.com'    ).save() 
        }
       if (Tab.count() == 0) {
          new Tab(name: 'Linda Mayforth', city: 'Albuquerque').save()
          new Tab(name: 'Robert Kerwin', city: 'Albuquerque').save()
       }  
      if (New.count() == 0 ){
          new New(firstName: 'Betty', lastName:'Rubble', someDate:'8/1/2012').save()
          new New(firstName:  'Wilma', lastName: 'Flintstone', someDate:'8/1/2012').save()
          new New(firstName: 'Fred', lastName: 'Flintstone', someDate:'8/1/2012').save()
      }
   }
  
}
                  
 
   

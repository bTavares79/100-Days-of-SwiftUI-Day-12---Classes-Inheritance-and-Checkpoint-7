import UIKit



// ================================ How to create your own class ================================
class Game{
    var score = 0{
        didSet {
            print("Score is now \(score)")
        }
    }
}

var newGame = Game()
newGame.score += 5
print(newGame.score)


// ================================ How to inherit for one class to another =====================
class Employee {
    let hours: Int
    
    // This is a custom initializer
    // not sure why you don't just set the value to a default to start like 0
    init(hours: Int){
        self.hours = hours
    }
    
    func printSummary() {
        print("I work \(hours) hours per day")
    }
}



// These two classes below inhert from the base class of employee. So both of these classes have
// the hours variable
class Developer: Employee {
    func work() {
        print("I'm writing code for \(hours) hours.")
    }
    
    
    // This overrides the parent class function with the same name. Swift makes you use the override
    // keyword to do this. You must make a change to the function so your code comiples
    override func printSummary() {
        print("I am a developer working who works \(hours) hours per day working on code and the rest of the day I debate the usgae of tabs or spaces")
    }
}

// The final keyword is used to make sure no other classes can inhert from this class
final class Manager: Employee {
    func work() {
        print("I'm going to meetings \(hours) hours")
    }
}


let Robert = Developer(hours: 8)
let Joseph = Manager(hours: 10)
Robert.work()
Joseph.work()

let Novall = Developer(hours: 8)
Novall.printSummary()


// ====================================== How to add initializers to classes =================
class Vehicle {
    let isElectricl: Bool
    
    init(isElectric: Bool) {
        self.isElectricl = isElectric
    }
}


class Car: Vehicle {
    let isConvertable: Bool
    
    // When inheriting from a base class or super class that has a custom initializer, you have to add this initializer to your subclass as well.
    // this is done in the code below
    init (isElectric: Bool, isConvertable: Bool){
        self.isConvertable = isConvertable
        super.init(isElectric: isElectric)
    }
}

// You can also write the above class like below and not have to worry about the initializer gymnastics
// in this example below you can't write to this property of this sub class because it is a let variable type
class Car2: Vehicle {
    let isConvertable = false
}

let TeslaX = Car(isElectric: true, isConvertable: false)
let TeslaRoadster = Car2(isElectric: true)



//======================================================== How to copy classes ====================================================
// classes are called reference types. All the data is refernced not copied from location to location

class User {
    var username = "Annonymous"
}

var user1 = User()
var user2 = user1
user2.username = "Taylor"

// This below will show both instances of the class have the same name. It will be Taylor.
// This is the intended functionality for classes in Swift.
print(user1.username)
print(user2.username)


// if you want to allow unique versions of a class you have to add a copy function to the class
// Example
class UserCopy {
    var username = "Annonymous"
    
    func copy() -> UserCopy {
        let usercopy = UserCopy()
        usercopy.username = username
        return usercopy
    }
}


// This you would have to call this explicitly when you make a copy of the class
var bill = UserCopy()
var mike = bill.copy()
mike.username = "Maximo"

print(bill.username)
print(mike.username)



// ================================================================== How to create deinitialier for a class ============================================
class Person {
    let id: Int

    init(id: Int) {
        self.id = id
        print("User \(id): I'm alive!")
    }

    // This is the deinitializer
    // No () with this function
    deinit {
        print("User \(id): I'm dead!")
    }
}

var people = [Person]()

for i in 1...3 {
    let person = Person(id: i)
    print("User \(person.id): I'm in control!")
    people.append(person)
}

print("Loop is finished")
people.removeAll()
print("Array is clear")


// ======================================== Working with variables inside classes ========================================
class UserPerson {
    var name = "Paul"
}

let thisUser = UserPerson()
thisUser.name = "Taylor"
print(thisUser.name)





// Differences between classes and structs

//First, classes can inherit from other classes, which means they get access to the properties and methods of their parent class. You can optionally override methods in child classes if you want, or mark a class as being final to stop others subclassing it.

//Second, Swift doesn’t generate a memberwise initializer for classes, so you need to do it yourself. If a subclass has its own initializer, it must always call the parent class’s initializer at some point.

//Third, if you create a class instance then take copies of it, all those copies point back to the same instance. This means changing some data in one of the copies changes them all.

//Fourth, classes can have deinitializers that run when the last copy of one instance is destroyed.

//Finally, variable properties inside class instances can be changed regardless of whether the instance itself was created as variable.

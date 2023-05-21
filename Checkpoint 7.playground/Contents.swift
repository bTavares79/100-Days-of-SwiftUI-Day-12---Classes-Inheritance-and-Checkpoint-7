import UIKit

class Animal {
    var legs = 2
}


class Dog: Animal {
    func speak(){
        print("This dog is barking")
    }
}

class Corgi: Dog {
    override func speak(){
        print("This corgi is barking")
    }
}

class Poodle: Dog {
    override func speak(){
        print("This poodle is barking")
    }
}

class Cat: Animal {
    var isTame: Bool
    
    init ( isTame: Bool){
        self.isTame = isTame
    }
    
    func speak() {
        print("This cat is talking to you")
    }
}

class Persian: Cat {
    override func speak(){
        print("This persian cat is talking")
    }
}

class Lion: Cat {
    override func speak(){
        print("This lion is talking")
    }
}

var animal = Animal()
animal.legs = 4

print(animal.legs)


var mut = Dog()
mut.legs = 4
mut.speak()

var bigButtCorgi = Corgi()
bigButtCorgi.speak()
bigButtCorgi.legs = 6
print(bigButtCorgi.legs)

//Classes are also similar to structs in that they allow us to create new types with properties and methods, but they have five important differences.
//The first difference between classes and and structs is that classes never come with a memberwise initializer. this means we always must create our own initializer
//F.e

class Dog {
    var name: String
    var breed: String
    
    init(name:String, breed: String) {
        self.name = name
        self.breed = breed
    }
    
}
//Creating instances of that class looks just like the same as if it were a struct:
let poppy = Dog(name: "Poppy", breed: "Poodle")

//The second difference between classes and structs is that we can create a class based on a existing class - it inherits all the properties and methods of the original class, and can add its own on top.
//This called class inheritance or sublassing, the class u inherit from is called "parent" or "super" class, and the new class is called the "Child" class.

//Here is the Cat normal cat class

class Cat {
    var name: String
    var breed:String
    
    init(name:String, breed: String) {
    self.name = name
    self.breed = breed
    }
    
}
//Now we can create a new class based on that one called Egyptian sub class. it will inherit the same properties and intializers as Dog by default:

//class Egyptian: Cat {
    
//}

 // However, we can also give Egyptian its own initializer. We know it will always have the breed "Egyptian", so we can make a new initializer that only needs a name property. Even better, we can make The Egyptian initializer call the Cat initializer directly so that same setup happenns:

class Egyptian: Cat {
    init(name:String) {
        super.init(name: name, breed: "Egyptian")
    }
}
//For safety reasons, Swift always makes u call super.init() from child classes - just in case the parent class dose some important work when its created.


//Overriding methods

//Child classes can replace parent methods with their own implementations - a process known as overriding. Here's trivial Cat class with makeNoise() method:
class Cat1 {
    func makeNoise() {
        print("Meow")
    }
}
// If we create a new Egyptian class that inherits from Cat, it will inherit the makeNoise() method. So, this will print "Meow":
//class Egyptian1: Cat1 {
    
//}
let kitty = Egyptian1()
kitty.makeNoise()

//Method overriding allows us to change the implementation of makeNoise() for the Cat class.
//Swift reqiures us to use override func rather than just a func when overriding method - it stops u from overriding a method by accident, and u will get an error if u try to override something that doesnt exist on a parent class:

class Egyptian1: Cat1 {
    override func makeNoise() {
        print("Meow men senga kuyov")
    }
}

kitty.makeNoise()
// With that change kitty.makeNoise() will print "Meow men senga kuyov" rather than a "Meow"

//Although class inheritance is very useful - and in fact large parts of Apples platforms require u to use it - sometimes u want to disallow other developers from building their own class based om ours.

//Swift give us a final keyword just for this purpose: when you declare a class as being final, no other class can inherit from it. This means they cant override ur methods in order to change ur behavior - they need to use ur class they way it was written.
//To make a class final just put the final keyword before it, like this:

final class Horse {
    var name: String
    var breed: String
    
    init(name:String, breed: String) {
        self.name = name
        self.breed = breed
    }
    
}
//The third difference between classes and structs is how they are copied. When we copy a struct, both original and copy are different things - changing one wont change other. When we copy a class, both the original and copy point to the same thing, so cahnging one does change the other.
//F.e here is a simple Reader class that has a  name and property with default value:

class Reader {
    var name = "Taylor Swift"
}
//If we create an instance of that class and prints its name, we will get "Taylor Swift"
var reader = Reader()
print(reader.name)

//Now lets create a second a variable fromm the first one and change its name:
var readerCopy = reader
readerCopy.name = "Shohmurod"

//Because of the way classes work, both reader and readerCopy point to the same object in memory, so when we print the reader name we will see "Shohmurod"
print(reader.name)

//On the other hand if Reader was a struct then we would get "Taylor Swift " printed a second time.



//The fourth difference between class and struct is that classes can have deinitilizers - code that gets run when instance of a class is destroyed.

//To demonstrate this, here is a Person class with a name property, a simple initializer, and printGreeting() method that prints a message:

class Person {
    var name = "Adham aka"
    
    init() {
        print("\(name) is alive!")
    }
    func printGreeting() {
        print("Hello, I am \(name)")
    }
//And now for the deinitializer. This will called when the Person instance is being destroyed:
    deinit {
            print("\(name) is no more")
        }
    }


//We are going to create a few instance of the Person class inside a loop, because each time the loop goes around a new person will be created then destroyed:
for _ in 1...3 {
    let person = Person()
    person.printGreeting()

}
//And now for the deinitializer. This will called when the Person instance is being destroyed: string number 126 deinit()


//Mutability
//The final difference between classes and structs is the way they deal with constants. if u have constant struct with a variable property, that property, cant be changed beacause the struct itself is constant.

//However if we have constant class with a variable property, the property can be changed. Because of this, classes dont need mutating keyword with methods that can change properties; thats only needed with structs.

//This difference means u can change any variable property on a class even when the class is created as a constant this is a perfectly valid code:

class Builder {
    var name = "Taylor Swift"
}
let taylor = Builder()
taylor.name = "Ed Sheeran"
print(taylor.name)

//If we want stop that from happening we need to make the property constant value
class Builder1 {
    let name = "Taylor Swift"
}

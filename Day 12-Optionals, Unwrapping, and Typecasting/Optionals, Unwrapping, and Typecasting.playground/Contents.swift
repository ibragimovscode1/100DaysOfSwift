//Handling missing data
//We have used types such as Int to hold values like 5. But if we wanted to store an age property for users, what wold we do if we did not know someones age?

//We might say "well we will store 0", but then we would get confused between new-born babies and people whose age we dont know.
// We could use a special number such as 1000 or -1 to represent "unknown", both of which are impossible ages, but then would we really remember that number in all places its used?

//Swift solutions is called optionals, and we can make optionals out of any type. An optional integer might have a number like 0 or 40, but it might have no value at all - it might literally be missing, which is nill in Swift.

//To make a type optional, add a qustion mark after it. For ex. we can make optional integer like this:

var age: Int? = nil
//That doesnt hold any number - it holds nothing. But if we later learn that age, we can use it:
age = 34

//Unwrapping optionals

//Optional strings might contain a string like "Hello" or they might be nil - nothing at all.
//Consider this optional string:

var name: String? = nil
//What happens if we use name.count? A real string has count property that stores how many letters it has, but this is nil - its empty memory, not a string, so it doesnt have a count.

//Cause of this trying to read name.count is unsafe and Swift wont allow it. Instead we must look inside the optional and see whats there a process known as unwrapping.

//A common way of unwrapping optional is with if let synatax, which unwraps with a condition. if there was a value inside the optional then we can use it, but if there was not condition fails.

if let unwrapped = name {
    print("\(unwrapped.count) letters")
} else {
    print("Missing name")
}

//If name holds a string, it will be put inside unwrapped as a regular String and we can read this count property inside the condition. In antother case if name is empty , the else code will be run.

//Unwrapping with Guard

//An alternative to if let is guard let, which also unwraps optionals. guard let unwrap an optional for us, but if it finds nil inside it expects us to exit the function, loop, or condition we used it in.

//However, the major diffence between if let and guard let is that ur unwrapped optional remains usable after the guard code.
//Lets try it out with greet() function. This will accept an optional string as its only parameter and try to unwrap it, but if there is nothing inside it will print a message and exit. Because optionals unwrapped using guard let stay around after the guard finishes, we can print unwrapped string at the end of the function:

func greet(_ name:String?) {
    guard let unwrapped = name else {
        print("You did not provide a name!")
        return
    }
    print("Hello, \(unwrapped)!")
}
//Using guard let lets u deal with problems at the start of ur functions then exit immediately. This means the rest of your function is the happy path - the path ur code takes if everything is correct.

//Force Unwrapping

//Optionals represent data that may not be there, but sometimes we know for sure that a value is not nil. In the cases, Swift lets us force unwrap the optional: convert it from an optional type to a non-optional type.

//For example if u have a string that contains a number, we can covert it to an Int like this:

let str = "5"
let num = Int(str)

//That makes num an optional Int because we might have tried to convert a string like "Fish" rather than "5"

//Even though Swift is not sure the conversion will work, we can see the code is safe so we can once unwrap  the result by writing! after Int(str), like this:
 
let num0 = Int(str)!
//Swift will immediately unwrap the optional and make num a regular Int rather than an Int?. But if we are wrong if str was something that could not be converted to an integer - ur code will crash.
//As a result, we should force unwrap only when you are sure its safe - there as a reason its often called the crash operator.

//Implicity unwrapped optionals
//Like regular optionals, implicity unwrapped optionals might contain a value or they might be nil. However, unlike regular optionals we dont need to unwrap them in order to use them: we can use them as if they werent  optional at all

//Implicity unwrapped optionals are created by adding an exclamation mark after ur type, name like this:

let age0: Int! = nil

//Because they behave as if they were already unwrapped, we dont need if let or guard let to use implicity unwrapped otionals. However, if we try to use them and they have no value if they are nil - our code crashes.
//Implicitly unwrapped optionals exist because sometimes a variable will start life as nil, but will always have a value before we need to use it . Because we know that they will have a value by the time we need them , its helpful not having to write if let all the time.

//Nil coalescing

//The nil coalsecing operator unwraps an optional and returns the value inside if there is one. if there is not value- if the optional was nil- then default value is used instead. Either way, the result wont be optional: it will either be the value from inside the optional or the default value as a backup.
//Here is a function that accepts an integer as its only parameter and returns a otional string:

func useraname(for id: Int) -> String? {
    if id == 1 {
        return "Brad Pit"
        
    } else {
        return nil
    }
}
 //If we call that with ID 15 we will get back nil cause the user is not recognized, but with nil coaelescing we can provide a default value of "Anonymous" like this:
let user = useraname(for: 15) ?? "Anonymous"
//That will check the result that comes back from the username() func if its string then it will be unwrapped and placed into user, but if it has nil inside then "Anonymous" will be used instead.

//Optional chaining
//Swift provides us with a shortcut when using the optionals: if u want acces smthng like a.b.c and b is optional, we can write q question mark after it to enable optional chaining: a.b?.c.
//When that code is run Swift will check whether b has a value, and if its nil the rest of line will be ignored - Swift will return nil immediately. But if it has a value, it it will be unwrapped and execution will continue.

//For ex

let names = ["","John","AbuBakr","Gina"]

//We are going to use first property of that array, which will return first anme if there is one or nil if the array is empty.
//We can then call uppercased() on the result to make it an uppercase string:
let group = names.first?.uppercased()
//The question  mark is optional chainin - if first returns nil then Swift wont try to uppercase it , and will set group to nil immediately


//Back when we were talking about throwing functions, we looked at this code:

enum PasswordError: Error {
    case obvious
}

func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }

    return true
}

do {
    try checkPassword("password")
    print("That password is good!")
} catch {
    print("You can't use that password.")
}
//That runs a throwing function, using do, try, and catch to handle errors gracefully.

//There are two alternatives to try, both of which will make more sense now that you understand optionals and force unwrapping.

//The first is try?, and changes throwing functions into functions that return an optional. If the function throws an error you’ll be sent nil as the result, otherwise you’ll get the return value wrapped as an optional.

//Using try? we can run checkPassword() like this:

if let result = try? checkPassword("password") {
    print("Result was \(result)")
} else {
    print("D'oh.")
}
//The other alternative is try!, which you can use when you know for sure that the function will not fail. If the function does throw an error, your code will crash.

//Using try! we can rewrite the code to this:

try! checkPassword("sekrit")
print("OK!")


//When talking about force unwrapping, we used this code:

let str0 = "5"
let num1 = Int(str)
//That converts a string to an integer, but because you might try to pass any string there what you actually get back is an optional integer.

//This is a failable initializer: an initializer that might work or might not. You can write these in your own structs and classes by using init?() rather than init(), and return nil if something goes wrong. The return value will then be an optional of your type, for you to unwrap however you want.

//As an example, we could code a Person struct that must be created using a nine-letter ID string. If anything other than a nine-letter string is used we’ll return nil, otherwise we’ll continue as normal.

//Here’s that in Swift:

struct Person {
    var id: String

    init?(id: String) {
        if id.count == 9 {
            self.id = id
        } else {
            return nil
        }
    }
}

//Swift must always know the type of each of your variables, but sometimes you know more information than Swift does. For example, here are three classes:

class Animal { }
class Fish: Animal { }

class Dog: Animal {
    func makeNoise() {
        print("Woof!")
    }
}
//We can create a couple of fish and a couple of dogs, and put them into an array, like this:

let pets = [Fish(), Dog(), Fish(), Dog()]
//Swift can see both Fish and Dog inherit from the Animal class, so it uses type inference to make pets an array of Animal.

//If we want to loop over the pets array and ask all the dogs to bark, we need to perform a typecast: Swift will check to see whether each pet is a Dog object, and if it is we can then call makeNoise().

//This uses a new keyword called as?, which returns an optional: it will be nil if the typecast failed, or a converted type otherwise.

//Here’s how we write the loop in Swift:

for pet in pets {
    if let dog = pet as? Dog {
        dog.makeNoise()
    }
}

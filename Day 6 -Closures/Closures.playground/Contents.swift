//Swift let us use functions like any other type of string and integers. This means we can create a function and assign it to the variable and even pass that function into another functions as a parameters
//Functions used int this way are called closures, and although they work like functions they are written like this:

let driving = {
    print("I am driving a car")
}
// That effectively creates a function without a name, and assigns that function to driving.
// now we can call driving() as if it regular in functions

driving()

//Accepting parameters as closures

//To make a closure to accept the parameters, list them inside parantheses just after the opening braces, then write in so that Swift knows the main body of the closure is starting.
 
let driving1 = { (place:String) in
    print("I am going to \(place)")
    }
//One of the differences between functions and closures is that u dont use parameter labels when runnig closures.

driving1("Tashkent")

//Returning values
//Closures can also return values are written simiraly to parameters:we write them inside our closure right before in keyword.

let driving2 = {(place: String) -> String in
    return "I am going to \(place)"
    }
let message = driving2 ("Close to u..")
print(message)

//Clousers as a parameters
//if we wanted to pass that closure into a function so it can be run inside that function, we would specify the parameter type as () -> Void. That means "accepts no parameters and returns Void" - another way of saying "Nothing" in Swift.

// So we can write a function a travel() function that accepts diferrent type of traveling actions, and prints a msg before and after:

let driving3 = {
    print("I am on my way")
}
func travel(action: () -> Void) {
    print("I am coming yuhuu ;)")
    action()
    print("I arrived!")
}
//Now we can call that using our driving closure, like this:
travel(action: driving3)

// Trailing closure syntax
// If the last parameter in function that we are using is a closure then we can just use em directly after function inside the braces.
//F.e



func travel1(action: () -> Void) {
    print("I am just getting ready")
    action()
    print("Yo man")
}
travel {
    print("I am here yo")
}

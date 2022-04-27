//All the properties and methods we’ve created so far have belonged to individual instances of structs, which means that if we had a Student struct we could create several student instances each with their own properties and methods:

struct Student {
    var name: String

    init(name: String) {
        self.name = name
    }
}

let ed = Student(name: "Ed")
let taylor = Student(name: "Taylor")
//You can also ask Swift to share specific properties and methods across all instances of the struct by declaring them as static.

//To try this out, we’re going to add a static property to the Student struct to store how many students are in the class. Each time we create a new student, we’ll add one to it:

struct Student1 {
    static var classSize = 0
    var name: String

    init(name: String) {
        self.name = name
        Student1.classSize += 1
    }
}
//Because the classSize property belongs to the struct itself rather than instances of the struct, we need to read it using Student.classSize:

print(Student1.classSize)


//Access control lets you restrict which code can use properties and methods. This is important because you might want to stop people reading a property directly, for example.

//We could create a Person struct that has an id property to store their social security number:

struct Person {
    var id: String

    init(id: String) {
        self.id = id
    }
}

let ed = Person1(id: "12345")
//Once that person has been created, we can make their id be private so you can’t read it from outside the struct – trying to write ed.id simply won’t work.

//Just use the private keyword, like this:

struct Person1 {
    private var id: String

    init(id: String) {
        self.id = id
    }
}
//Now only methods inside Person can read the id property. For example:

struct Person1 {
    private var id: String

    init(id: String) {
        self.id = id
    }

    func identify() -> String {
        return "My social security number is \(id)"
    }
}
//Another common option is public, which lets all other code use the property or method.

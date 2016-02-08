//: Playground - noun: a place where people can play

/*:
**Exercise:** Get Acquainted. Get a few properties of each person in your class... name and email are good. Use the `String` and `Character` as well as the data types and operators in [Basics | Data Types | Operators](Basics%20|%20Data%20Types%20|%20Operators) to complete this exercise.
>> **Example Output:**
* `My name is Mathew Sheets, my email is swift.dude@gmail.com`
* `Other students in my class are Annie, Sam, Jack, Hudson, Oliver`
* `Oliver dropped this class` (**use the string above to pull out the last persons name**)
* `CARSON was added to the class` (**use the string above and insert another person before the second person**)
* `Jack and Hudson are in the class` (**use the string above to pull out fourth and fifth person**)
*/
var todo1 = (firstName: "Pete", lastName: "Carswell", date:"01282016", item: "Go back and do Exercise 1.")
var todo2 = (firstName: "Sandi", lastName: "Metts", date:"01282016", item: "Go back and do Exercise 1.")
var todo3 = (firstName: "Maury", lastName: "Schwartz", date:"01282016", item: "Go back and do Exercise 1.")
var todo4 = (firstName: "Yosemity", lastName: "Sam", date:"01282016", item: "Go back and do Exercise 1.")
var todo5 = (firstName: "Bugs", lastName: "Bunny", date:"01282016", item: "Go back and do Exercise 1.")

var todos = (todo1, todo2, todo3, todo4, todo5)
let mirror = Mirror(reflecting: todos)

/*
func generatorForTuple (tuple: Any) -> AnyGenerator<Any> {
    return AnyGenerator(Mirror(reflecting: tuple).children.lazy.map {$0.value}.generate())
}

for child in mirror.children {
    print(child.value)
}


for child in mirror.children {
    //if
}
*/

func iterate<C, R>(t:C, block: (String, Any) -> R) {
    let mirror = Mirror(reflecting: t)
    for case let (label?, value) in mirror.children {
        block(label, value)
    }
}

iterate(todos) {(label, value) -> (label: String, value: Any) in
    print("\(label) - \(value)")
    return (label, value)
}


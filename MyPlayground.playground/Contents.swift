import UIKit


func travel(action: (String) -> String) {
    print("I m get")
    let descr = action("Mayami")
    print(descr)
    print("i arrived")
}

travel { (place: String) in
    return "I m going to \(place)"
}

import Foundation

struct MockData {
    static let sampleAppetizer = Appetizer(
        id: 1,
        name: "Asian Flank Steak",
        description: "This perfectly thin cut just melts in your mouth.",
        price: 8.99,
        imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg",
        calories: 300,
        protein: 14,
        carbs: 0)
    
    static let appetizers = [
        Appetizer(
            id: 1,
            name: "Asian Flank Steak",
            description: "This perfectly thin cut just melts in your mouth.",
            price: 8.99,
            imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg",
            calories: 300,
            protein: 14,
            carbs: 0),
        
        Appetizer(
            id: 2,
            name: "Blackened Shrimp",
            description: "Seasoned shrimp from the depths of the Atlantic Ocean.",
            price: 6.99,
            imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/blackened-shrimp.jpg",
            calories: 450,
            protein: 4,
            carbs: 3),
        
        Appetizer(
            id: 3,
            name: "Buffalo Chicken Bites",
            description: "The tasty bites of chicken have just the right amount of kick to them.",
            price: 7.49,
            imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/buffalo-chicken-bites.jpg",
            calories: 800,
            protein: 5,
            carbs: 22),
        
        Appetizer(
            id: 4,
            name: "Chicken Avocado Spring Roll",
            description: "These won't last 10 seconds once they hit the table.",
            price: 12.99,
            imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/chicken-avocado-spring-roll.jpg",
            calories: 480,
            protein: 7,
            carbs: 19),
    ]
}

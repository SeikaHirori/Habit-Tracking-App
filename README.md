#  Habit Tracking App

## Specs
Link: https://www.hackingwithswift.com/guide/ios-swiftui/4/3/challenge

``
Hints:

Start with your data: define a struct that holds a single activity, and a class that holds an array of activities.
The class will need to conform to ObservableObject and use @Published for its property.
Your main listing and form should both be able to read the shared activities object.
Make sure your activity conforms to Identifiable to avoid problems.
Present your adding form using sheet(), and your activity detail view (if you add one) using NavigationLink.
Making the button to increment completion count will challenge you, because you need to modify the activity that was passed in. If you’re stuck, the easiest approach is this:

Make your struct conform to Equatable. You don’t need anything special here – just add Equatable after Codable and Identifiable.
Pass both the selected activity and the ObservableObject class into your detail view.
When the increment button is tapped, copy the existing activity and add 1 to its completion count.
Use firstIndex(of:) to find where the previous activity was in the class’s array, then change it to be your new activity – something like data.activities[index] = newActivity will work. (This requires the Equatable conformance from step 1!)
``

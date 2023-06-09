#  Habit Tracking App

## Specs
Link: https://www.hackingwithswift.com/guide/ios-swiftui/4/3/challenge

``
This time your goal is to build a habit-tracking app, for folks who want to keep track of how much they do certain things. That might be learning a language, practicing an instrument, exercising, or whatever – they get to decide which activities they add, and track it however they want.

At the very least, this means there should be a list of all activities they want to track, plus a form to add new activities – a title and description should be enough.

For a bigger challenge, tapping one of the activities should show a detail screen with the description. For a tough challenge – see the hints below! – make that detail screen contain how many times they have completed it, plus a button incrementing their completion count.

And if you want to make the app really useful, use Codable and UserDefaults to load and save all your data.

So, there are three levels to this app, and you can choose how far you want to go depending on how much time you have and how far you want to push yourself. I do recommend you at least give each level a try, though – every little bit of practice you get helps solidify your learning!

---
TODO:
- [ ] Save to UserDefaults

Hints:
- [x] Start with your data: define a struct that holds a single activity, and a class that holds an array of activities.
- [x] The class will need to conform to ObservableObject and use @Published for its property.
- [x] Your main listing and form should both be able to read the shared activities object.
    - I think this is met?
- [x] Make sure your activity conforms to Identifiable to avoid problems.
- [x] Present your adding form using sheet(), and your activity detail view (if you add one) using NavigationLink.
    - NOTE: ~~Currently having the styles reversed; need to change later~~
        - Fixed to spec


Making the button to increment completion count will challenge you, because you need to modify the activity that was passed in. If you’re stuck, the easiest approach is this:
- [x] Make your struct conform to Equatable. You don’t need anything special here – just add Equatable after Codable and Identifiable.
- [x] Pass both the selected activity and the ObservableObject class into your detail view.
- [x] When the increment button is tapped, copy the existing activity and add 1 to its completion count.
- [x] Use firstIndex(of:) to find where the previous activity was in the class’s array, then change it to be your new activity – something like data.activities[index] = newActivity will work. (This requires the Equatable conformance from step 1!)
``

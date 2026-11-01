
import Foundation

class ExerciseStore {

    // Shared instance accessible throughout Buffi
    static let shared = ExerciseStore()

    // Stores all exercises
    private(set) var exercises: [Exercise] = [
        Exercise(
            name: "Bench Press",
            duration: 15,
            muscleGroups: ["Chest", "Triceps", "Shoulders"],
            date: Date()
        ),
        Exercise(
            name: "Squats",
            duration: 20,
            muscleGroups: ["Quadriceps", "Glutes", "Hamstrings"],
            date: Date()
        ),
        Exercise(
            name: "Bicep Curls",
            duration: 10,
            muscleGroups: ["Biceps", "Forearms"],
            date: Date()
        )
    ]

    private init() {}

    // Add an exercise
    func addExercise(_ exercise: Exercise) {
        exercises.append(exercise)
    }

    // Get exercises completed today
    func getTodaysExercises() -> [Exercise] {
        return exercises.filter {
            Calendar.current.isDateInToday($0.date)
        }
    }
}

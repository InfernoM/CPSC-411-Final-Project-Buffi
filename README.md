
# Buffi - A Fitness Activity Tracker

## Project Description

Buffi is a mobile app that allows users to keep track of their exercises. This app is to be used by gym-goers or anyone who consistently exercises. It solves the problem of not being able to keep track of what exercises you have completed and what exercises you need to complete in a day. It has an add function which allows users to record exercises, track workout durations, and view the muscle groups targeted during their workouts. The home screen lists their daily workout. 

For future implementation, there will be workout routines that users can set for themselves and a tracker that will track the workouts they've completed so far compared to the workouts they still need to complete for the day.

---

## Screens

### 1. HomeViewController
The main dashboard displaying a welcome message and navigation options for adding exercises and viewing today's workouts.

### 2. ExerciseListViewController
Displays exercises completed on the current date using a `UITableView`. Each exercise shows its name, duration, and targeted muscle groups.

### 3. ExerciseDetailViewController
Displays detailed information about a selected exercise, including its name, duration, date, and muscle groups.

### 4. AddEditExerciseViewController
Provides text fields for entering exercise names, workout durations, and targeted muscle groups. Users can save new exercises to the application's temporary exercise collection.

---

## Navigation Diagram

```text
                    Home
                      |
             +--------+--------+
             |                 |
             v                 v
       Add Exercise     Today's Exercises
             |                 |
             |                 v
             |           Exercise Details
             |
             v
       Save Exercise
             |
             v
            Home
```

## Screenshots

<p align="center">
  <img src="HomeScreen.png" width="200" alt="Home Screen">
  <img src="ExerciseList.png" width="200" alt="Exercise List">
  <img src="ExerciseDetails.png" width="200" alt="Exercise Details">
  <img src="AddExercise.png" width="200" alt="Add Exercise">
</p>

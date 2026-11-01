
import UIKit

class ExerciseListViewController: UIViewController {

    // Properties

    private let tableView = UITableView()

    private var exercises: [Exercise] = []

    // Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupAppearance()
        setupTableView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        exercises = ExerciseStore.shared.getTodaysExercises()

        tableView.reloadData()
    }

    // Appearance

    private func setupAppearance() {
        view.backgroundColor = .black

        title = "Today's Exercises"

        navigationItem.largeTitleDisplayMode = .always
    }

    // Table View

    private func setupTableView() {

        tableView.backgroundColor = .black

        tableView.dataSource = self
        tableView.delegate = self

        tableView.register(
            UITableViewCell.self,
            forCellReuseIdentifier: "ExerciseCell"
        )

        tableView.rowHeight = 90

        tableView.separatorColor = .darkGray

        view.addSubview(tableView)

        tableView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor
            ),
            tableView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor
            ),
            tableView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor
            ),
            tableView.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor
            )
        ])
    }
}

// UITableViewDataSource

extension ExerciseListViewController: UITableViewDataSource {

    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return exercises.count
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(
            withIdentifier: "ExerciseCell",
            for: indexPath
        )

        let exercise = exercises[indexPath.row]

        var content = cell.defaultContentConfiguration()

        content.text = exercise.name
        content.secondaryText =
            "\(exercise.muscleGroups.joined(separator: ", ")) • \(exercise.duration) min"

        content.textProperties.color = .white
        content.secondaryTextProperties.color = .lightGray
        content.secondaryTextProperties.numberOfLines = 2

        cell.contentConfiguration = content
        cell.backgroundColor = UIColor(
            white: 0.10,
            alpha: 1
        )

        cell.accessoryType = .disclosureIndicator
        cell.selectionStyle = .default

        return cell
    }
}

// UITableViewDelegate

extension ExerciseListViewController: UITableViewDelegate {

    // Called when a user taps an exercise
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {

        // Remove selection highlight
        tableView.deselectRow(
            at: indexPath,
            animated: true
        )

        // Get the selected exercise
        let selectedExercise = exercises[indexPath.row]

        // Create the Exercise Detail screen
        let detailVC = ExerciseDetailViewController(
            exercise: selectedExercise
        )

        // Navigate to the Detail screen
        navigationController?.pushViewController(
            detailVC,
            animated: true
        )
    }
}


import UIKit

class ExerciseDetailViewController: UIViewController {

    // Properties

    private let exercise: Exercise

    private let nameLabel = UILabel()
    private let durationLabel = UILabel()
    private let dateLabel = UILabel()
    private let muscleGroupsLabel = UILabel()

    private let stackView = UIStackView()

    // Initializer

    init(exercise: Exercise) {
        self.exercise = exercise
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupAppearance()
        setupLabels()
        setupStackView()
    }

    // Appearance

    private func setupAppearance() {
        view.backgroundColor = .black
        title = "Exercise Details"

        navigationItem.largeTitleDisplayMode = .never
    }

    // Labels

    private func setupLabels() {

        nameLabel.text = exercise.name
        nameLabel.textColor = .white
        nameLabel.font = .systemFont(
            ofSize: 28,
            weight: .bold
        )

        durationLabel.text =
            "Duration: \(exercise.duration) minutes"

        let formatter = DateFormatter()
        formatter.dateStyle = .long

        dateLabel.text =
            "Date: \(formatter.string(from: exercise.date))"

        muscleGroupsLabel.text =
            "Muscle Groups: " +
            exercise.muscleGroups.joined(separator: ", ")

        let detailLabels = [
            durationLabel,
            dateLabel,
            muscleGroupsLabel
        ]

        for label in detailLabels {
            label.textColor = .lightGray
            label.font = .systemFont(ofSize: 17)
            label.numberOfLines = 0
        }
    }

    // Stack View

    private func setupStackView() {

        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .fill
        stackView.distribution = .fill

        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(durationLabel)
        stackView.addArrangedSubview(dateLabel)
        stackView.addArrangedSubview(muscleGroupsLabel)

        view.addSubview(stackView)

        stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([

            stackView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: 30
            ),

            stackView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 20
            ),

            stackView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -20
            )
        ])
    }
}

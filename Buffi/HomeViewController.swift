
import UIKit

class HomeViewController: UIViewController {

    // Components

    private let welcomeLabel = UILabel()
    private let addExerciseButton = UIButton(type: .system)
    private let todayExerciseButton = UIButton(type: .system)

    private let mainStackView = UIStackView()

    // View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupAppearance()
        setupWelcomeLabel()
        setupButtons()
        setupStackView()
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        let formatter = DateFormatter()
        formatter.dateStyle = .full

        let currentDate = formatter.string(from: Date())

        var configuration = todayExerciseButton.configuration
        configuration?.subtitle = currentDate
        todayExerciseButton.configuration = configuration
    }


    // Appearance

    private func setupAppearance() {
        view.backgroundColor = .black

        title = "Home"

        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always

        navigationController?.navigationBar.tintColor = .systemBlue
        navigationController?.navigationBar.barStyle = .black

        let plusButton = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(openAddExercise)
        )

        navigationItem.rightBarButtonItem = plusButton
    }

    // Welcome Label

    private func setupWelcomeLabel() {
        welcomeLabel.text =
            "Welcome to Buffi, a personalized fitness tracker!"

        welcomeLabel.textColor = .white
        welcomeLabel.font = .systemFont(
            ofSize: 22,
            weight: .semibold
        )

        welcomeLabel.numberOfLines = 0
    }

    // Buttons

    private func setupButtons() {

        configureButton(
            addExerciseButton,
            title: "Add / Edit Exercises",
            subtitle: "Manage your exercises",
            icon: "dumbbell.fill",
            color: .systemBlue
        )

        addExerciseButton.addTarget(
            self,
            action: #selector(openAddExercise),
            for: .touchUpInside
        )

        let formatter = DateFormatter()
        formatter.dateStyle = .full

        let currentDate = formatter.string(from: Date())

        configureButton(
            todayExerciseButton,
            title: "Today's Exercises",
            subtitle: currentDate,
            icon: "calendar",
            color: .systemGreen
        )

        todayExerciseButton.addTarget(
            self,
            action: #selector(openTodayExercises),
            for: .touchUpInside
        )
    }

    private func configureButton(
        _ button: UIButton,
        title: String,
        subtitle: String,
        icon: String,
        color: UIColor
    ) {

        var configuration = UIButton.Configuration.plain()

        configuration.title = title
        configuration.subtitle = subtitle

        configuration.image = UIImage(
            systemName: icon
        )

        configuration.imagePlacement = .leading
        configuration.imagePadding = 16

        configuration.baseForegroundColor = .white

        configuration.background.backgroundColor =
            UIColor(white: 0.10, alpha: 1)

        configuration.background.cornerRadius = 14

        configuration.contentInsets = NSDirectionalEdgeInsets(
            top: 20,
            leading: 16,
            bottom: 20,
            trailing: 16
        )

        configuration.titleTextAttributesTransformer =
            UIConfigurationTextAttributesTransformer {
                attributes in

                var updated = attributes
                updated.font = .systemFont(
                    ofSize: 18,
                    weight: .semibold
                )

                return updated
            }

        configuration.subtitleTextAttributesTransformer =
            UIConfigurationTextAttributesTransformer {
                attributes in

                var updated = attributes
                updated.font = .systemFont(ofSize: 13)
                updated.foregroundColor = .lightGray

                return updated
            }

        button.configuration = configuration
        button.tintColor = color
        button.contentHorizontalAlignment = .leading

        button.heightAnchor.constraint(
            greaterThanOrEqualToConstant: 90
        ).isActive = true
    }

    // Stack View

    private func setupStackView() {

        mainStackView.axis = .vertical
        mainStackView.spacing = 16
        mainStackView.alignment = .fill
        mainStackView.distribution = .fill

        mainStackView.addArrangedSubview(welcomeLabel)
        mainStackView.addArrangedSubview(addExerciseButton)
        mainStackView.addArrangedSubview(todayExerciseButton)

        view.addSubview(mainStackView)

        mainStackView.translatesAutoresizingMaskIntoConstraints =
            false

        NSLayoutConstraint.activate([

            mainStackView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: 24
            ),

            mainStackView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 20
            ),

            mainStackView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -20
            )
        ])
    }

    // Navigation Actions

    @objc private func openAddExercise() {
        let addExerciseVC = AddEditExerciseViewController()
        navigationController?.pushViewController(
            addExerciseVC,
            animated: true
        )
    }

    @objc private func openTodayExercises() {
        let exerciseListVC = ExerciseListViewController()
        navigationController?.pushViewController(
            exerciseListVC,
            animated: true
        )
    }
}

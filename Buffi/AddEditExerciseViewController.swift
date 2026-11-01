
import UIKit

class AddEditExerciseViewController: UIViewController {

    // UI Components

    private let nameField = UITextField()
    private let durationField = UITextField()
    private let muscleGroupsField = UITextField()

    private let saveButton = UIButton(type: .system)
    private let stackView = UIStackView()

    // Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupAppearance()
        setupTextFields()
        setupSaveButton()
        setupStackView()
    }

    // Appearance

    private func setupAppearance() {
        view.backgroundColor = .black
        title = "Add Exercise"

        navigationItem.largeTitleDisplayMode = .always
    }

    // Text Fields

    private func setupTextFields() {

        configureTextField(
            nameField,
            placeholder: "Exercise Name"
        )

        configureTextField(
            durationField,
            placeholder: "Duration (minutes)"
        )

        durationField.keyboardType = .numberPad

        configureTextField(
            muscleGroupsField,
            placeholder: "Muscle Groups (comma separated)"
        )
    }

    private func configureTextField(
        _ textField: UITextField,
        placeholder: String
    ) {
        textField.placeholder = placeholder
        textField.textColor = .white
        textField.backgroundColor = UIColor(
            white: 0.12,
            alpha: 1
        )

        textField.borderStyle = .roundedRect

        textField.attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [
                .foregroundColor: UIColor.lightGray
            ]
        )

        textField.heightAnchor.constraint(
            equalToConstant: 50
        ).isActive = true
    }

    // Save Button

    private func setupSaveButton() {

        saveButton.setTitle(
            "Save Exercise",
            for: .normal
        )

        saveButton.backgroundColor = .systemBlue
        saveButton.setTitleColor(.white, for: .normal)

        saveButton.titleLabel?.font = .systemFont(
            ofSize: 18,
            weight: .semibold
        )

        saveButton.layer.cornerRadius = 12

        saveButton.heightAnchor.constraint(
            equalToConstant: 50
        ).isActive = true

        saveButton.addTarget(
            self,
            action: #selector(saveExercise),
            for: .touchUpInside
        )
    }

    // Stack View

    private func setupStackView() {

        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .fill
        stackView.distribution = .fill

        stackView.addArrangedSubview(nameField)
        stackView.addArrangedSubview(durationField)
        stackView.addArrangedSubview(muscleGroupsField)
        stackView.addArrangedSubview(saveButton)

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

    // Save Action

    
    @objc private func saveExercise() {

        // Get exercise name
        let name = (nameField.text ?? "")
            .trimmingCharacters(in: .whitespacesAndNewlines)

        // Get duration
        let duration = Int(durationField.text ?? "") ?? 0

        // Get muscle groups
        let muscleGroups = (muscleGroupsField.text ?? "")
            .split(separator: ",")
            .map {
                $0.trimmingCharacters(in: .whitespacesAndNewlines)
            }
            .filter { !$0.isEmpty }

        // Basic input validation
        guard !name.isEmpty,
            duration > 0,
            !muscleGroups.isEmpty else {

            let alert = UIAlertController(
                title: "Invalid Input",
                message: "Please enter an exercise name, a valid duration, and at least one muscle group.",
                preferredStyle: .alert
            )

            alert.addAction(
                UIAlertAction(title: "OK", style: .default)
            )

            present(alert, animated: true)
            return
        }

        // Create exercise object
        let newExercise = Exercise(
            name: name,
            duration: duration,
            muscleGroups: muscleGroups,
            date: Date()
        )

        // Save exercise to shared store
        ExerciseStore.shared.addExercise(newExercise)

        // Show confirmation
        let alert = UIAlertController(
            title: "Exercise Saved",
            message: "\(name) has been added to today's exercises.",
            preferredStyle: .alert
        )

        alert.addAction(
            UIAlertAction(
                title: "OK",
                style: .default,
                handler: { [weak self] _ in

                    // Return to previous screen
                    self?.navigationController?.popViewController(
                        animated: true
                    )
                }
            )
        )

        present(alert, animated: true)
    }
}

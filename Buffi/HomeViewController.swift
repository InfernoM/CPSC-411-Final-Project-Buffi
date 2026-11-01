import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
        title = "Home"

        setupUI()
    }

    func setupUI() {

        let welcomeLabel = UILabel()
        welcomeLabel.text =
            "Welcome to Buffi, a personalized fitness tracker!"

        welcomeLabel.textColor = .white
        welcomeLabel.numberOfLines = 0
        welcomeLabel.font = .systemFont(
            ofSize: 22,
            weight: .semibold
        )

        let addButton = UIButton(type: .system)
        addButton.setTitle(
            "Add / Edit Exercises",
            for: .normal
        )

        let todayButton = UIButton(type: .system)
        todayButton.setTitle(
            "Today's Exercises",
            for: .normal
        )

        let stackView = UIStackView(
            arrangedSubviews: [
                welcomeLabel,
                addButton,
                todayButton
            ]
        )

        stackView.axis = .vertical
        stackView.spacing = 24

        view.addSubview(stackView)

        stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                constant: 20
            ),
            stackView.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                constant: -20
            ),
            stackView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: 40
            )
        ])
    }
}
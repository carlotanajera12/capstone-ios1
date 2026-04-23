//
//  MotivationViewController.swift
//  CollegeSuccessToolkit3
//
//
import UIKit

struct Quote: Codable {
    let q: String
    let a: String
}

class MotivationViewController: UIViewController {

    private let campusTips = [
        "Take breaks so your brain can reset.",
        "Check Canvas and email daily.",
        "Use tutoring before you feel behind.",
        "Office hours can save you hours.",
        "Start assignments early to reduce stress."
    ]

    private var currentQuoteText: String = ""
    private var currentAuthorText: String = ""

    // MARK: - UI

    private let quoteTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Quote of the Day"
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.textAlignment = .center
        return label
    }()

    private let quoteLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Loading..."
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 22, weight: .medium)
        return label
    }()

    private let authorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18)
        label.textColor = .secondaryLabel
        return label
    }()

    private let refreshButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Refresh Quote", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        return button
    }()

    private let saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Save Favorite ❤️", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        return button
    }()

    private let divider1 = UIView()
    private let divider2 = UIView()

    private let tipTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Student Tip"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .center
        return label
    }()

    private let tipLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 17)
        label.textColor = .secondaryLabel
        return label
    }()

    private let favoriteTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Saved Favorite"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .center
        return label
    }()

    private let favoriteQuoteLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "No favorite saved yet."
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 17)
        label.textColor = .secondaryLabel
        return label
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Daily Boost"
        view.backgroundColor = .systemBackground

        setupUI()
        loadFavoriteQuote()
        updateTip()
        fetchQuote()
    }

    // MARK: - UI Setup

    private func setupUI() {
        divider1.backgroundColor = .systemGray4
        divider2.backgroundColor = .systemGray4

        [divider1, divider2].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

        view.addSubview(quoteTitleLabel)
        view.addSubview(quoteLabel)
        view.addSubview(authorLabel)
        view.addSubview(refreshButton)
        view.addSubview(saveButton)
        view.addSubview(divider1)
        view.addSubview(tipTitleLabel)
        view.addSubview(tipLabel)
        view.addSubview(divider2)
        view.addSubview(favoriteTitleLabel)
        view.addSubview(favoriteQuoteLabel)

        refreshButton.addTarget(self, action: #selector(refreshTapped), for: .touchUpInside)
        saveButton.addTarget(self, action: #selector(saveFavoriteTapped), for: .touchUpInside)

        NSLayoutConstraint.activate([

            quoteTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            quoteTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            quoteTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            quoteLabel.topAnchor.constraint(equalTo: quoteTitleLabel.bottomAnchor, constant: 20),
            quoteLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            quoteLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            authorLabel.topAnchor.constraint(equalTo: quoteLabel.bottomAnchor, constant: 12),
            authorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            authorLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            refreshButton.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 20),
            refreshButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            saveButton.topAnchor.constraint(equalTo: refreshButton.bottomAnchor, constant: 12),
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            divider1.topAnchor.constraint(equalTo: saveButton.bottomAnchor, constant: 30),
            divider1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            divider1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            divider1.heightAnchor.constraint(equalToConstant: 1),

            tipTitleLabel.topAnchor.constraint(equalTo: divider1.bottomAnchor, constant: 20),
            tipTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tipTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            tipLabel.topAnchor.constraint(equalTo: tipTitleLabel.bottomAnchor, constant: 10),
            tipLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tipLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            divider2.topAnchor.constraint(equalTo: tipLabel.bottomAnchor, constant: 30),
            divider2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            divider2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            divider2.heightAnchor.constraint(equalToConstant: 1),

            favoriteTitleLabel.topAnchor.constraint(equalTo: divider2.bottomAnchor, constant: 20),
            favoriteTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            favoriteTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            favoriteQuoteLabel.topAnchor.constraint(equalTo: favoriteTitleLabel.bottomAnchor, constant: 10),
            favoriteQuoteLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            favoriteQuoteLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }

    // MARK: - Logic

    private func updateTip() {
        tipLabel.text = campusTips.randomElement()
    }

    @objc private func refreshTapped() {
        updateTip()
        fetchQuote()
    }

    @objc private func saveFavoriteTapped() {
        UserDefaults.standard.set(currentQuoteText, forKey: "favoriteQuote")
        UserDefaults.standard.set(currentAuthorText, forKey: "favoriteAuthor")
        loadFavoriteQuote()
    }

    private func loadFavoriteQuote() {
        if let q = UserDefaults.standard.string(forKey: "favoriteQuote"),
           let a = UserDefaults.standard.string(forKey: "favoriteAuthor") {
            favoriteQuoteLabel.text = "“\(q)”\n\n- \(a)"
        }
    }

    private func fetchQuote() {
        guard let url = URL(string: "https://zenquotes.io/api/random") else { return }

        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data,
                  let decoded = try? JSONDecoder().decode([Quote].self, from: data),
                  let first = decoded.first else { return }

            DispatchQueue.main.async {
                self.currentQuoteText = first.q
                self.currentAuthorText = first.a

                self.quoteLabel.text = "“\(first.q)”"
                self.authorLabel.text = "- \(first.a)"
            }
        }.resume()
    }
}

//
//  ResourceDetailViewController.swift
//  CollegeSuccessToolkit3
//
//
import UIKit
import SafariServices

//PROTOCOL
protocol ResourceAction {
    func openResource(url: String)
}

class ResourceDetailViewController: UIViewController, ResourceAction {

    var resource: Resource?

    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 26, weight: .bold)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    let summaryTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "What this service provides"
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textAlignment = .center
        return label
    }()

    let summaryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.textColor = .secondaryLabel
        return label
    }()

    let linkButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Visit Resource", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        title = "Resource Details"

        setupUI()
        configureContent()
    }

    func setupUI() {
        view.addSubview(titleLabel)
        view.addSubview(summaryTitleLabel)
        view.addSubview(summaryLabel)
        view.addSubview(linkButton)

        linkButton.addTarget(self, action: #selector(openLink), for: .touchUpInside)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),

            summaryTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 28),
            summaryTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            summaryTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),

            summaryLabel.topAnchor.constraint(equalTo: summaryTitleLabel.bottomAnchor, constant: 16),
            summaryLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            summaryLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),

            linkButton.topAnchor.constraint(equalTo: summaryLabel.bottomAnchor, constant: 32),
            linkButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    func configureContent() {
        guard let resource = resource else {
            titleLabel.text = "No Resource Found"
            summaryLabel.text = "This resource could not be loaded."
            return
        }

        titleLabel.text = resource.title
        summaryLabel.text = resource.summary
    }

    // ✅ Protocol function implementation
    func openResource(url: String) {
        guard let link = URL(string: url) else { return }

        let safariVC = SFSafariViewController(url: link)
        present(safariVC, animated: true)
    }

    // ✅ Button uses protocol
    @objc func openLink() {
        guard let resource = resource else { return }
        openResource(url: resource.url)
    }
}

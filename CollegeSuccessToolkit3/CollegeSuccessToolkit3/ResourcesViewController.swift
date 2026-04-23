//
//  ResourcesViewController.swift
//  CollegeSuccessToolkit3
//
//  
import UIKit

class ResourcesViewController: UITableViewController {

    var resources: [Resource] = [
        Resource(
            title: "Tutoring Center (UCAE)",
            summary: "The University Center for Academic Excellence helps students strengthen study habits, improve time management, and get tutoring support.",
            url: "https://ucae.charlotte.edu/",
            type: .academic
        ),
        Resource(
            title: "Counseling Services (CAPS)",
            summary: "Provides mental health support including stress, anxiety, and emotional wellness services.",
            url: "https://caps.charlotte.edu/",
            type: .health
        ),
        Resource(
            title: "Career Center",
            summary: "Helps with resumes, interviews, internships, and career planning.",
            url: "https://career.charlotte.edu/",
            type: .career
        ),
        Resource(
            title: "Library",
            summary: "Offers study spaces, research help, and academic resources.",
            url: "https://library.charlotte.edu/",
            type: .academic
        ),
        Resource(
            title: "Academic Advising",
            summary: "Guides students with course planning and graduation progress.",
            url: "https://advising.charlotte.edu/",
            type: .academic
        ),
        Resource(
            title: "Disability Services",
            summary: "Provides academic accommodations and support for students.",
            url: "https://ds.charlotte.edu/",
            type: .academic
        ),
        Resource(
            title: "Student Health Center",
            summary: "Offers healthcare services and wellness support.",
            url: "https://studenthealth.charlotte.edu/",
            type: .health
        ),
        Resource(
            title: "Writing Center",
            summary: "Helps improve essays and writing assignments.",
            url: "https://writing.charlotte.edu/",
            type: .academic
        )
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Resources"
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resources.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        let resource = resources[indexPath.row]
        cell.textLabel?.text = resource.title
        cell.textLabel?.font = .systemFont(ofSize: 18, weight: .medium)
        cell.textLabel?.numberOfLines = 0
        cell.accessoryType = .disclosureIndicator

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let resource = resources[indexPath.row]

        let detailVC = ResourceDetailViewController()
        detailVC.resource = resource
        navigationController?.pushViewController(detailVC, animated: true)

        tableView.deselectRow(at: indexPath, animated: true)
    }
}

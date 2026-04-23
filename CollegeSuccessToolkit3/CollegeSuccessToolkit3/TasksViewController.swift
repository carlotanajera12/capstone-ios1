//
//  TasksViewController.swift
//  CollegeSuccessToolkit3
//
import UIKit

struct Task: Codable {
    var title: String
    var isCompleted: Bool
}

class TasksViewController: UITableViewController {

    var tasks: [Task] = [
        Task(title: "Homework", isCompleted: false),
        Task(title: "Study for quiz", isCompleted: false)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        print("TasksViewController loaded")

        title = "Tasks"
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addTaskTapped)
        )

        loadTasks()
    }

    func saveTasks() {
        if let encoded = try? JSONEncoder().encode(tasks) {
            UserDefaults.standard.set(encoded, forKey: "savedTasks")
        }
    }

    func loadTasks() {
        if let savedData = UserDefaults.standard.data(forKey: "savedTasks"),
           let decodedTasks = try? JSONDecoder().decode([Task].self, from: savedData) {
            tasks = decodedTasks
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tasks.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        let task = tasks[indexPath.row]
        cell.textLabel?.text = task.title
        cell.accessoryType = task.isCompleted ? .checkmark : .none

        return cell
    }

    override func tableView(_ tableView: UITableView,
                            commit editingStyle: UITableViewCell.EditingStyle,
                            forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tasks.remove(at: indexPath.row)
            saveTasks()
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedTask = tasks[indexPath.row]

        let alert = UIAlertController(
            title: "Edit Task",
            message: "Update the task title or toggle completion.",
            preferredStyle: .alert
        )

        alert.addTextField { textField in
            textField.text = selectedTask.title
        }

        let toggleTitle = selectedTask.isCompleted ? "Mark Incomplete" : "Mark Complete"

        alert.addAction(UIAlertAction(title: toggleTitle, style: .default, handler: { _ in
            self.tasks[indexPath.row].isCompleted.toggle()
            self.saveTasks()
            self.tableView.reloadRows(at: [indexPath], with: .automatic)
        }))

        alert.addAction(UIAlertAction(title: "Save Changes", style: .default, handler: { _ in
            if let newText = alert.textFields?.first?.text, !newText.isEmpty {
                self.tasks[indexPath.row].title = newText
                self.saveTasks()
                self.tableView.reloadRows(at: [indexPath], with: .automatic)
            }
        }))

        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))

        present(alert, animated: true)
    }

    @objc func addTaskTapped() {
        let alert = UIAlertController(title: "New Task", message: nil, preferredStyle: .alert)

        alert.addTextField()

        alert.addAction(UIAlertAction(title: "Save", style: .default, handler: { _ in
            if let text = alert.textFields?.first?.text, !text.isEmpty {
                let newTask = Task(title: text, isCompleted: false)
                self.tasks.append(newTask)
                self.saveTasks()
                self.tableView.reloadData()
            }
        }))

        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))

        present(alert, animated: true)
    }
}

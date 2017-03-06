import UIKit

class TableViewController: UITableViewController {

    var items = [String]()
    var number = 0

    /// Refresh ControlとAction接続したメソッド
    /// テーブルビューを下に引っ張ると呼ばれる
    ///
    /// - Parameter sender: refresh control
    @IBAction func obtainNewData(_ sender: UIRefreshControl) {
        // 処理が終わったら、更新中のクルクルを止める
        defer {
            sender.endRefreshing()
        }

        // データを更新する処理を記述
        number = number.advanced(by: 1)
        let newItem = "新しいデータ \(number)"
        items.insert(newItem, at: 0)
        tableView.reloadData()

        print("引っ張って更新！")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = items[indexPath.row]

        return cell
    }
}

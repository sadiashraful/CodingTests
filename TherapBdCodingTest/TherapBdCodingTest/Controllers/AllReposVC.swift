//
//  GithubRepoListVC.swift
//  TherapBdCodingTest
//
//  Created by Mohammad Ashraful Islam Sadi on 28/2/21.
//

import UIKit


protocol SelectionDelegate {
    func didTapTableCell(image: UIImage, repoTitle: String, repoDescription: String)
}

enum APIError: Error {
    case noDataAvailable
    case canNotProcessData
}

class AllReposVC: UITableViewController {
    
    var selectionDelegate: SelectionDelegate!
    let url = "https://api.github.com/search/repositories?q=language:Swift&sort=stars&order=desc"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        getData(from: url)
//        getRepoList { [weak self] result in
//            switch result {
//            case .failure(let error):
//                print(error)
//            case .success(let items): break
//
//            }
//        }

    }
    
//    func getRepoList(completion: @escaping(Result<[ItemDetail], APIError>) -> Void) {
//        let dataTask = URLSession.shared.dataTask(with: URL(string: url)!) { data, response, error in
//            guard let jsonData = data else {
//                completion(.failure(.noDataAvailable))
//                return
//            }
//            do {
//                let decoder = JSONDecoder()
//                let itemResponse = try decoder.decode(APIResponse.self, from: jsonData)
//                let itemDetails = itemResponse.response.items
//                completion(.success(itemDetails))
//            } catch {
//                completion(.failure(.canNotProcessData))
//            }
//        }
//    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return generateDummyData().count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepoCell") as! RepoCell
        let repo = generateDummyData()[indexPath.row]
        cell.repoTitleLabel.text = repo.title
        cell.repoDescriptionLabel.text = repo.description
        
        return cell
    }
    
    // MARK: - Table View Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "RepositoryDetails") as! RepositoryDetailsVC
        self.present(newViewController, animated: true, completion: nil)
    }
}

extension AllReposVC {
    
    private func getData(from url: String) {
        let task = URLSession.shared.dataTask(with: URL(string: url)!) { (data, response, error) in
            guard let data = data, error == nil else { return }
            var result: Response?
            do {
                result = try JSONDecoder().decode(Response.self, from: data)
            } catch let DecodingError.dataCorrupted(context) {
                print(context)
            } catch let DecodingError.keyNotFound(key, context) {
                print("Key '\(key)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch let DecodingError.valueNotFound(value, context) {
                print("Value '\(value)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch let DecodingError.typeMismatch(type, context)  {
                print("Type '\(type)' mismatch:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch {
                print("error: ", error)
            }

            guard let json = result else { return }
            print("JSON: \(json)")
        }
        
        task.resume()

    }
    
  

    func generateDummyData() -> [Repo] {
        let repos = [
            Repo(title: "Charts", description: "Beautiful charts for iOS/tvOS/OSX!The Apple side of the crossplatform MPAndroidChart"),
            Repo(title: "Alamofire", description: "Elegant HTTP Networking in Swift"),
            Repo(title: "ShadowsocksX-NG", description: "Next Generation of ShadowsocksX"),
            Repo(title: "open-source-ios-apps", description: ":iphone: Collaborative List of Open-Source iOS Apps"),
            Repo(title: "iina", description: "The modern video player for macOS."),
            Repo(title: "open-source-mac-os-apps", description: "🚀 Awesome list of open source applications for macOS.me/opensourcemacosapps"),
            Repo(title: "raywenderlich/swift-algorithm-club", description: "Algorithms and data structures in swift, with explanations!"),
            Repo(title: "lottie-ios", description: "An iOS library to native…fects vector animations"),
            Repo(title: "awesome-swift", description: "A collaborative list of …eel free to contribute!"),
            Repo(title: "SwiftyJSON", description: "The better way to deal with JSON data in Swift."),
        ]
        
        return repos
    }
}


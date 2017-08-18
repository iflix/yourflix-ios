import UIKit

class MoviesController: UICollectionViewController {
    let dataSource = MoviesDataSource()
    let dataLoader = MoviesDataLoader(resource: "movies")

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        guard let movies =  dataLoader.load() else {
            return
        }
        dataSource.movies = movies
        collectionView?.dataSource = dataSource
    }
}

extension MoviesController {
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let moviesCell = cell as? MoviesCell else { return }

        let asset = dataSource.movies[indexPath.row]

        guard
            let endpoint = asset["imageUrl"],
            let url = URL(string: "https:\(endpoint)")
        else { return }
        
        let request = URLRequest(url: url)

        moviesCell.imageDownloadTask = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else { return }

            DispatchQueue.main.async {
                moviesCell.imageView.image = UIImage(data: data)
            }
        }
        
        moviesCell.imageDownloadTask?.resume()
    }
}

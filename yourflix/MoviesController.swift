import UIKit

class MoviesController: UICollectionViewController {
    var movies: [[String:Any]] = []
    let dataLoader = MoviesDataLoader(resource: "movies")

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        guard let movies =  dataLoader.load() else {
            return
        }
        self.movies = movies
        collectionView?.dataSource = self
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let moviesCell = collectionView.dequeueReusableCell(withReuseIdentifier: "movie", for: indexPath) as? MoviesCell else { fatalError() }
        
        return moviesCell
    }
    
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let moviesCell = cell as? MoviesCell else { return }
        
        let asset = movies[indexPath.row]
        
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

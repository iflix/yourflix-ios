import UIKit

class TVViewController: UICollectionViewController {
    var shows: [[String:Any]] = []
    let dataLoader = TVDataLoader(resource: "tv")

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        guard  let shows = dataLoader.load() else {
            return
        }
        self.shows = shows
        collectionView?.dataSource = self
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shows.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let tvCell = collectionView.dequeueReusableCell(withReuseIdentifier: "tv", for: indexPath) as? TVCell else { fatalError() }
        
        return tvCell
    }

    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let tvCell = cell as? TVCell else { return }
        
        let asset = shows[indexPath.row]

        guard
            let endpoint = asset["imageUrl"],
            let url = URL(string: "https:\(endpoint)")
            else { return }
        
        let request = URLRequest(url: url)
        
        tvCell.imageDownloadTask = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                return
            }
            
            DispatchQueue.main.async {
                tvCell.imageView.image = UIImage(data: data)
            }
        }
        
        tvCell.imageDownloadTask?.resume()
    }
}

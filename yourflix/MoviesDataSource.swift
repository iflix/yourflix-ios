import UIKit

final class MoviesDataSource: NSObject, UICollectionViewDataSource {
    var movies: [[String:Any]] = []

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let moviesCell = collectionView.dequeueReusableCell(withReuseIdentifier: "movie", for: indexPath) as? MoviesCell else { fatalError() }

        return moviesCell
    }
    
}

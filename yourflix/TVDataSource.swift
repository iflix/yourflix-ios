import UIKit

final class TVDataSource: NSObject, UICollectionViewDataSource {
    var shows: [TV] = []

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shows.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let tvCell = collectionView.dequeueReusableCell(withReuseIdentifier: "tv", for: indexPath) as? TVCell else { fatalError() }

        return tvCell
    }

}

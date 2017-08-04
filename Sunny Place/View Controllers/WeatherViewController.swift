//
//  ViewController.swift
//  Sunny Place
//
//  Created by Josh Roberts on 02/08/2017.
//  Copyright © 2017 Josh Roberts. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var weatherViewModel: WeatherViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        flowLayout.scrollDirection = .horizontal
        flowLayout.sectionInset = .zero
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.contentInset = .zero
        collectionView.backgroundColor = .clear
        collectionView.isPagingEnabled = true
        collectionView.register(UINib(nibName: "WeatherCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "WeatherCell")
        
        weatherViewModel = WeatherViewModel(locationService: AppDelegate().locationService)
        weatherViewModel?.locationsObserver = { [weak self] weatherLocationViewModels in
            self?.collectionView.reloadData()
            self?.pageControl.numberOfPages = weatherLocationViewModels.count
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        weatherViewModel?.requestOneTimeLocation()
    }
}

extension WeatherViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weatherViewModel?.weatherLocations.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WeatherCell", for: indexPath) as? WeatherCollectionViewCell,
            let weatherLocationViewModel = weatherViewModel?.weatherLocations[indexPath.item]
        else {
            return UICollectionViewCell()
        }

        if let backgroundImageName = weatherLocationViewModel.imageName, let image = UIImage(named: backgroundImageName) {
            backgroundImageView.image = image
        }
        
        cell.viewModel = weatherLocationViewModel
        
        return cell
    }
}

extension WeatherViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageWidth = collectionView.frame.width
        pageControl.currentPage = Int(collectionView.contentOffset.x / pageWidth)
    }
}

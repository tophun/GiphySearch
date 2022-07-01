//
//  DetailViewController.swift
//  GiphySearch
//
//  Created by Collie on 2022/06/30.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol DetailDisplayLogic: AnyObject {
    func displayFetch(viewModel: Detail.Fetch.ViewModel)
    func displayUpdate(viewModel: Detail.Update.ViewModel)
}

class DetailViewController: UIViewController, DetailDisplayLogic {
    var interactor: DetailBusinessLogic?
    var router: (NSObjectProtocol & DetailRoutingLogic & DetailDataPassing)?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var favoriteButton: UIBarButtonItem!
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = DetailInteractor()
        let presenter = DetailPresenter()
        let router = DetailRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.fetch()
    }
    
    private func download(url: URL, completion: @escaping (UIImage?) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else { completion(nil); return }
            let image = UIImage(data: data)
            completion(image)
        }
        task.resume()
    }
    
    private func setFavoriteButtonImage(_ isFavorite: Bool) {
        self.favoriteButton.image = isFavorite ? UIImage(systemName: "suit.heart.fill") : UIImage(systemName: "suit.heart")
    }
    
    // MARK: - IBAction
    
    @IBAction func touchFavorite(_ button: UIBarButtonItem) {
        interactor?.update()
    }
}

// MARK: - DetailDisplayLogic

extension DetailViewController {
    func displayFetch(viewModel: Detail.Fetch.ViewModel) {
        self.setFavoriteButtonImage(viewModel.isFavorite)
        guard let url = URL(string: viewModel.gif.images.originalStill.url) else { return }
        if let cacheImage = Cache.imageCache.object(forKey: url.absoluteString as NSString) {
            DispatchQueue.main.async { [weak self] in
                self?.imageView.image = cacheImage
            }
            
        } else {
            download(url: url, completion: { image in
                DispatchQueue.main.async { [weak self] in
                    if let image = image {
                        Cache.imageCache.setObject(image, forKey: url.absoluteString as NSString)
                    }
                    self?.imageView.image = image
                }
            })
        }
    }
    
    func displayUpdate(viewModel: Detail.Update.ViewModel) {
        self.setFavoriteButtonImage(viewModel.isFavorite)
    }
}

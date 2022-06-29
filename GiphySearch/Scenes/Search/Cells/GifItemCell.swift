//
//  GifItemCell.swift
//  GiphySearch
//
//  Created by Collie on 2022/06/29.
//

import UIKit

class GifItemCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    
    private var sessionTask : URLSessionDataTask?
    private var gif: Gif?
    
    public func bind(_ gif: Gif) {
        self.gif = gif
        loadImage()
    }
    
    private func download(url: URL, completion: @escaping (UIImage?) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else { completion(nil); return }
            let image = UIImage(data: data)
            completion(image)
        }
        task.resume()
        self.sessionTask = task
    }
    
    func loadImage() {
        guard let gif = gif,
              let url = URL(string: gif.images.previewStill.url) else { return }
        
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
    
    func cancel() {
        sessionTask?.cancel()
    }
}

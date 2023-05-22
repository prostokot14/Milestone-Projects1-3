//
//  DetailViewController.swift
//  MilestoneProjects1-3
//
//  Created by Антон Кашников on 22.05.2023.
//

import UIKit

final class DetailViewController: UIViewController {
    @IBOutlet var flagImageView: UIImageView!
    
    var flagImage: UIImage?
    var countryName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .never
        title = countryName
        flagImageView.image = flagImage
        flagImageView.layer.borderWidth = 0.3
        flagImageView.layer.cornerRadius = 5
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(didTapShareButton))
    }
    
    @objc private func didTapShareButton() {
        guard let flagImage = flagImageView.image else {
            return
        }

        let activityVC = UIActivityViewController(activityItems: [title ?? "Unknown country", image], applicationActivities: nil)

        if #available(iOS 16.0, *) {
            activityVC.popoverPresentationController?.sourceItem = navigationItem.rightBarButtonItem
        } else {
            activityVC.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        }
        
        present(activityVC, animated: true)
    }
}

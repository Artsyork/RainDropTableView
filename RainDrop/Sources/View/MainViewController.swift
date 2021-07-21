//
//  ViewController.swift
//  RainDrop
//
//  Created by 성다연 on 2021/07/20.
//

import UIKit

final class MainViewController: UIViewController {
    @IBOutlet weak var folderImageView: UIImageView!
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.showsVerticalScrollIndicator = false
            tableView.separatorStyle = .none
            tableView.delegate = self
            tableView.dataSource = self
            tableView.isUserInteractionEnabled = false
        }
    }
    @IBOutlet weak var bigRainDropImage: UIImageView! {
        didSet {
            bigRainDropImage.clipsToBounds = true
            bigRainDropImage.layer.cornerRadius = 4
        }
    }
    @IBOutlet weak var bigRainHorizontalView: UIView!
    
    private var rainDropItems : [UIImageView] = []
    
    private let items : [String] = [
        "items",
        "Everyday spending",
        "Emergency fund",
        "Long-term investing"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        setSubviews()
        setRainDropAttach()
        setBigRainEffects()
    }
    
    private func setSubviews() {
        bigRainDropImage.translatesAutoresizingMaskIntoConstraints = false
        bigRainDropImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60).isActive = true
        bigRainDropImage.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 44).isActive = true
        bigRainDropImage.widthAnchor.constraint(equalToConstant: 9).isActive = true
        bigRainDropImage.heightAnchor.constraint(equalToConstant: 9).isActive = true
        
        bigRainHorizontalView.translatesAutoresizingMaskIntoConstraints = false
        bigRainHorizontalView.heightAnchor.constraint(equalToConstant: 175 + 105).isActive = true
        bigRainHorizontalView.widthAnchor.constraint(equalToConstant: 1).isActive = true
        bigRainHorizontalView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 48).isActive = true
        bigRainHorizontalView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
    }
    
    private func setRainDropAttach() {
        for i in 1...items.count {
            let iv = UIImageView.createRainDrop(indexPathRow: i)
            view.addSubview(iv)
            rainDropItems.append(iv)
            setLayoutAtImageView(imageView: iv, index: i)
        }
        
        view.bringSubviewToFront(folderImageView)
    }
    
    private func setLayoutAtImageView(imageView : UIImageView, index : Int) {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: bigRainDropImage.bottomAnchor, constant: CGFloat(50 * index + 6)),
            imageView.heightAnchor.constraint(equalToConstant: 9),
            imageView.widthAnchor.constraint(equalToConstant: 9),
            imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 44)
        ])
    }
    
    private func setBigRainEffects() {
        UIView.animate(withDuration: 1, animations: { [weak self] in
            self?.bigRainDropImage.isHidden = false
            self?.bigRainDropImage.frame.origin.y += 60
        }, completion: { _ in
            self.bigRainDropImage.isHidden = true
        })
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: { [weak self] in
            self?.folderImageView.tintColor = .custom_purple
        })
    
        rainDropItems.forEach { setHorizontalRainEffects(indexPath: $0.tag ) }
    }
    
    private func setHorizontalRainEffects(indexPath at : Int) {
        UIView.animate(withDuration: 1.8, delay: 0.1 * Double(at), animations: { [weak self] in
            self?.rainDropItems[at - 1].frame.origin.y += CGFloat(50 * at) + 10
        }, completion: { _ in
            self.setVerticalRainEffects(indexPath: at - 1)
        })
    }
    
    private func setVerticalRainEffects(indexPath at : Int) {
        UIView.animate(withDuration: 1.0, animations: { [weak self] in
            self?.rainDropItems[at].isHidden = false
            self?.rainDropItems[at].frame.origin.x += 30
        }, completion : { _ in
            self.rainDropItems[at].isHidden = true
        })
    }
}


extension MainViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RainDropTableViewCell.cellID, for: indexPath) as! RainDropTableViewCell
        cell.titleLabel.text = items[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

//
//  NewsTableViewCell.swift
//  MyVK
//
//  Created by itisioslab on 19.10.17.
//  Copyright © 2017 itisioslab. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var imageInNewsImageView: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    let radiusRoundCorner: CGFloat = 50
    @IBOutlet weak var textInNewsLabel: UILabel!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var repostButton: UIButton!
    @IBOutlet weak var newsImageView: UIImageView!
    
    @IBOutlet weak var constraintLikeToBottom: NSLayoutConstraint!
    @IBOutlet weak var constraintTextToLike: NSLayoutConstraint!
    @IBOutlet weak var constraintTextToImage: NSLayoutConstraint!
    @IBOutlet weak var constraintAvatarToText: NSLayoutConstraint!
    @IBOutlet weak var constraintAvatarToImage: NSLayoutConstraint!
    
    var id: Int = 0
    let imageIslike = UIImage(named: "isLikedImage")
    let imageNotLike = UIImage(named: "notLike")
    
    override func awakeFromNib() {
        super.awakeFromNib()
        nameLabel.text = ""
        surnameLabel.text = ""
        dataLabel.text = ""
        imageInNewsImageView.image = nil
        textInNewsLabel.text = ""
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        newsImageView.image = nil
    }
     
    func prepare(with newsModel: News, and user: User) {
        
        if newsModel.image != nil {
            textInNewsLabel.isHidden = false
            constraintAvatarToImage.priority = .defaultLow
            constraintAvatarToText.priority = .defaultHigh
            
            newsImageView?.isHidden = false
            constraintTextToLike.priority = .defaultLow
            constraintTextToImage.priority = .defaultHigh
        }
        
        if newsModel.image == nil {
            newsImageView?.isHidden = true
            textInNewsLabel.isHidden = false
            constraintTextToImage.priority = .defaultLow
            constraintTextToLike.priority = .defaultHigh
            constraintAvatarToImage.priority = .defaultLow
            constraintAvatarToText.priority = .defaultHigh
        }
        
        id = newsModel.id
        
        textInNewsLabel.text = newsModel.text
        
        if let imageURL = newsModel.image {
            newsImageView.downloadedFrom(link: imageURL)
        }
        
        nameLabel.text = user.name
        surnameLabel.text = user.surname
      
        dataLabel.text = toStringDate(from: newsModel.date)
        
        checkLike()
        likeButton.setTitle("\(newsModel.numberOfLikes)", for: .normal)
        commentButton.setTitle("\(newsModel.numberOfComments)", for: .normal)
        repostButton.setTitle("\(newsModel.numberOfReposts)", for: .normal)
        
        avatarImageView.image = user.avatar
        avatarImageView.roundCorners([.bottomLeft, .bottomRight, .topLeft, .topRight], radius: radiusRoundCorner)
        
        layoutIfNeeded()
        setNeedsLayout()
    }
    
    @IBAction func likeButtonPressed(_ sender: UIButton) {
        
        RequestManager.instance.isLiked(itemId: self.id) { (isLiked) in
            
            let checkLiked = isLiked.response.liked
            
            if checkLiked == 0 {
                
                RequestManager.instance.addLike(itemId: self.id, complitionBlock: { (likes) in
                    
                    let likes = likes.response.likes
                    
                    DispatchQueue.main.async {
                        self.likeButton.setTitle("\(likes)", for: .normal)
                        self.likeButton.setImage(self.imageIslike, for: .normal)
                    }
                    
                })
            
            } else {
                
                RequestManager.instance.deleteLike(itemId: self.id, complitionBlock: { (likes) in
                    
                    let likes = likes.response.likes
                    
                    DispatchQueue.main.async {
                        self.likeButton.setTitle("\(likes)", for: .normal)
                        self.likeButton.setImage(self.imageNotLike, for: .normal)
                    }
                })
                
            }
        }
        
    }
    
    func checkLike() {
        
        RequestManager.instance.isLiked(itemId: self.id) { (isLiked) in
            let checkLiked = isLiked.response.liked
    
            if checkLiked == 0 {
                DispatchQueue.main.async {
                        self.likeButton.setImage(self.imageNotLike, for: .normal)
                    }
            } else {
                DispatchQueue.main.async {
                        self.likeButton.setImage(self.imageIslike, for: .normal)
                }
            }
        }
    }
    
    func toStringDate(from date: Int) -> String {
        
        let timeInterval = Double(date)
        let myDate = Date(timeIntervalSince1970: timeInterval)
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let myString = formatter.string(from: myDate)
        let yourDate = formatter.date(from: myString)
        formatter.dateFormat = "dd-MMM-yyyy"
        let stringDate = formatter.string(from: yourDate!)
        return stringDate
    }
}

//
//  AVSectionController.swift
//  
//
//  Created by Atsushik on 2018/08/16.
//

import UIKit
import IGListKit

class AVSectionController: ListSectionController, ListDisplayDelegate {
    

    override init() {
        super.init()
        displayDelegate = self
    }
    
    var postData: PostData?
    
    override func numberOfItems() -> Int {
        return 1
    }
    
    //セルのサイズの定義
    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.size.width / 1.0, height: UIScreen.main.bounds.size.width / 0.6)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        if let cell = collectionContext!.dequeueReusableCellFromStoryboard(withIdentifier: "Cell", for: self, at: index) as? PostTableViewCell {
            
            //セルのお気に入りボタンを押下した際の処理
            cell.likeButton.addTarget(self, action: #selector(handleLikeButton(_:forEvent:)), for: .touchUpInside)
            
            cell.setAVPostData(postData!)
            
            return cell
        }
        
        return UICollectionViewCell(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    }
    
    //    postDataを更新する
    override func didUpdate(to object: Any) {
        postData = object as? PostData
    }
    
    @objc func handleLikeButton(_ sender: UIButton, forEvent event: UIEvent) {
        
        if let likeButton = sender as? UIButton {
            
            if postData?.isLiked == false {
                let buttonImage = UIImage(named: "star_exist")
                likeButton.setImage(buttonImage, for: .normal)
                postData?.isLiked = true
            }else{
                let buttonImage = UIImage(named: "star_none")
                likeButton.setImage(buttonImage, for: .normal)
                postData?.isLiked = false
            }
        }
    }
    
    //セルの選択時の処理
    override func didSelectItem(at index: Int) {
    }
    
    //セルの表示される時の実装
    func listAdapter(_ listAdapter: ListAdapter, willDisplay sectionController: ListSectionController, cell: UICollectionViewCell, at index: Int) {
    }
    //セルの表示が終わる時の実装
    func listAdapter(_ listAdapter: ListAdapter, didEndDisplaying sectionController: ListSectionController, cell: UICollectionViewCell, at index: Int) {
    }
    
    func listAdapter(_ listAdapter: ListAdapter, willDisplay sectionController: ListSectionController) {
    }
    
    func listAdapter(_ listAdapter: ListAdapter, didEndDisplaying sectionController: ListSectionController) {
        
    }
}

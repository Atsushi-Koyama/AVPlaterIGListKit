//
//  PostData.swift
//  
//
//  Created by Atsushik on 2018/08/16.
//

import UIKit
import IGListKit

final class PostData: NSObject {
    var id: String?
    var name: String?
    var image: UIImage?
    var movieURL: String?
    var isLiked: Bool = false
    
    init(id: String, name: String, image: UIImage, movieURL: String) {
        self.id = id
        self.name = name
        self.image = image
        self.movieURL = movieURL
    }
}

extension NSObject: ListDiffable {
    public func diffIdentifier() -> NSObjectProtocol {
        return self
    }
    
    public func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        return isEqual(object)
    }
}



import UIKit
import IGListKit

class ViewController: UIViewController, ListAdapterDataSource {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    //postDatamのインスタンス化
    var postArray: [PostData] = []
    
    //postDatamのインスタンス化
    var postData: PostData!
    
    var adapter: ListAdapter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image1:UIImage = UIImage(named:"あ.jpg")!
        let image2:UIImage = UIImage(named:"い.jpg")!
        let image3:UIImage = UIImage(named:"う.jpg")!
        
        
        let postData1 = PostData(id: "1", name: "Sample1", image: image1, movieURL: "https://s3-ap-northeast-1.amazonaws.com/bimojiapp-deployments-mobilehub-1052823102/%E3%81%82.mp4")
    
        let postData2 = PostData(id: "2", name: "Sample2", image: image2, movieURL: "https://s3-ap-northeast-1.amazonaws.com/bimojiapp-deployments-mobilehub-1052823102/%E3%81%84.mp4")
        
        let postData3 = PostData(id: "3", name: "Sample3", image: image3, movieURL: "https://s3-ap-northeast-1.amazonaws.com/bimojiapp-deployments-mobilehub-1052823102/%E3%81%86.mp4")
        
        postArray.append(postData1)
        postArray.append(postData2)
        postArray.append(postData3)
        
        //workingRangeSizeはtableViewに表示準備の範囲。数字が大きいほど負担がかかると思われる。
        self.adapter = ListAdapter(updater: ListAdapterUpdater(), viewController: self, workingRangeSize: 1)
        self.adapter?.collectionView = self.collectionView
        self.adapter?.dataSource = self
        
        nibSet()
    }
    
    func nibSet(){
        collectionView.register(UINib(nibName: "PostTableViewCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
    }
    
    //配列の要素数分処理を繰返す。
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return postArray
    }
    
    //userに応じて表示を変化させる　imgesectionとmoviesectionに分ける
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return AVSectionController()
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}

//
//  ViewController.swift
//  Forma
//
//  Created by Yahia El-Dow on 6/4/18.
//  Copyright © 2018 P-Codes. All rights reserved.
//

import UIKit

class HomeVC : UIViewController{
    
    @IBOutlet weak var favourites_more_btn: UIButton!
    @IBOutlet weak var news_more_btn: UIButton!
    @IBOutlet weak var store_more_btn: UIButton!
    @IBOutlet weak var nearby_more_btn: UIButton!
    
    @IBOutlet weak var featured_more_btn: UIButton!
    
    @IBOutlet weak var NotificationBtn: UIButton!
    @IBOutlet weak var MenuBtn: UIButton!
    //Activities collectionView
    @IBOutlet weak var featuredCollection: UICollectionView!
    //HomeViewController ScrollView
    @IBOutlet weak var homeView_scrollView: UIScrollView!
    //Featured TableView
    @IBOutlet weak var featuredTableView: UITableView!
    @IBOutlet weak var tableView_nearBy_constraint_height: NSLayoutConstraint!
    
    @IBOutlet weak var tableView_fav_constraint_height: NSLayoutConstraint!
    
    //suplement collectionView
    @IBOutlet weak var suplementCollection: UICollectionView!
    //nearby list
    @IBOutlet weak var NearbyTable: UITableView!
    // adding NewsCollectionView
    
    @IBOutlet weak var EventCollectionView: UICollectionView!
    
    @IBOutlet weak var favoriteTableView: UITableView!
    
    
    var timer:Timer? = nil
    
    // Activites Section photos and labels arrays
      let activitiesList = ["martial_arts","yoga","physio_therapist","fitness_studios","diet","dancing_studios","academin_training","aerial_arts","crossfit","gymnastics"]
      let activitiesNames = [" Ufc Academy"," yoga"," Therapists"," FitnessStudios"," Diet"," Dancing Studios","AcademicTrainig"," AerialArts"," Crossfit"," Gymnastics"," Nutritions"]
    // featured photos and labels arrays
    let FeaturedList = ["act1","act2","act3","act4"]
    let FeaturedLabels = [" Gold'sGym"," TrueGym", " Pole'sGym"," CurvesGym"," PoleGym"]
    let store_list = ["seperator1","store1","store2" ,"store3","store4","store5","sup6","seperator2","store6","store7" ,"store8","store9","store10","store11","store12","store13"]
    let NewsList = [#imageLiteral(resourceName: "forma1") , #imageLiteral(resourceName: "forma2") , #imageLiteral(resourceName: "forma3"),#imageLiteral(resourceName: "forma4") ]
    let nearByCellCount = 4
    
    
    var newsModelArray = [Gym]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        
        self.temp_applicationInit_data()
        
        //start timer function to start timer for supplement collection cells movement
          startTimer()
        
        // nearby data ana delegate
        NearbyTable.delegate = self
        NearbyTable.dataSource = self
        //featured table data and delegate
        featuredTableView.delegate = self
        featuredTableView.dataSource = self
       // featured collectionView data and delegate
        featuredCollection.delegate = self
        featuredCollection.dataSource = self
        // supplement collection data and delegate
        suplementCollection.delegate = self
        suplementCollection.dataSource = self
        // event collection data and delegate
        EventCollectionView.dataSource = self
        EventCollectionView.delegate = self
        
       
     self.view.backgroundColor = .white
       
        
        
        
        // adding our .xib file to nearbytableView
        let nibName_nearByCustomeCell = UINib(nibName: "NearByTableViewCell", bundle: nil)
        NearbyTable.register(nibName_nearByCustomeCell, forCellReuseIdentifier: "near")
        
        // adding .xib file to SupplementCollectionView
        let nibcell=UINib(nibName: "suplementStore", bundle: nil)
        suplementCollection.register(nibcell, forCellWithReuseIdentifier: "suplementStore")
        
        //adding our .xib file to ActivitescollectionView
        let nibName_ActivitiesCustomeCell = UINib(nibName: "suplementStore" , bundle: nil)
        self.featuredCollection.register(nibName_ActivitiesCustomeCell , forCellWithReuseIdentifier:"suplementStore" )
        // adding .xib file to FeaturedTableView
        let nibName_FeaturedCustomCell = UINib (nibName: "FeaturedTableViewCell", bundle: nil)
        self.featuredTableView.register(nibName_FeaturedCustomCell, forCellReuseIdentifier: "featured")

        // adding .xib file to events and news
        let nibName_EventCustomCell = UINib (nibName: "NewsCollectionViewCell", bundle: nil)
        self.EventCollectionView.register(nibName_EventCustomCell, forCellWithReuseIdentifier: "news")
        
        
        //adding .xib file to favorites
        let nibName_Favorite = UINib (nibName: "NearByTableViewCell", bundle: nil)
        self.favoriteTableView.register(nibName_Favorite, forCellReuseIdentifier: "near")
        
        
        //flowLayout for Collection
        let first_layout = UICollectionViewFlowLayout()
       first_layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        first_layout.itemSize = CGSize(width: 100, height: 150)
       first_layout.scrollDirection = .horizontal
       suplementCollection.collectionViewLayout = first_layout
        suplementCollection.reloadData()
       
        let sec_layout = UICollectionViewFlowLayout()
        sec_layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        sec_layout.itemSize = CGSize(width: 100, height: 150)
        sec_layout.scrollDirection = .horizontal
        featuredCollection.collectionViewLayout = sec_layout
        featuredCollection.reloadData()
        
        let third_layout = UICollectionViewFlowLayout()
        third_layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        third_layout.itemSize = CGSize(width: 250, height: 200)
        third_layout.scrollDirection = .horizontal
        EventCollectionView.collectionViewLayout = third_layout
        EventCollectionView.reloadData()
        
        
        
        
        homeView_scrollView.bounces = false
        tableView_nearBy_constraint_height.constant = CGFloat(100 * nearByCellCount) + 100
        tableView_fav_constraint_height.constant = CGFloat(60 * nearByCellCount) + 100
    
        
        homeView_scrollView.contentSize.height += CGFloat(100 * nearByCellCount) + 100
        homeView_scrollView.contentSize.height += CGFloat(60 * nearByCellCount) + 100
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "seg_webVC"  {
            let vc = segue.destination as? WebViewController
            if ((sender as? String) != nil) {
                vc?.url_webService = (sender as? String)!
            }
            
        }else if segue.identifier == "seg_event_webVC"{
            let vc = segue.destination as? WebViewController
                vc?.url_webService = "http://events.forma-eg.com"
            
        }
        
    }
    
    // a timer for supplement collectin view cells movement
    func startTimer() {
        
        _ =  Timer.scheduledTimer(timeInterval: 4.0, target: self, selector: #selector(self.scrollAutomatically), userInfo: nil, repeats: true)
        
        
    }
    
    
    // function for scroll atomatically for supplement collection
    @objc func scrollAutomatically(_ timer1: Timer) {
        
        if let coll = self.suplementCollection{
            for cell in coll.visibleCells {
                let indexPath: IndexPath? = coll.indexPath(for: cell)
                if((indexPath?.row)!  <  store_list.count - 1){
                    let indexPath1 = IndexPath.init(row: (indexPath?.row)! + 1, section: (indexPath?.section)!)
                    UIView.animate(withDuration: 1) {
                        coll.scrollToItem(at: indexPath1, at: .left, animated: true)

                    }
                }
            else if((indexPath?.row)!  ==  store_list.count - 1){
                    let indexPath1: IndexPath?
                    indexPath1 = IndexPath.init(row: 0, section:0)
                    UIView.animate(withDuration: 1) {
                        coll.scrollToItem(at: indexPath1!, at: .right, animated: true)
                    }
                    
                    
                }
                
            }
        }
        if let collection = self.featuredCollection{
            for cell in collection.visibleCells {
                let indexPath: IndexPath? = collection.indexPath(for: cell)
                if((indexPath?.row)!  <  activitiesList.count - 1){
                    let indexPath2 = IndexPath.init(row: (indexPath?.row)! + 1, section: (indexPath?.section)!)
                    UIView.animate(withDuration: 1) {
                        collection.scrollToItem(at: indexPath2, at: .left, animated: true)
                        
                    }
                }
                
                else if((indexPath?.row)!  ==  activitiesList.count - 1){
                    let indexPath2: IndexPath?
                    indexPath2 = IndexPath.init(row: 0, section:0)
                    UIView.animate(withDuration: 1) {
                        collection.scrollToItem(at: indexPath2!, at: .right, animated: true)
                    }
                    
                    
                }
            }
        
    }
    }
   
    
    
    func temp_applicationInit_data(){
//        news init
        var gym =  Gym()
        gym.id = 0
        gym.name = "Hoba"
        gym.imgUrl = #imageLiteral(resourceName: "act3")
        
        self.newsModelArray.append(gym)
        gym.id = 0
        gym.name = "ya 2ota"
        gym.imgUrl = #imageLiteral(resourceName: "act2")
        self.newsModelArray.append(gym)
        self.newsModelArray.append(gym)
        self.newsModelArray.append(gym)
        self.newsModelArray.append(gym)
        self.newsModelArray.append(gym)
        self.newsModelArray.append(gym)
        self.newsModelArray.append(gym)
        self.newsModelArray.append(gym)
        self.newsModelArray.append(gym)
        self.newsModelArray.append(gym)
        self.newsModelArray.append(gym)
        self.newsModelArray.append(gym)
        self.newsModelArray.append(gym)
        self.newsModelArray.append(gym)
//         init suplment
        
        
        
    }
}



//MARK:-  UICOLECTION VIEW DELECATION AND DATA SOURCE
extension HomeVC : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == suplementCollection{
            return store_list.count
        }
        if collectionView == featuredCollection{
            return activitiesList.count
        }
        if collectionView == EventCollectionView{
            return newsModelArray.count
        }
       return 10
       
       
    }
    //addin segue to go to Gyme list
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == featuredCollection{
              self.performSegue(withIdentifier: "segueToGymList", sender: self)
        }
        if collectionView == EventCollectionView {
            self.performSegue(withIdentifier: "seg_webVC", sender: "http://eventDetail.forma-eg.com")
        }
      
    }
   //addin space between suplement collection view cells
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 30.0
    }
    
   
   
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
       // let cell = UICollectionViewCell()
        
        
        if collectionView == suplementCollection {
           let cell_suplementCollection = self.suplementCollection.dequeueReusableCell(withReuseIdentifier: "suplementStore", for: indexPath) as! suplementStore
            //cell_suplementCollection.suplement_imageview.image = #imageLiteral(resourceName: "ic_home")
            cell_suplementCollection.suplement_label.layer.cornerRadius = 10.0
            cell_suplementCollection.suplement_imageview.image = UIImage(named:store_list[indexPath.row])
            cell_suplementCollection.suplement_imageview.layer.cornerRadius = 8.0
            cell_suplementCollection.suplement_imageview.clipsToBounds = true
        
        return cell_suplementCollection
        }
        // Featured collectionViewCell
        if collectionView == self.featuredCollection{
            let cell_featuredCollection = collectionView.dequeueReusableCell(withReuseIdentifier: "suplementStore", for: indexPath) as! suplementStore
           // setting design for ActivitiesCollectionViewCell
            cell_featuredCollection.suplement_imageview.image = UIImage(named:activitiesList[indexPath.row])
            cell_featuredCollection.suplement_label.text = activitiesNames[indexPath.row]
            
            cell_featuredCollection.suplement_imageview.layer.cornerRadius = 8.0
            cell_featuredCollection.suplement_imageview.clipsToBounds = true
            cell_featuredCollection.suplement_label.layer.cornerRadius = 10.0
            //cell_featuredCollection.suplement_label.leftIn
             return cell_featuredCollection
        }
        if collectionView == self.EventCollectionView{
            let cell_eventCollection = collectionView.dequeueReusableCell(withReuseIdentifier: "news", for: indexPath) as! NewsCollectionViewCell
            
            let seprateEvent = self.newsModelArray[indexPath.row]
            
            cell_eventCollection.newsImage.image = seprateEvent.imgUrl
            return cell_eventCollection
            
            
        }
       
         return UICollectionViewCell()
    }
    
    //convert collrction view cells to slider
    
    
}





//MARK:-  UITABL VIEW DELECATION AND DATA SOURCE

extension HomeVC : UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == NearbyTable{
            self.performSegue(withIdentifier: "showprofile", sender: self)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
//        if tableView == NearbyTable{  return nearByCellCount}
       if tableView == featuredTableView {return NewsList.count}
//        if tableView == favoriteTableView{ return 4}
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return 1
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        // About NearByTableView
        let row_number = indexPath.section
        if tableView == self.NearbyTable {
            let cell = NearbyTable.dequeueReusableCell(withIdentifier: "near", for: indexPath) as! NearByTableViewCell
            cell.distance_view.setRoundedView()
//            cell.gym_logo.setRoundedView(radiusNumber: 0.3 )
            cell.selectionStyle = .none
            cell.gym_logo.layer.cornerRadius = cell.gym_logo.frame.size.width/2
            cell.gym_logo.clipsToBounds = true
            return cell
        }
        if tableView == self.featuredTableView {
            let featured_cell = featuredTableView.dequeueReusableCell(withIdentifier: "featured", for: indexPath) as! FeaturedTableViewCell
            featured_cell .featuredImage.image = NewsList[row_number]
            featured_cell.featuredLabel.text =  FeaturedLabels[row_number]
            featured_cell.selectionStyle = .none
            return featured_cell
        }
        
        if tableView == self.favoriteTableView {
            let cell = favoriteTableView.dequeueReusableCell(withIdentifier: "near", for: indexPath) as! NearByTableViewCell
            cell.distance_view.isHidden = true
            cell.gym_logo.layer.cornerRadius = cell.gym_logo.frame.size.width/2
            cell.gym_logo.clipsToBounds = true
              cell.selectionStyle = .none

            return cell
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    
        if tableView == self.featuredTableView {
        let view = UIView(frame: CGRect(x: 0 , y: 0 , width: tableView.frame.size.width , height: 5))
            view.backgroundColor = .white
        return view
        }
        
        let view = UIView(frame: CGRect(x: 0 , y: 0 , width: 0 , height: 0))
        return view
       
    }
    
 
}

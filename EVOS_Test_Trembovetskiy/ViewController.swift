//
//  ViewController.swift
//  EVOS_Test_Trembovetskiy
//
//  Created by Kiril Trembovetskiy on 9/4/17.
//  Copyright © 2017 Kiril Trembovetskiy. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var cvCars: UICollectionView!

    
    
    var screenSize: CGRect!
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.cvCars.delegate = self
        self.cvCars.dataSource = self
        
        screenSize = UIScreen.main.bounds
        screenWidth = screenSize.width
        screenHeight = screenSize.height
        
        self.view.backgroundColor = UIColor(netHex: 0x454754)
        self.cvCars.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images_name.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.bounds.size.width/7 + 40, height: collectionView.bounds.size.width/7 + 50 )
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.cvCars.dequeueReusableCell(withReuseIdentifier: "carCollectionCell", for: indexPath) as! CarCollectionCell
        cell.labTypeName.text = typeNameTransport[indexPath.row]
        
        cell.imTypeCar.image = UIImage(named: images_name[indexPath.row])
        cell.labTypeName.textColor = UIColor(netHex: 0x696371)
        cell.viewActivity.backgroundColor = UIColor(netHex: 0x75BAE1)
        
        if cell.isSelected{
            cell.imTypeCar.image = UIImage(named: select_images_name[indexPath.row])
            cell.labTypeName.textColor = UIColor(netHex: 0x75BAE1)
            cell.viewActivity.backgroundColor = UIColor(netHex: 0xF9D003)
        }
        
        
        
        return cell
    }
    
    // MARK: Methods for select/deselect cell
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let cell = self.cvCars.cellForItem(at: indexPath) as? CarCollectionCell{
            cell.imTypeCar.image = UIImage(named: select_images_name[indexPath.row])
            cell.labTypeName.textColor = UIColor(netHex: 0x75BAE1)
            cell.viewActivity.backgroundColor = UIColor(netHex: 0xF9D003)
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell  = self.cvCars.cellForItem(at: indexPath) as? CarCollectionCell{
            cell.imTypeCar.image = UIImage(named: images_name[indexPath.row])
            cell.labTypeName.textColor = UIColor(netHex: 0x696371)
            cell.viewActivity.backgroundColor = UIColor(netHex: 0x75BAE1)
            
        }
    }
}



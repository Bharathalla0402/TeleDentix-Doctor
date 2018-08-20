//
//  PrescriptionNameViewController.swift
//  TeleDentix Doctor
//
//  Created by MACBOOK PRP on 29/07/18.
//  Copyright © 2018 bharath. All rights reserved.
//

import UIKit

class PresciptionNameCell: UITableViewCell
{
    @IBOutlet weak var PrecriptionQtyLab: UIView!
    @IBOutlet weak var PrescriptionNameLab: UILabel!
    @IBOutlet weak var PrescriptionSubQty: UIView!
    
}

class FileslistCell2: UICollectionViewCell
{
    @IBOutlet weak var FileImage: UIImageView!
}

class PrescriptionNameViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var PrescriptionTablHeight: NSLayoutConstraint!
    @IBOutlet weak var PresciptionTabl: UITableView!
    @IBOutlet weak var FilesCollectionView: UICollectionView!
    
    @IBOutlet weak var NoteLab: UILabel!
    var Cell2:PresciptionNameCell!
    var Cell:FileslistCell2!
    
    let arrImg: [UIImage] = [UIImage(named: "R1")!,
                             UIImage(named: "R2")!,
                             ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        PrescriptionTablHeight.constant = 260
        // Do any additional setup after loading the view.
    }
    
    @IBAction func BackButtClicked(_ sender: UIButton)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    // MARK:  TableView Delegate Methods
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 130
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let identifier = "PresciptionNameCell"
        Cell2 = tableView.dequeueReusableCell(withIdentifier: identifier) as? PresciptionNameCell
        if Cell2 == nil
        {
            tableView.register(UINib(nibName: "PresciptionNameCell", bundle: nil), forCellReuseIdentifier: identifier)
            Cell2 = tableView.dequeueReusableCell(withIdentifier: identifier) as? PresciptionNameCell
        }
        Cell2?.selectionStyle = UITableViewCellSelectionStyle.none
        PresciptionTabl.separatorStyle = .none
        PresciptionTabl.separatorColor = UIColor.clear
        
        if indexPath.row == 0
        {
            Cell2.PrescriptionSubQty.isHidden = false
            Cell2.PrescriptionNameLab.text = "Betadine Gargle"
            
            Cell2.PrescriptionSubQty.layer.borderWidth = 1.0
            Cell2.PrescriptionSubQty.layer.borderColor = #colorLiteral(red: 0.137254902, green: 0.3333333333, blue: 0.8823529412, alpha: 1)
        }
        else
        {
            Cell2.PrescriptionSubQty.isHidden = true
            Cell2.PrescriptionNameLab.text = "Amoxicillin"
        }
        
        return Cell2!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
    }
    
    
    
    
    
    // MARK:  Collection View Delegate methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return arrImg.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: 120, height: 120)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        Cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FileslistCell2", for: indexPath) as! FileslistCell2
        
        Cell.FileImage.image = arrImg[indexPath.row]
        
        Cell.contentView.layer.borderWidth = 2.0
        Cell.contentView.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        
        return Cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

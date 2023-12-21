//
//  KisiKayit.swift
//  KisilerUygulamasi
//
//  Created by Fatih Gümüş on 21.12.2023.
//

import UIKit

class KisiKayit: UIViewController {

    @IBOutlet weak var kisiAd: UITextField!
    @IBOutlet weak var kisiTel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    

    @IBAction func kisiKaydet(_ sender: Any) {
        
        if let ka = kisiAd.text ,let kt = kisiTel.text{
            kaydet(kisi_ad: ka, kisi_tel: kt)
        }
    }
    
    func kaydet(kisi_ad : String, kisi_tel : String){
        
        print("Kisi : \(kisi_ad) - \(kisi_tel)")
        
    }
    

}

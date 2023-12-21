//
//  KisiDetay.swift
//  KisilerUygulamasi
//
//  Created by Fatih Gümüş on 21.12.2023.
//

import UIKit

class KisiDetay: UIViewController {

    @IBOutlet weak var kisiAd: UITextField!
    @IBOutlet weak var kisiTel: UITextField!
    
    var kisi: Kisiler?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let k = kisi{
            kisiAd.text = k.kisi_ad
            kisiTel.text = k.kisi_tel
        }
    }
    

    @IBAction func kisiGuncelle(_ sender: Any) {
        if let ka = kisiAd.text, let kt = kisiTel.text,let k = kisi{
            guncelle(kisi_id: k.kisi_id!, kisi_ad: ka, kisi_tel: kt)
        }
    }
    
    func guncelle(kisi_id:Int,kisi_ad:String,kisi_tel:String){
        print("Guncelle : \(kisi_id) - \(kisi_ad) - \(kisi_tel)")
    }
    

}

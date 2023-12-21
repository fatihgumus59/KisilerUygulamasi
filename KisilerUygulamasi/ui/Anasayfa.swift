//
//  ViewController.swift
//  KisilerUygulamasi
//
//  Created by Fatih Gümüş on 21.12.2023.
//

import UIKit

class Anasayfa: UIViewController{

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var kisilerTableView: UITableView!
    
    var kisilerListesi = [Kisiler]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        kisilerTableView.delegate = self
        kisilerTableView.dataSource = self
        
        let k1 = Kisiler(kisi_id: 1, kisi_ad: "Fatih Gumus", kisi_tel: "14785236951")
        let k2 = Kisiler(kisi_id: 2, kisi_ad: "Mehmet Demir", kisi_tel: "32145698741")
        let k3 = Kisiler(kisi_id: 3, kisi_ad: "Ayşe Duzgunel", kisi_tel: "78965432175")
        let k4 = Kisiler(kisi_id: 4, kisi_ad: "Leyla Doğan", kisi_tel: "963258741159")
        
        kisilerListesi.append(k1)
        kisilerListesi.append(k2)
        kisilerListesi.append(k3)
        kisilerListesi.append(k4)
        
    }
    
    //başlangıç sayfası ne zaman görünse çalışır
    override func viewWillAppear(_ animated: Bool) {
        print("Ansayfaya Dönüldü")
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier  == "toDetay"{
            
            if let kisi = sender as? Kisiler{
                
                let gidilecekVC = segue.destination as! KisiDetay
                gidilecekVC.kisi = kisi
            }
        }
    }
    
   
    
}

extension Anasayfa : UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Search Bar : \(searchText)")
    }
}

extension Anasayfa : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kisilerListesi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let kisi = kisilerListesi[indexPath.row]
        
        let hucre = tableView.dequeueReusableCell(withIdentifier: "kisilerHucre") as! KisilerHucre
        
        hucre.labelKisiAd.text = kisi.kisi_ad
        hucre.labelKisiTel.text = kisi.kisi_tel
        
        return hucre
    }
    
    //seçili satıra tıklanırsa onun detay sayfasına gidecek
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let kisi = kisilerListesi[indexPath.row]
        performSegue(withIdentifier: "toDetay", sender: kisi)
        tableView.deselectRow(at: indexPath, animated: true)
    }
        
    //seçili nesneyi sürükleyerek işlem yapmak için
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let silAction = UIContextualAction(style: .destructive, title: "Sil"){contecttualAction,view,bool in
            let kisi = self.kisilerListesi[indexPath.row]
            
            let alert = UIAlertController(title: "Silme İşlemi", message: "\(kisi.kisi_ad!) kişisi silinsin mi ?", preferredStyle: .alert)
            
            let iptalAction = UIAlertAction(title: "İptal", style: .cancel)
            alert.addAction(iptalAction)
            
            let evetAction = UIAlertAction(title: "Evet", style: .destructive){action in
                print("Kişi sil \(kisi.kisi_id!)")
            }
            alert.addAction(evetAction)
            
            self.present(alert,animated: true)
            
        }
        return UISwipeActionsConfiguration(actions: [silAction])
    }
    
}

//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by MEWO on 30.07.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var USDLabel: UILabel!
    @IBOutlet weak var TRYLabel: UILabel!
    @IBOutlet weak var EURLabel: UILabel!
    @IBOutlet weak var BOBLabel: UILabel!
    @IBOutlet weak var KESLabel: UILabel!
    @IBOutlet weak var LAKLabel: UILabel!
    @IBOutlet weak var MADLabel: UILabel!
    @IBOutlet weak var NIOLabel: UILabel!
    @IBOutlet weak var RUBLabel: UILabel!
    @IBOutlet weak var UYULabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func getRatesClicked(_ sender: Any) {
        
        // 1.Request & Session (istek yollama)
        // 2.Response & Data (bu isteği almak)
        // 3.Parsing & JSON Serialization (datayı işlemek)
        
        let url = URL(string: "http://data.fixer.io/api/latest?access_key=5fb44320cf63a8b5b5162f31bdeddfa3") // API's URL
        let session = URLSession.shared //We are creating the object of URLSession, this object will be called from this class wherever it is called in the App (URLSession'ın objesini oluşturuyoruz, App içerisinde nerede çağırılırsa çağırılsın bu sınıftan bu obje çağırılacak.)
        
        
        //CLOSURE
        //don't forget to allow http connections (http bağlantılarına izin vermeyi unutmamamız gerekiyor)
        let task = session.dataTask(with: url!) { (data, response, error) in
            if error != nil
                {
                let alert = UIAlertController(title: "error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                //add OK button
                let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)
                }
            else
                {
                    if data != nil
                        {
                        do
                            {
                                let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, Any>
                                //ASYNC
                                DispatchQueue.main.async {
                                    if let rates = jsonResponse["rates"] as? [String: Any]
                                        {
                                        if let usd = rates["USD"] as? Double{
                                            self.USDLabel.text = "USD :\(usd)"}
                                        
                                        if let turkishLira = rates["TRY"] as? Double{
                                            self.TRYLabel.text = "TRY :\(turkishLira)"}
                                        
                                        if let eur = rates["EUR"] as? Double{
                                            self.EURLabel.text = "EUR :\(eur)"}
                                        
                                        if let bob = rates["BOB"] as? Double{
                                            self.BOBLabel.text = "BOB :\(bob)"}
                                        
                                        if let kes = rates["KES"] as? Double{
                                            self.KESLabel.text = "KES :\(kes)"}
                                        
                                        if let lak = rates["LAK"] as? Double{
                                            self.LAKLabel.text = "LAK :\(lak)"}
                                        
                                        if let mad = rates["MAD"] as? Double{
                                            self.MADLabel.text = "MAD :\(mad)"}
                                        
                                        if let nio = rates["NIO"] as? Double{
                                            self.NIOLabel.text = "NIO :\(nio)"}
                                        
                                        if let rub = rates["RUB"] as? Double{
                                            self.RUBLabel.text = "RUB :\(rub)"}
                                        
                                        if let uyu = rates["UYU"] as? Double{
                                            self.UYULabel.text = "UYU :\(uyu)"}
                                        
                                            }
                                }
                                
                                }catch
                                {
                                    print("error")
                                }
                        }
                }
        }
        task.resume()
        
    }
    
}


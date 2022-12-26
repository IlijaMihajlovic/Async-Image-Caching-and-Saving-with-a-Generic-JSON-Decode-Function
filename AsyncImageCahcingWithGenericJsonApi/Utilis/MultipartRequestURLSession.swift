
import Foundation
import Alamofire


func uploadImage(imgType:String,imgData:Data,imageName:String){
        // params to send additional data, for eg. AccessToken or userUserId
        let params = ["userID":"userId","accessToken":"your accessToken"]
        print(params)
        AF.upload(multipartFormData: { multiPart in
            for (key,keyValue) in params{
                if let keyData = keyValue.data(using: .utf8){
                    multiPart.append(keyData, withName: key)
                }
            }

            multiPart.append(imgData, withName: "key",fileName: imageName,mimeType: "image/*")
        }, to: "Your URL",headers: []).responseJSON { apiResponse in

            switch apiResponse.result{
            case .success(_):
                let apiDictionary = apiResponse.value as? [String:Any]
                print("apiResponse --- \(apiDictionary)")
            case .failure(_):
                print("got an error")
            }
        }
    }

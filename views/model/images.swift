import Foundation

struct ImageModels : Decodable{
    let page : Int
    let perPage : Int
    let total: Int
    let totalPages : Int
    let data : [ImageModel]
}

struct ImageModel: Hashable, Codable, Identifiable {
    
    var albumId: Int
    var id : Int
    var title : String
    var url : String
    var thumbnailUrl : String
    
}

class Api : ObservableObject {
    
    @Published var images = [ImageModel]()
    
    var totalPages = 0
    var page : Int = 1
    
    init() {
        loadData { images in self.images = images
        }
    }
    
    func loadMoreContent(currentItem item: ImageModel){
        let thresholdIndex = self.images.index(self.images.endIndex, offsetBy: -1)
        if thresholdIndex == item.id, (page + 1) <= totalPages {
            page += 1
            upperbound += 10
            Api().loadData(completion: { images in
                self.images = images
            })
        }
    }
    
    func loadData(completion:@escaping ([ImageModel]) -> ()) {
        
        let start = 0
        var limit = 10
        
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/photos?_start=\(start)&_\(upperbound)") else {
            print("Invalid url...")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            let images = try! JSONDecoder().decode([ImageModel].self, from: data!)
            print(images)
            DispatchQueue.main.async {
                completion(images)
            }
        }.resume()
    }
}

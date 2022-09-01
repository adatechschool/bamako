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
    
    var page : Int = 1
    var start : Int = 0
    var limit : Int = 20
    
    init() {
        loadData(start: self.start, limit: self.limit) { images in
            self.images = images
        }
    }
    
    
    func loadMoreContent(currentItem item: ImageModel){
        print(self.images.endIndex)
        let thresholdIndex = self.images.index(self.images.endIndex, offsetBy: -1)
        if thresholdIndex == item.id {
            page += 1
            start += 20
            limit += 20
            Api().loadData(start : start, limit : limit, completion: { images in
                self.images = images
                
            })
        }
    }
    
    func loadData(start : Int, limit : Int, completion:@escaping ([ImageModel]) -> ()) {
//    http://jsonplaceholder.typicode.com/photos?_start=0&_limit=5
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/photos?_start=\(start)&_limit=\(limit)") else {
            print("Invalid url...")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            let images = try? JSONDecoder().decode([ImageModel].self, from: data!)
            print(images ?? [])
            DispatchQueue.main.async {
                completion(images ?? [])
            }
        }.resume()
    }
}

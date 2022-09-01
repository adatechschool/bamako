import Foundation

struct ImageModel: Hashable, Codable, Identifiable {
    
    var albumId: Int
    var id : Int
    var title : String
    var url : String
    var thumbnailUrl : String
    
}

class Api : ObservableObject {
    
    @Published var images = [ImageModel]()
    
    func loadData(completion:@escaping ([ImageModel]) -> ()) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/photos") else {
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



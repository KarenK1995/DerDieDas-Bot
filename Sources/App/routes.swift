import Vapor
import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

func routes(_ app: Application) throws {
    app.get { req in
        return "It works!"
    }

    app.get("hello") { req -> String in
        return "Hello, world!"
    }
    
    app.post(["message", "1663829518:AAFkv2jiaL9hC7vPMKu6jYl3b3lQ4k2dqq0"]) { request -> String in
        
        do {
            let message = try request.content.decode(RSMessage.self)
            
            let logMessage = Logger.Message(stringLiteral: "***** \(request.body.string ?? "") *****")
            request.logger.info(logMessage)
            
            let responseMessage = DerDieDasDataProvider.search(searchTerm: message.message.text)?.article.uppercased() ?? "Leider konnte ich den Artikel nicht finden"
            
            var request = URLRequest(url: TGEndpoint.sendMessage.url)
            request.httpMethod = "POST"
            
            let body = ["chat_id": message.message.chat.id, "text": responseMessage] as [String: Any]
            let bodyData = try? JSONSerialization.data(withJSONObject: body, options: [])
            
            request.httpBody = bodyData
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            URLSession.shared.dataTask(with: request) { (data, response, error) in
            }.resume()
        }
        catch {
            print(error)
        }
        
        return "11"
    }
}


//DerDieDas_lernen_bot
//1663829518:AAFkv2jiaL9hC7vPMKu6jYl3b3lQ4k2dqq0


//,
//.target(name: "Project", dependencies: ["Logging"])

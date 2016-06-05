// Telegram Bot SDK for Swift (unofficial).
// (c) 2015 - 2016 Andrey Fidrya. MIT license. See LICENSE for more information.

import Foundation

public extension TelegramBot {
	typealias GetChatCompletion = (result: Chat?, error: DataTaskError?)->()
	
	/// Get up to date information about the chat (current name of the user for one-on-one conversations, current username of a user, group or channel, etc.). Blocking version.
	/// - Returns: Chat object on success. Nil on error, in which case `lastError` contains the details.
	/// - SeeAlso: <https://core.telegram.org/bots/api#getchat>
	public func getChatSync(chatId: Int64,
	                        parameters: [String: Any?] = [:]) -> Chat? {
		let allParameters: [String: Any?] =
			defaultParameters["getChat"] ?? [:] + parameters +
				["chat_id": chatId]
		return requestSync("getChat", allParameters)
	}
	
	/// Get up to date information about the chat (current name of the user for one-on-one conversations, current username of a user, group or channel, etc.). Asynchronous version.
	/// - Returns: Chat object on success. Nil on error, in which case `error` contains the details.
	/// - SeeAlso: <https://core.telegram.org/bots/api#getchat>
	public func getChatAsync(chatId: Int64,
	                         parameters: [String: Any?] = [:],
	                         queue: dispatch_queue_t = dispatch_get_main_queue(),
	                         completion: GetChatCompletion? = nil) {
		let allParameters: [String: Any?] =
			defaultParameters["getChat"] ?? [:] + parameters +
				["chat_id": chatId]
		requestAsync("getChat", allParameters, queue: queue, completion: completion)
	}
}

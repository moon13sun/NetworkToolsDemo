//
//  STNetworkTools.swift
//  NetworkToolsDemo
//
//  Created by leergou on 16/7/21.
//  Copyright © 2016年 WhiteHouse. All rights reserved.
//

import UIKit
import AFNetworking

// 网络请求枚举
enum STRequestType: String{
    
    case GET = "GET"
    case POST = "POST"
}


class STNetworkTools: AFHTTPSessionManager{

    static let sharedTools: STNetworkTools = {
        
        let tools = STNetworkTools()
        tools.responseSerializer.acceptableContentTypes?.insert("text/html")
        
        return tools
    }()
    
    
    //MARK: 访问网络
    func request(type: STRequestType, urlString: String, parameters: AnyObject?, success:(responseObject: AnyObject?)->(), failuer:(error: NSError)->()){
        
        if type == STRequestType.GET {
            
            self.GET(urlString, parameters: parameters, progress: nil, success: { (_, res) in
                
                success(responseObject: res)
                }, failure: { (_, err) in
                    
                    failuer(error: err)
            })
            
        } else {
            
            self.POST(urlString, parameters: parameters, progress: nil, success: { (_, res) in
                
                success(responseObject: res)
                }, failure: { (_, err) in
                    
                    failuer(error: err)
            })
        }
    }
    
}

//MARK: 获取网络数据
extension STNetworkTools{
    
    func loadWeatherData(success:(responseObject: AnyObject?)->(), failuer:(error: NSError)->()) {
        
        let urlString = "http://www.weather.com.cn/data/sk/101010100.html"
        
        request(.GET, urlString: urlString, parameters: nil, success: success, failuer: failuer)
    }
}




















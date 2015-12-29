//
//  ApiManager.m
//  RealmMantleTutorial
//
//  Created by Rafael Ferreira on 12/28/15.
//  Copyright © 2015 Data Empire. All rights reserved.
//

#import "ApiManager.h"

/*! @brief The path for doing a GET request for the list of articles. */
static NSString *const kArticlesListPath = @"/svc/search/v2/articlesearch.json";

/*! @brief The api key for doing the requests. */
static NSString *const kApiKey = @"5168ebda29d336f3012823df623f4b0d:0:73879248";

@implementation ApiManager

- (NSURLSessionDataTask *)getArticlesWithRequestModel:(ArticleListRequestModel *)requestModel
                                              success:(void (^)(ArticleListResponseModel *))success
                                              failure:(void (^)(NSError *))failure {
    NSDictionary *parameters = [MTLJSONAdapter JSONDictionaryFromModel:requestModel error:nil];
    
    NSMutableDictionary *parametersWithKey = [[NSMutableDictionary alloc] initWithDictionary:parameters];
    [parametersWithKey setObject:kApiKey forKey:@"api-key"];
    
    return [self GET:kArticlesListPath parameters:parametersWithKey progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *responseDictionary = (NSDictionary *)responseObject;
        
        NSError *error;
        
        ArticleListResponseModel *list = [MTLJSONAdapter modelOfClass:ArticleListResponseModel.class fromJSONDictionary:responseDictionary error:&error];
        
        success(list);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}

@end

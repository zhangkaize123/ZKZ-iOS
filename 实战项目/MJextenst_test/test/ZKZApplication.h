//
//  ZKZApplication.h
//  test
//
//  Created by 张凯泽 on 15-4-17.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface ZKZApplication : NSObject
@property(nonatomic,assign)long applicationId;
@property(nonatomic,assign)long downloads;
/*
 (
 {
 applications =         (
 {
 applicationId = 557137623;
 comment = 0;
 downloads = 1138;
 iconUrl = "http://photo.candou.com/i/114/ede69d55271a82d513b9aee4c0eb0a44";
 name = "\U6124\U6012\U7684\U5c0f\U9e1f:\U661f\U7403\U5927\U6218";
 ratingOverall = 0;
 starOverall = "4.5";
 },
 {
 applicationId = 739667967;
 comment = 0;
 downloads = 335;
 iconUrl = "http://photo.candou.com/i/114/8716fcd5a94b30e485741364b02550a6";
 name = "\U6d88\U706d\U661f\U661f PopStar! Pro";
 ratingOverall = 0;
 starOverall = "4.0";
 },
 {
 applicationId = 747314884;
 comment = 0;
 downloads = 331;
 iconUrl = "http://photo.candou.com/i/114/04c30e0c0bb3cee516dcd8b8e72e51bc";
 name = "\U5272\U7ef3\U5b502";
 ratingOverall = 0;
 starOverall = "4.5";
 },
 {
 applicationId = 654943412;
 comment = 0;
 downloads = 284;
 iconUrl = "http://photo.candou.com/i/114/fbceafd89a56b6037a7b469e1e9aa251";
 name = "\U5408\U4f53\U661f\U661f";
 ratingOverall = 0;
 starOverall = "4.0";
 }
 );
 date = "2014-02-26";
 desc = "\U5c0f\U7f16mm\U63a8\U8350\Uff1a\U8ffd\U97e9\U5267\U5f53\U7136\U4e0d\U80fd\U5fd8\U4e86\U73a9\U6e38\U620f\Uff0c\U5404\U8272\U661f\U661f\U90fd\U5df2\U5728\U6b64\Uff0c\U4f60\U51c6\U5907\U597d\U4e86\U5564\U9152\U548c\U70b8\U9e21\U4e86\U4e48\Uff1f";
 "desc_img" = "http://special.candou.com/bc02eddd7785db5cf48087b8cac06d51.jpg";
 img = "http://special.candou.com/fc3b85d07e093e01da1fc5354c0fe50a.jpg";
 title = "\U548c\U300a\U661f\U4f60\U300b\U4e00\U8d77\U73a9\U661f\U661f\U6e38\U620f";
 },
 
 
 

 返回的数据类型是:
 
 (
   {
      applications =
            (
              {   "applicationId" = 557137623   }
 
               {   "applicationId" = 557137623   }
             ),
 
            date = "2014-02-26";
            title = "\U548c\U300a\U661f\U4f60\U300b\U4e00\U8d77\U73a9\U661f\U661f\U6e38\U620f";
 
   },
               
 
 
 
 
 
 )
 
 
 
 
 
 */
@end

//
//  Define.h
//  DailyLIfeULoved
//
//  Created by qianfeng on 16/3/5.
//  Copyright © 2016年 雯子. All rights reserved.
//

#ifndef Define_h
#define Define_h


#define Header (@"http://api.meitianapp.com/api/v1/")
#define Article (@"articles?")
#define Category (@"categoryGroups?")
#define Author (@"authors?")
#define Width (@"[UIScreen mainScreen].bounds.size.width")

#endif /* Define_h */
/*
   htp://api.meitianapp.com/api/v1/articles?filter=isHomepage&start=0&limit=15
 htt://api.meitianapp.com/api/v1/articles?filter=isRankingList
 
 评论 htp://api.meitianapp.com/api/v1/comments?filter=hottestByArticle&param=ad6814a2-0c7a-45c6-ab68-cb47676a46b4 HTTP/1.1
 喜欢的用户 htp://api.meitianapp.com/api/v1/article/ad6814a2-0c7a-45c6-ab68-cb47676a46b4/vote/users?filter=isLike
 
 XML  htp://www.meitianapp.com/app/article/ad6814a2-0c7a-45c6-ab68-cb47676a46b4
 
 往期 htp://api.meitianapp.com/api/v1/articles?filter=isHomepage&start=14515200&limit=15
 
 发现-推荐 cell htp://api.meitianapp.com/api/v1/articles?filter=isDiscoveryByAI&start=bece16a9-6b92-36aa-bf43-612927e2d677&limit=15
 推荐  模块 htp://api.meitianapp.com/api/v1/categoryGroups?filter=withCategory
 
 推荐  头条 htp://api.meitianapp.com/api/v1/articles?filter=isFocus&start=0&limit=1
 闪购 htp://api.meitianapp.com/api/v1/sales?filter=isOpen
 往期闪购 htp://api.meitianapp.com/api/v1/sales?filter=isClosed&start=0&limit=5
 关于我们  htp://m.meitianapp.com/app/aboutUs
 
 风尚 htp://api.meitianapp.com/api/v1/articles?param=1&filter=byCategoryGroup&start=0&limit=10
 
 作者详细信息 htp://api.meitianapp.com/api/v1/articles?param=56f49686-b109-31a9-ac97-d97da06aada8&filter=byAuthor&start=0&limit=10
 
 专栏 htp://api.meitianapp.com/api/v1/authors?filter=isDiscovery&start=0&limit=10
 作者  htp://api.meitianapp.com/api/v1/authors?filter=isFocus&start=0&limit=5
 
 投稿 htp://api.meitianapp.com/api/v1/author/contributor
 */

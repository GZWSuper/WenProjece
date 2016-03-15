//
//  Define.h
//  WalkAroundWithDearMe
//
//  Created by qianfeng on 16/3/14.
//  Copyright © 2016年 雯子. All rights reserved.
//

#ifndef Define_h
#define Define_h
#define ViewFramWidth self.view.frame.size.width

#define ViewFramHeight self.view.frame.size.height

#define Color2 [UIColor colorWithRed:255/255.0 green:221/255.0 blue:213/255.0 alpha:1.0]

#define Color [UIColor colorWithRed:241/255.0 green:165/255.0 blue:182/255.0 alpha:1.0]

#define Color3 [UIColor colorWithRed:255/255.0 green:240/255.0 blue:236/255.0 alpha:1.0]

#define StoryUrl @"http://api.breadtrip.com/v2/new_trip/spot/hot/list/?start=%d"

#define StoryUrl1 @"http://api.breadtrip.com/v2/new_trip/spot/hot/list/"

#define StoryTwoUrl @"http://api.breadtrip.com/v2/new_trip/spot/?spot_id=%@"

#define ScoreView @"http://api.breadtrip.com/v2/index/"

#define MainViewUrl @"http://api.breadtrip.com/v2/index/?next_start=%ld"

#define SearchUrl @"http://api.breadtrip.com/destination/v3/?last_modified_since=0"

#define MainTwoUrl @"http://api.breadtrip.com/trips/%@/waypoints/?gallery_mode=1"


#define CityUrl @"http://api.breadtrip.com/destination/place/%@/%@/"

#define NotMistackUrl @"http://web.breadtrip.com/mobile/destination/%@/%@/intro/"

#define CityGuideUrl @"http://web.breadtrip.com/mobile/destination/%@/%@/overview/"

#define RecommendUrl @"http://web.breadtrip.com/mobile/destination/%@/%@/intro/"

#define PlayUrl @"http://api.breadtrip.com/destination/place/%@/%@/trips/?start=0"

#define CityTwoUrl @"http://api.breadtrip.com/destination/place/%@/%@/"




#endif /* Define_h */

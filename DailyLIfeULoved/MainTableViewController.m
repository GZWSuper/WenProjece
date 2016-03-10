//
//  MainTableViewController.m
//  DailyLIfeULoved
//
//  Created by qianfeng on 16/3/5.
//  Copyright © 2016年 雯子. All rights reserved.
//

#import "MainTableViewController.h"
#import "SDImageCache.h"

@interface MainTableViewController ()

@end

@implementation MainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section==0) {
        return 1;
    }else return 2;

}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section==1){
        if(indexPath.row==0){
         [self clearCache];
        }else{
         [self request];
        }
    }
}
- (void)request{
    UIAlertView*alert=[[UIAlertView alloc]initWithTitle:nil message:@"感谢您对我们的支持^_^"  delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
}
- (void)clearCache{
    UIAlertController*sheet=[UIAlertController alertControllerWithTitle:@"确定清除吗？" message:[NSString stringWithFormat:@"总共有%.2fM缓存",[self getCacheSize]] preferredStyle:UIAlertControllerStyleActionSheet];
    [sheet addAction:[UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleCancel handler:nil]];
    [sheet addAction:[UIAlertAction actionWithTitle:@"delete" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),^{
            NSString*cachePath=[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
            NSArray*files=[[NSFileManager defaultManager] subpathsAtPath:cachePath];
            for(NSString*str in files){
                NSError*error;
                NSString*path1=[cachePath stringByAppendingPathComponent:str];
                if([[NSFileManager defaultManager] fileExistsAtPath:path1]){
                    [[NSFileManager defaultManager]removeItemAtPath:path1 error:&error];
                    
                }
            }
        });
    }]];
    [self presentViewController:sheet animated:YES completion:nil];
}
- (CGFloat)getCacheSize{
    NSUInteger imageCacheSize=[[SDImageCache sharedImageCache] getSize];
    NSString*myCachePath=[NSHomeDirectory() stringByAppendingPathComponent:@"Library/Caches/MyCaches"];
    NSDirectoryEnumerator*enumerator=[[NSFileManager defaultManager] enumeratorAtPath:myCachePath];
    __block NSUInteger count=0;
    for(NSString *fileName in enumerator){
        NSString*path=[myCachePath stringByAppendingPathComponent:fileName];
        NSDictionary*fileDic=[[NSFileManager defaultManager] attributesOfItemAtPath:path error:nil];
        count += fileDic.fileSize;
    }
    CGFloat totalSize=((CGFloat)imageCacheSize+count)/1024/1024;
    return totalSize;
    
}
/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

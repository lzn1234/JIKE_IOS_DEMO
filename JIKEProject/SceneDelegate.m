//
//  SceneDelegate.m
//  JIKEProject
//
//  Created by 林振楠 on 2021/9/9.
//

#import "SceneDelegate.h"
#import "LZNewsViewController.h"
#import "LZRecommendController.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    
    UITabBarController *tabBar = [UITabBarController new];
    tabBar.tabBar.backgroundColor = [UIColor whiteColor];
    
    LZNewsViewController *vc1 = [LZNewsViewController new];
    
    UIViewController *vc2 = [UIViewController new];
    vc2.view.backgroundColor = [UIColor redColor];
    vc2.tabBarItem.title = @"视频";
    vc2.tabBarItem.image = [UIImage imageNamed:@"like"];
    vc2.tabBarItem.selectedImage = [UIImage imageNamed:@"like_selected"];

    LZRecommendController *commendController = [LZRecommendController new];

    UIViewController *vc4 = [UIViewController new];
    vc4.view.backgroundColor = [UIColor yellowColor];
    vc4.tabBarItem.title = @"我的";
    vc4.tabBarItem.image = [UIImage imageNamed:@"video"];
    vc4.tabBarItem.selectedImage = [UIImage imageNamed:@"video_selected"];

    [tabBar setViewControllers:@[vc1, vc2, commendController, vc4]];
    
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:tabBar];
    
    self.window.rootViewController = nav;

}


- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}


@end

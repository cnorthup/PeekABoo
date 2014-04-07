//
//  MapViewController.m
//  PeekABoo
//
//  Created by Charles Northup on 4/6/14.
//  Copyright (c) 2014 MobileMakers. All rights reserved.
//

#import "MapViewController.h"
#import <MapKit/MapKit.h>

@interface MapViewController () <MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property MKPointAnnotation* addressAnnotation;


@end

@implementation MapViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    CLGeocoder* geoCoder = [CLGeocoder new];
    [geoCoder geocodeAddressString:self.address completionHandler:^(NSArray *placemarks, NSError *error) {
        
        for (CLPlacemark* placeMark in placemarks) {
            MKPointAnnotation* annotation = [MKPointAnnotation new];
            annotation.coordinate = placeMark.location.coordinate;
            MKCoordinateSpan addressSpan = MKCoordinateSpanMake(.01, .01);
            MKCoordinateRegion addressRegion = MKCoordinateRegionMake(annotation.coordinate, addressSpan);
            self.mapView.region = addressRegion;
            [self.mapView addAnnotation:annotation];
        }

    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

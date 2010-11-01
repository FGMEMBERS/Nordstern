###############################################################################
##
## Zeppelin LZ 121 "Nordstern" airship for FlightGear.
## Walk view configuration.
##
##  Copyright (C) 2010  Anders Gidenstam  (anders(at)gidenstam.org)
##  This file is licensed under the GPL license v2 or later.
##
###############################################################################

# Constraints
var carConstraint =
    walkview.makeUnionConstraint(
        [
         walkview.SlopingYAlignedPlane.new([20.3, -0.5, -10.8], # Extreme ends
                                           [23.5,  0.5, -10.8]),
         walkview.SlopingYAlignedPlane.new([38.3, -0.5, -11.1],
                                           [43.0,  0.5, -11.2]),
         
         walkview.SlopingYAlignedPlane.new([23.4, -0.0, -10.8], # Rooms
                                           [24.8,  1.3, -10.9]),
         walkview.SlopingYAlignedPlane.new([25.1, -1.3, -10.9],
                                           [29.8,  1.3, -10.9]),
         walkview.SlopingYAlignedPlane.new([30.1, -1.3, -10.9],
                                           [34.8,  1.3, -11.0]),
         walkview.SlopingYAlignedPlane.new([35.1, -1.3, -11.0],
                                           [37.4,  1.3, -11.1]),
         
         walkview.SlopingYAlignedPlane.new([23.4, -0.05, -10.8], # Doorways
                                           [38.3,  0.62, -11.1]),
        ]);
var keelConstraint =
    walkview.makeUnionConstraint(
        [
         walkview.SlopingYAlignedPlane.new([ 10.0, -0.1,  -6.3],
                                           [ 15.0,  0.1,  -7.2]),
         walkview.SlopingYAlignedPlane.new([ 15.0, -0.1,  -7.2],
                                           [ 20.0,  0.1,  -7.8]),
         walkview.SlopingYAlignedPlane.new([ 20.0, -0.1,  -7.8],
                                           [ 25.0,  0.1,  -8.2]),
         walkview.SlopingYAlignedPlane.new([ 25.0, -0.1,  -8.2],
                                           [ 30.0,  0.1,  -8.6]),
         walkview.SlopingYAlignedPlane.new([ 30.0, -0.1,  -8.6],
                                           [ 35.0,  0.1,  -8.8]),
         walkview.SlopingYAlignedPlane.new([ 35.0, -0.1,  -8.8],
                                           [ 40.0,  0.1,  -9.0]),
         walkview.SlopingYAlignedPlane.new([ 40.0, -0.1,  -9.0],
                                           [ 50.0,  0.1,  -9.1]),
         walkview.SlopingYAlignedPlane.new([ 50.0, -0.1,  -9.1],
                                           [ 65.0,  0.1,  -9.1]),
         walkview.SlopingYAlignedPlane.new([ 65.0, -0.1,  -9.1],
                                           [ 70.0,  0.1,  -8.8]),
         walkview.SlopingYAlignedPlane.new([ 70.0, -0.1,  -8.8],
                                           [ 80.0,  0.1,  -8.5]),
         walkview.SlopingYAlignedPlane.new([ 80.0, -0.1,  -8.5],
                                           [ 90.0,  0.1,  -7.9]),
         walkview.SlopingYAlignedPlane.new([ 90.0, -0.1,  -7.9],
                                           [ 95.0,  0.1,  -7.4]),
         walkview.SlopingYAlignedPlane.new([ 95.0, -0.1,  -7.4],
                                           [100.0,  0.1,  -6.9]),
         walkview.SlopingYAlignedPlane.new([100.0, -0.1,  -6.9],
                                           [105.0,  0.1,  -6.2]),
         walkview.SlopingYAlignedPlane.new([105.0, -0.1,  -6.2],
                                           [110.0,  0.1,  -5.4]),
        ]);
var ladderPosition = [22.7, -0.45, 0.0];

var climbLadder = func {
    var walker = walkview.active_walker();
    if (walker != nil) {
        var p = walker.get_pos();
        if (math.abs(p[0] - ladderPosition[0]) < 0.5 and
            math.abs(p[1] - ladderPosition[1]) < 0.5) {
            
            if (walker.get_constraints() == keelConstraint) {
                walker.set_constraints(carConstraint);
            } else {
                walker.set_constraints(keelConstraint);
            }
        }
    }
}

# Create the view managers.
var steward_walker = walkview.Walker.new("Steward View",
                                         carConstraint,
                                         [walkview.JSBSimPointmass.new(27)]);
var rigger_walker = walkview.Walker.new("Rigger View",
                                        keelConstraint,
                                        [walkview.JSBSimPointmass.new(28)]);



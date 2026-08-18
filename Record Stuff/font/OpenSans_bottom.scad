include <font_base.scad>

module OpenSans_bottom_contour00x21_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[13, 15], [9.0, 15.0], [5, 15], 
		[4.5, 30.5], [4, 46], [9.5, 46.0], 
		[15, 46],[14.0, 30.5], ]);
}

module OpenSans_bottom_contour00x21_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour00x21_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour00x21(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x21_skeleton();
			OpenSans_bottom_contour00x21_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x21_subtractive_curves(steps);
	}
}

module OpenSans_bottom_contour10x21_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[4, 4], [4, 7], [5.0, 8.5], 
		[6, 10], [9, 10], [12, 10], 
		[13.5, 8.5], [15, 7], [15, 4], 
		[15, 2], [13.5, 0.5], [12, -1], 
		[9, -1], [7, -1], [5.5, 0.5], 
		[4, 2], ]);
}

module OpenSans_bottom_contour10x21_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour10x21_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([4, 4], [4, 7], [5.0, 8.5],steps,3);
	BezConic([5.0, 8.5], [6, 10], [9, 10],steps,3);
	BezConic([9, 10], [12, 10], [13.5, 8.5],steps,3);
	BezConic([13.5, 8.5], [15, 7], [15, 4],steps,3);
	BezConic([15, 4], [15, 2], [13.5, 0.5],steps,3);
	BezConic([13.5, 0.5], [12, -1], [9, -1],steps,3);
	BezConic([9, -1], [7, -1], [5.5, 0.5],steps,3);
	BezConic([5.5, 0.5], [4, 2], [4, 4],steps,3);
}
}

module OpenSans_bottom_contour10x21(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour10x21_skeleton();
			OpenSans_bottom_contour10x21_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour10x21_subtractive_curves(steps);
	}
}

module OpenSans_bottom_chunk10x21(steps=2) {
	difference() {
		OpenSans_bottom_contour00x21(steps);
		
	}
}

module OpenSans_bottom_chunk20x21(steps=2) {
	difference() {
		OpenSans_bottom_contour10x21(steps);
		
	}
}

OpenSans_bottom_bbox0x21=[[4, -1], [15, 46]];

module OpenSans_bottom_letter0x21(detail=2) {
	OpenSans_bottom_chunk10x21(steps=detail);
	OpenSans_bottom_chunk20x21(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x22_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[13, 46], [12.5, 37.5], [12, 29], 
		[8.5, 29.0], [5, 29], [4.5, 37.5], 
		[4, 46],[8.5, 46.0], ]);
}

module OpenSans_bottom_contour00x22_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour00x22_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour00x22(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x22_skeleton();
			OpenSans_bottom_contour00x22_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x22_subtractive_curves(steps);
	}
}

module OpenSans_bottom_contour10x22_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[26, 46], [25.5, 37.5], [25, 29], 
		[22.0, 29.0], [19, 29], [18.0, 37.5], 
		[17, 46],[21.5, 46.0], ]);
}

module OpenSans_bottom_contour10x22_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour10x22_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour10x22(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour10x22_skeleton();
			OpenSans_bottom_contour10x22_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour10x22_subtractive_curves(steps);
	}
}

module OpenSans_bottom_chunk10x22(steps=2) {
	difference() {
		OpenSans_bottom_contour00x22(steps);
		
	}
}

module OpenSans_bottom_chunk20x22(steps=2) {
	difference() {
		OpenSans_bottom_contour10x22(steps);
		
	}
}

OpenSans_bottom_bbox0x22=[[4, 29], [26, 46]];

module OpenSans_bottom_letter0x22(detail=2) {
	OpenSans_bottom_chunk10x22(steps=detail);
	OpenSans_bottom_chunk20x22(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x23_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[31, 26], [30.5, 22.5], [30, 19], 
		[34.0, 19.0], [38, 19], [38.0, 16.0], 
		[38, 13], [33.5, 13.0], [29, 13], 
		[27.5, 6.5], [26, 0], [22.5, 0.0], 
		[19, 0], [20.5, 6.5], [22, 13], 
		[19.0, 13.0], [16, 13], [14.5, 6.5], 
		[13, 0], [10.0, 0.0], [7, 0], 
		[8.0, 6.5], [9, 13], [5.0, 13.0], 
		[1, 13], [1.0, 16.0], [1, 19], 
		[5.5, 19.0], [10, 19], [11.0, 22.5], 
		[12, 26], [8.0, 26.0], [4, 26], 
		[4.0, 29.5], [4, 33], [8.5, 33.0], 
		[13, 33], [14.0, 39.5], [15, 46], 
		[18.5, 46.0], [22, 46], [21.0, 39.5], 
		[20, 33], [23.0, 33.0], [26, 33], 
		[27.0, 39.5], [28, 46], [31.5, 46.0], 
		[35, 46], [33.5, 39.5], [32, 33], 
		[36.0, 33.0], [40, 33], [40.0, 29.5], 
		[40, 26],[35.5, 26.0], ]);
}

module OpenSans_bottom_contour00x23_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour00x23_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour00x23(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x23_skeleton();
			OpenSans_bottom_contour00x23_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x23_subtractive_curves(steps);
	}
}

module OpenSans_bottom_contour10x23_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[17, 19], [20.0, 19.0], [23, 19], 
		[23.5, 22.5], [24, 26], [21.0, 26.0], 
		[18, 26],[17.5, 22.5], ]);
}

module OpenSans_bottom_contour10x23_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour10x23_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour10x23(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour10x23_skeleton();
			OpenSans_bottom_contour10x23_subtractive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour10x23_additive_curves(steps);
	}
}

module OpenSans_bottom_chunk10x23(steps=2) {
	difference() {
		OpenSans_bottom_contour00x23(steps);
		scale([1,1,1.1]) OpenSans_bottom_contour10x23(steps);
	}
}

OpenSans_bottom_bbox0x23=[[1, 0], [40, 46]];

module OpenSans_bottom_letter0x23(detail=2) {
	OpenSans_bottom_chunk10x23(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x24_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[34, 14], [34, 9], [30.5, 6.0], 
		[27, 3], [20, 3], [20.0, -0.5], 
		[20, -4], [18.0, -4.0], [16, -4], 
		[16.0, -0.5], [16, 3], [9, 3], 
		[3, 5], [3.0, 9.5], [3, 14], 
		[6, 12], [9.5, 11.0], [13, 10], 
		[16, 10], [16.0, 15.0], [16, 20], 
		[15.0, 20.0], [14, 20], [8, 23], 
		[5.5, 26.0], [3, 29], [3, 33], 
		[3, 37], [6.5, 40.0], [10, 43], 
		[16, 44], [16.0, 46.5], [16, 49], 
		[18.0, 49.0], [20, 49], [20.0, 46.5], 
		[20, 44], [28, 44], [33, 41], 
		[31.5, 37.5], [30, 34], [26, 36], 
		[20, 36], [20.0, 31.5], [20, 27], 
		[27, 25], [29.5, 23.0], [32, 21], 
		[33.0, 19.0],[34, 17], ]);
}

module OpenSans_bottom_contour00x24_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([3, 14], [6, 12], [9.5, 11.0],steps,3);
	BezConic([9.5, 11.0], [13, 10], [16, 10],steps,3);
	BezConic([30, 34], [26, 36], [20, 36],steps,3);
}
}

module OpenSans_bottom_contour00x24_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([34, 14], [34, 9], [30.5, 6.0],steps,3);
	BezConic([30.5, 6.0], [27, 3], [20, 3],steps,3);
	BezConic([16, 3], [9, 3], [3, 5],steps,3);
	BezConic([14, 20], [8, 23], [5.5, 26.0],steps,3);
	BezConic([5.5, 26.0], [3, 29], [3, 33],steps,3);
	BezConic([3, 33], [3, 37], [6.5, 40.0],steps,3);
	BezConic([6.5, 40.0], [10, 43], [16, 44],steps,3);
	BezConic([20, 44], [28, 44], [33, 41],steps,3);
	BezConic([20, 27], [27, 25], [29.5, 23.0],steps,3);
	BezConic([29.5, 23.0], [32, 21], [33.0, 19.0],steps,3);
	BezConic([33.0, 19.0], [34, 17], [34, 14],steps,3);
}
}

module OpenSans_bottom_contour00x24(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x24_skeleton();
			OpenSans_bottom_contour00x24_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x24_subtractive_curves(steps);
	}
}

module OpenSans_bottom_contour10x24_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[25, 14], [25, 15], [24.0, 16.0], 
		[23, 17], [20, 18], [20.0, 14.0], 
		[20, 10],[25, 11], ]);
}

module OpenSans_bottom_contour10x24_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([25, 14], [25, 15], [24.0, 16.0],steps,3);
	BezConic([24.0, 16.0], [23, 17], [20, 18],steps,3);
	BezConic([20, 10], [25, 11], [25, 14],steps,3);
}
}

module OpenSans_bottom_contour10x24_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour10x24(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour10x24_skeleton();
			OpenSans_bottom_contour10x24_subtractive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour10x24_additive_curves(steps);
	}
}

module OpenSans_bottom_contour20x24_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[12, 33], [12, 31], [13.0, 30.5], 
		[14, 30], [16, 29], [16.0, 32.5], 
		[16, 36],[12, 35], ]);
}

module OpenSans_bottom_contour20x24_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([12, 33], [12, 31], [13.0, 30.5],steps,3);
	BezConic([13.0, 30.5], [14, 30], [16, 29],steps,3);
	BezConic([16, 36], [12, 35], [12, 33],steps,3);
}
}

module OpenSans_bottom_contour20x24_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour20x24(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour20x24_skeleton();
			OpenSans_bottom_contour20x24_subtractive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour20x24_additive_curves(steps);
	}
}

module OpenSans_bottom_chunk10x24(steps=2) {
	difference() {
		OpenSans_bottom_contour00x24(steps);
		scale([1,1,1.1]) OpenSans_bottom_contour10x24(steps);
	scale([1,1,1.1]) OpenSans_bottom_contour20x24(steps);
	}
}

OpenSans_bottom_bbox0x24=[[3, -4], [34, 49]];

module OpenSans_bottom_letter0x24(detail=2) {
	OpenSans_bottom_chunk10x24(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x25_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[10, 32], [10, 28], [10.5, 26.0], 
		[11, 24], [13, 24], [16, 24], 
		[16, 32], [16, 40], [13, 40], 
		[11, 40], [10.5, 38.0], [10, 36], 
		 ]);
}

module OpenSans_bottom_contour00x25_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([10, 32], [10, 28], [10.5, 26.0],steps,3);
	BezConic([10.5, 26.0], [11, 24], [13, 24],steps,3);
	BezConic([13, 24], [16, 24], [16, 32],steps,3);
	BezConic([16, 32], [16, 40], [13, 40],steps,3);
	BezConic([13, 40], [11, 40], [10.5, 38.0],steps,3);
	BezConic([10.5, 38.0], [10, 36], [10, 32],steps,3);
}
}

module OpenSans_bottom_contour00x25_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour00x25(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x25_skeleton();
			OpenSans_bottom_contour00x25_subtractive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x25_additive_curves(steps);
	}
}

module OpenSans_bottom_contour10x25_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[24, 32], [24, 25], [21.0, 21.5], 
		[18, 18], [13, 18], [8, 18], 
		[5.0, 21.5], [2, 25], [2, 32], 
		[2, 46], [13, 46], [18, 46], 
		[21.0, 42.5],[24, 39], ]);
}

module OpenSans_bottom_contour10x25_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour10x25_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([24, 32], [24, 25], [21.0, 21.5],steps,3);
	BezConic([21.0, 21.5], [18, 18], [13, 18],steps,3);
	BezConic([13, 18], [8, 18], [5.0, 21.5],steps,3);
	BezConic([5.0, 21.5], [2, 25], [2, 32],steps,3);
	BezConic([2, 32], [2, 46], [13, 46],steps,3);
	BezConic([13, 46], [18, 46], [21.0, 42.5],steps,3);
	BezConic([21.0, 42.5], [24, 39], [24, 32],steps,3);
}
}

module OpenSans_bottom_contour10x25(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour10x25_skeleton();
			OpenSans_bottom_contour10x25_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour10x25_subtractive_curves(steps);
	}
}

module OpenSans_bottom_contour20x25_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[45, 46], [32.5, 23.0], [20, 0], 
		[16.0, 0.0], [12, 0], [25.0, 23.0], 
		[38, 46],[41.5, 46.0], ]);
}

module OpenSans_bottom_contour20x25_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour20x25_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour20x25(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour20x25_skeleton();
			OpenSans_bottom_contour20x25_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour20x25_subtractive_curves(steps);
	}
}

module OpenSans_bottom_contour30x25_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[42, 14], [42, 10], [42.5, 8.0], 
		[43, 6], [45, 6], [48, 6], 
		[48, 14], [48, 22], [45, 22], 
		[43, 22], [42.5, 20.0], [42, 18], 
		 ]);
}

module OpenSans_bottom_contour30x25_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([42, 14], [42, 10], [42.5, 8.0],steps,3);
	BezConic([42.5, 8.0], [43, 6], [45, 6],steps,3);
	BezConic([45, 6], [48, 6], [48, 14],steps,3);
	BezConic([48, 14], [48, 22], [45, 22],steps,3);
	BezConic([45, 22], [43, 22], [42.5, 20.0],steps,3);
	BezConic([42.5, 20.0], [42, 18], [42, 14],steps,3);
}
}

module OpenSans_bottom_contour30x25_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour30x25(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour30x25_skeleton();
			OpenSans_bottom_contour30x25_subtractive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour30x25_additive_curves(steps);
	}
}

module OpenSans_bottom_contour40x25_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[56, 14], [56, 7], [53.0, 3.0], 
		[50, -1], [45, -1], [40, -1], 
		[37.0, 3.0], [34, 7], [34, 14], 
		[34, 28], [45, 28], [50, 28], 
		[53.0, 24.5],[56, 21], ]);
}

module OpenSans_bottom_contour40x25_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour40x25_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([56, 14], [56, 7], [53.0, 3.0],steps,3);
	BezConic([53.0, 3.0], [50, -1], [45, -1],steps,3);
	BezConic([45, -1], [40, -1], [37.0, 3.0],steps,3);
	BezConic([37.0, 3.0], [34, 7], [34, 14],steps,3);
	BezConic([34, 14], [34, 28], [45, 28],steps,3);
	BezConic([45, 28], [50, 28], [53.0, 24.5],steps,3);
	BezConic([53.0, 24.5], [56, 21], [56, 14],steps,3);
}
}

module OpenSans_bottom_contour40x25(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour40x25_skeleton();
			OpenSans_bottom_contour40x25_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour40x25_subtractive_curves(steps);
	}
}

module OpenSans_bottom_chunk00x25(steps=2) {
	difference() {
		
		scale([1,1,1.1]) OpenSans_bottom_contour00x25(steps);
	}
}

module OpenSans_bottom_chunk10x25(steps=2) {
	difference() {
		OpenSans_bottom_contour10x25(steps);
		
	}
}

module OpenSans_bottom_chunk20x25(steps=2) {
	difference() {
		OpenSans_bottom_contour20x25(steps);
		scale([1,1,1.1]) OpenSans_bottom_contour30x25(steps);
	}
}

module OpenSans_bottom_chunk30x25(steps=2) {
	difference() {
		OpenSans_bottom_contour40x25(steps);
		
	}
}

OpenSans_bottom_bbox0x25=[[2, -1], [56, 46]];

module OpenSans_bottom_letter0x25(detail=2) {
	OpenSans_bottom_chunk00x25(steps=detail);
	OpenSans_bottom_chunk10x25(steps=detail);
	OpenSans_bottom_chunk20x25(steps=detail);
	OpenSans_bottom_chunk30x25(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x26_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[48, 0], [42.0, 0.0], [36, 0], 
		[34.5, 2.0], [33, 4], [27, -1], 
		[19, -1], [12, -1], [7.5, 2.5], 
		[3, 6], [3, 12], [3, 17], 
		[4.5, 20.0], [6, 23], [11, 25], 
		[9, 28], [7.5, 30.5], [6, 33], 
		[6, 36], [6, 41], [10.0, 43.5], 
		[14, 46], [20, 46], [26, 46], 
		[29.5, 43.5], [33, 41], [33, 36], 
		[33, 33], [30.5, 30.0], [28, 27], 
		[24, 24], [28.0, 19.5], [32, 15], 
		[35, 19], [36, 25], [41.0, 25.0], 
		[46, 25], [45, 20], [43.0, 16.0], 
		[41, 12], [39, 9], [43.5, 4.5], 
		 ]);
}

module OpenSans_bottom_contour00x26_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([32, 15], [35, 19], [36, 25],steps,3);
}
}

module OpenSans_bottom_contour00x26_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([33, 4], [27, -1], [19, -1],steps,3);
	BezConic([19, -1], [12, -1], [7.5, 2.5],steps,3);
	BezConic([7.5, 2.5], [3, 6], [3, 12],steps,3);
	BezConic([3, 12], [3, 17], [4.5, 20.0],steps,3);
	BezConic([4.5, 20.0], [6, 23], [11, 25],steps,3);
	BezConic([11, 25], [9, 28], [7.5, 30.5],steps,3);
	BezConic([7.5, 30.5], [6, 33], [6, 36],steps,3);
	BezConic([6, 36], [6, 41], [10.0, 43.5],steps,3);
	BezConic([10.0, 43.5], [14, 46], [20, 46],steps,3);
	BezConic([20, 46], [26, 46], [29.5, 43.5],steps,3);
	BezConic([29.5, 43.5], [33, 41], [33, 36],steps,3);
	BezConic([33, 36], [33, 33], [30.5, 30.0],steps,3);
	BezConic([30.5, 30.0], [28, 27], [24, 24],steps,3);
	BezConic([46, 25], [45, 20], [43.0, 16.0],steps,3);
	BezConic([43.0, 16.0], [41, 12], [39, 9],steps,3);
}
}

module OpenSans_bottom_contour00x26(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x26_skeleton();
			OpenSans_bottom_contour00x26_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x26_subtractive_curves(steps);
	}
}

module OpenSans_bottom_contour10x26_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[13, 13], [13, 11], [15.0, 9.0], 
		[17, 7], [20, 7], [24, 7], 
		[27, 9], [22.0, 14.5], [17, 20], 
		[15, 18], [14.0, 16.5], [13, 15], 
		 ]);
}

module OpenSans_bottom_contour10x26_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([13, 13], [13, 11], [15.0, 9.0],steps,3);
	BezConic([15.0, 9.0], [17, 7], [20, 7],steps,3);
	BezConic([20, 7], [24, 7], [27, 9],steps,3);
	BezConic([17, 20], [15, 18], [14.0, 16.5],steps,3);
	BezConic([14.0, 16.5], [13, 15], [13, 13],steps,3);
}
}

module OpenSans_bottom_contour10x26_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour10x26(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour10x26_skeleton();
			OpenSans_bottom_contour10x26_subtractive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour10x26_additive_curves(steps);
	}
}

module OpenSans_bottom_contour20x26_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[24, 35], [24, 37], [23.0, 38.0], 
		[22, 39], [20, 39], [18, 39], 
		[16.5, 38.0], [15, 37], [15, 35], 
		[15, 32], [18, 29], [21, 31], 
		[22.5, 32.0],[24, 33], ]);
}

module OpenSans_bottom_contour20x26_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([24, 35], [24, 37], [23.0, 38.0],steps,3);
	BezConic([23.0, 38.0], [22, 39], [20, 39],steps,3);
	BezConic([20, 39], [18, 39], [16.5, 38.0],steps,3);
	BezConic([16.5, 38.0], [15, 37], [15, 35],steps,3);
	BezConic([15, 35], [15, 32], [18, 29],steps,3);
	BezConic([18, 29], [21, 31], [22.5, 32.0],steps,3);
	BezConic([22.5, 32.0], [24, 33], [24, 35],steps,3);
}
}

module OpenSans_bottom_contour20x26_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour20x26(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour20x26_skeleton();
			OpenSans_bottom_contour20x26_subtractive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour20x26_additive_curves(steps);
	}
}

module OpenSans_bottom_chunk10x26(steps=2) {
	difference() {
		OpenSans_bottom_contour00x26(steps);
		scale([1,1,1.1]) OpenSans_bottom_contour10x26(steps);
	scale([1,1,1.1]) OpenSans_bottom_contour20x26(steps);
	}
}

OpenSans_bottom_bbox0x26=[[3, -1], [48, 46]];

module OpenSans_bottom_letter0x26(detail=2) {
	OpenSans_bottom_chunk10x26(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x27_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[13, 46], [12.5, 37.5], [12, 29], 
		[8.5, 29.0], [5, 29], [4.5, 37.5], 
		[4, 46],[8.5, 46.0], ]);
}

module OpenSans_bottom_contour00x27_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour00x27_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour00x27(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x27_skeleton();
			OpenSans_bottom_contour00x27_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x27_subtractive_curves(steps);
	}
}

module OpenSans_bottom_chunk10x27(steps=2) {
	difference() {
		OpenSans_bottom_contour00x27(steps);
		
	}
}

OpenSans_bottom_bbox0x27=[[4, 29], [13, 46]];

module OpenSans_bottom_letter0x27(detail=2) {
	OpenSans_bottom_chunk10x27(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x28_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[3, 18], [3, 26], [5.0, 33.0], 
		[7, 40], [12, 46], [16.0, 46.0], 
		[20, 46], [15, 40], [13.0, 32.5], 
		[11, 25], [11, 18], [11, 10], 
		[13.0, 3.0], [15, -4], [20, -10], 
		[16.0, -10.0], [12, -10], [7, -5], 
		[5.0, 2.0],[3, 9], ]);
}

module OpenSans_bottom_contour00x28_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([20, 46], [15, 40], [13.0, 32.5],steps,3);
	BezConic([13.0, 32.5], [11, 25], [11, 18],steps,3);
	BezConic([11, 18], [11, 10], [13.0, 3.0],steps,3);
	BezConic([13.0, 3.0], [15, -4], [20, -10],steps,3);
}
}

module OpenSans_bottom_contour00x28_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([3, 18], [3, 26], [5.0, 33.0],steps,3);
	BezConic([5.0, 33.0], [7, 40], [12, 46],steps,3);
	BezConic([12, -10], [7, -5], [5.0, 2.0],steps,3);
	BezConic([5.0, 2.0], [3, 9], [3, 18],steps,3);
}
}

module OpenSans_bottom_contour00x28(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x28_skeleton();
			OpenSans_bottom_contour00x28_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x28_subtractive_curves(steps);
	}
}

module OpenSans_bottom_chunk10x28(steps=2) {
	difference() {
		OpenSans_bottom_contour00x28(steps);
		
	}
}

OpenSans_bottom_bbox0x28=[[3, -10], [20, 46]];

module OpenSans_bottom_letter0x28(detail=2) {
	OpenSans_bottom_chunk10x28(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x29_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[19, 18], [19, 9], [16.5, 2.0], 
		[14, -5], [10, -10], [6.0, -10.0], 
		[2, -10], [6, -4], [8.5, 3.0], 
		[11, 10], [11, 18], [11, 25], 
		[8.5, 32.5], [6, 40], [2, 46], 
		[6.0, 46.0], [10, 46], [14, 40], 
		[16.5, 33.0],[19, 26], ]);
}

module OpenSans_bottom_contour00x29_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([2, -10], [6, -4], [8.5, 3.0],steps,3);
	BezConic([8.5, 3.0], [11, 10], [11, 18],steps,3);
	BezConic([11, 18], [11, 25], [8.5, 32.5],steps,3);
	BezConic([8.5, 32.5], [6, 40], [2, 46],steps,3);
}
}

module OpenSans_bottom_contour00x29_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([19, 18], [19, 9], [16.5, 2.0],steps,3);
	BezConic([16.5, 2.0], [14, -5], [10, -10],steps,3);
	BezConic([10, 46], [14, 40], [16.5, 33.0],steps,3);
	BezConic([16.5, 33.0], [19, 26], [19, 18],steps,3);
}
}

module OpenSans_bottom_contour00x29(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x29_skeleton();
			OpenSans_bottom_contour00x29_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x29_subtractive_curves(steps);
	}
}

module OpenSans_bottom_chunk10x29(steps=2) {
	difference() {
		OpenSans_bottom_contour00x29(steps);
		
	}
}

OpenSans_bottom_bbox0x29=[[2, -10], [19, 46]];

module OpenSans_bottom_letter0x29(detail=2) {
	OpenSans_bottom_chunk10x29(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x2a_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[22, 49], [21.0, 43.0], [20, 37], 
		[26.0, 38.5], [32, 40], [32.5, 36.5], 
		[33, 33], [27.5, 32.5], [22, 32], 
		[25.5, 27.0], [29, 22], [25.5, 20.5], 
		[22, 19], [19.5, 23.5], [17, 28], 
		[15.0, 23.5], [13, 19], [9.5, 20.5], 
		[6, 22], [9.5, 27.0], [13, 32], 
		[7.5, 32.5], [2, 33], [2.5, 36.5], 
		[3, 40], [9.0, 38.5], [15, 37], 
		[14.0, 43.0], [13, 49], [17.5, 49.0], 
		 ]);
}

module OpenSans_bottom_contour00x2a_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour00x2a_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour00x2a(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x2a_skeleton();
			OpenSans_bottom_contour00x2a_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x2a_subtractive_curves(steps);
	}
}

module OpenSans_bottom_chunk10x2a(steps=2) {
	difference() {
		OpenSans_bottom_contour00x2a(steps);
		
	}
}

OpenSans_bottom_bbox0x2a=[[2, 19], [33, 49]];

module OpenSans_bottom_letter0x2a(detail=2) {
	OpenSans_bottom_chunk10x2a(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x2b_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[15, 19], [9.0, 19.0], [3, 19], 
		[3.0, 22.5], [3, 26], [9.0, 26.0], 
		[15, 26], [15.0, 32.0], [15, 38], 
		[18.5, 38.0], [22, 38], [22.0, 32.0], 
		[22, 26], [28.0, 26.0], [34, 26], 
		[34.0, 22.5], [34, 19], [28.0, 19.0], 
		[22, 19], [22.0, 13.0], [22, 7], 
		[18.5, 7.0], [15, 7], [15.0, 13.0], 
		 ]);
}

module OpenSans_bottom_contour00x2b_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour00x2b_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour00x2b(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x2b_skeleton();
			OpenSans_bottom_contour00x2b_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x2b_subtractive_curves(steps);
	}
}

module OpenSans_bottom_chunk10x2b(steps=2) {
	difference() {
		OpenSans_bottom_contour00x2b(steps);
		
	}
}

OpenSans_bottom_bbox0x2b=[[3, 7], [34, 38]];

module OpenSans_bottom_letter0x2b(detail=2) {
	OpenSans_bottom_chunk10x2b(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x2c_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[14, 7], [13, 0], [9, -8], 
		[5.5, -8.0], [2, -8], [4, 0], 
		[5, 7], [9.5, 7.0], [14, 7], 
		[14.0, 7.0], ]);
}

module OpenSans_bottom_contour00x2c_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([2, -8], [4, 0], [5, 7],steps,3);
}
}

module OpenSans_bottom_contour00x2c_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([14, 7], [13, 0], [9, -8],steps,3);
}
}

module OpenSans_bottom_contour00x2c(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x2c_skeleton();
			OpenSans_bottom_contour00x2c_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x2c_subtractive_curves(steps);
	}
}

module OpenSans_bottom_chunk10x2c(steps=2) {
	difference() {
		OpenSans_bottom_contour00x2c(steps);
		
	}
}

OpenSans_bottom_bbox0x2c=[[2, -8], [14, 7]];

module OpenSans_bottom_letter0x2c(detail=2) {
	OpenSans_bottom_chunk10x2c(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x2d_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[2, 13], [2.0, 17.0], [2, 21], 
		[10.5, 21.0], [19, 21], [19.0, 17.0], 
		[19, 13],[10.5, 13.0], ]);
}

module OpenSans_bottom_contour00x2d_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour00x2d_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour00x2d(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x2d_skeleton();
			OpenSans_bottom_contour00x2d_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x2d_subtractive_curves(steps);
	}
}

module OpenSans_bottom_chunk10x2d(steps=2) {
	difference() {
		OpenSans_bottom_contour00x2d(steps);
		
	}
}

OpenSans_bottom_bbox0x2d=[[2, 13], [19, 21]];

module OpenSans_bottom_letter0x2d(detail=2) {
	OpenSans_bottom_chunk10x2d(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x2e_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[4, 4], [4, 7], [5.0, 8.5], 
		[6, 10], [9, 10], [12, 10], 
		[13.5, 8.5], [15, 7], [15, 4], 
		[15, 2], [13.5, 0.5], [12, -1], 
		[9, -1], [7, -1], [5.5, 0.5], 
		[4, 2], ]);
}

module OpenSans_bottom_contour00x2e_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour00x2e_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([4, 4], [4, 7], [5.0, 8.5],steps,3);
	BezConic([5.0, 8.5], [6, 10], [9, 10],steps,3);
	BezConic([9, 10], [12, 10], [13.5, 8.5],steps,3);
	BezConic([13.5, 8.5], [15, 7], [15, 4],steps,3);
	BezConic([15, 4], [15, 2], [13.5, 0.5],steps,3);
	BezConic([13.5, 0.5], [12, -1], [9, -1],steps,3);
	BezConic([9, -1], [7, -1], [5.5, 0.5],steps,3);
	BezConic([5.5, 0.5], [4, 2], [4, 4],steps,3);
}
}

module OpenSans_bottom_contour00x2e(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x2e_skeleton();
			OpenSans_bottom_contour00x2e_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x2e_subtractive_curves(steps);
	}
}

module OpenSans_bottom_chunk10x2e(steps=2) {
	difference() {
		OpenSans_bottom_contour00x2e(steps);
		
	}
}

OpenSans_bottom_bbox0x2e=[[4, -1], [15, 10]];

module OpenSans_bottom_letter0x2e(detail=2) {
	OpenSans_bottom_chunk10x2e(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x2f_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[26, 46], [17.5, 23.0], [9, 0], 
		[4.5, 0.0], [0, 0], [8.5, 23.0], 
		[17, 46],[21.5, 46.0], ]);
}

module OpenSans_bottom_contour00x2f_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour00x2f_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour00x2f(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x2f_skeleton();
			OpenSans_bottom_contour00x2f_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x2f_subtractive_curves(steps);
	}
}

module OpenSans_bottom_chunk10x2f(steps=2) {
	difference() {
		OpenSans_bottom_contour00x2f(steps);
		
	}
}

OpenSans_bottom_bbox0x2f=[[0, 0], [26, 46]];

module OpenSans_bottom_letter0x2f(detail=2) {
	OpenSans_bottom_chunk10x2f(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x30_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[34, 23], [34, 11], [30.0, 5.0], 
		[26, -1], [18, -1], [10, -1], 
		[6.0, 5.0], [2, 11], [2, 23], 
		[2, 35], [6.0, 40.5], [10, 46], 
		[18, 46], [26, 46], [30.0, 40.0], 
		[34, 34], ]);
}

module OpenSans_bottom_contour00x30_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour00x30_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([34, 23], [34, 11], [30.0, 5.0],steps,3);
	BezConic([30.0, 5.0], [26, -1], [18, -1],steps,3);
	BezConic([18, -1], [10, -1], [6.0, 5.0],steps,3);
	BezConic([6.0, 5.0], [2, 11], [2, 23],steps,3);
	BezConic([2, 23], [2, 35], [6.0, 40.5],steps,3);
	BezConic([6.0, 40.5], [10, 46], [18, 46],steps,3);
	BezConic([18, 46], [26, 46], [30.0, 40.0],steps,3);
	BezConic([30.0, 40.0], [34, 34], [34, 23],steps,3);
}
}

module OpenSans_bottom_contour00x30(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x30_skeleton();
			OpenSans_bottom_contour00x30_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x30_subtractive_curves(steps);
	}
}

module OpenSans_bottom_contour10x30_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[12, 23], [12, 14], [13.5, 10.5], 
		[15, 7], [18, 7], [22, 7], 
		[23.5, 11.0], [25, 15], [25, 23], 
		[25, 31], [23.5, 35.0], [22, 39], 
		[18, 39], [15, 39], [13.5, 35.0], 
		[12, 31], ]);
}

module OpenSans_bottom_contour10x30_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([12, 23], [12, 14], [13.5, 10.5],steps,3);
	BezConic([13.5, 10.5], [15, 7], [18, 7],steps,3);
	BezConic([18, 7], [22, 7], [23.5, 11.0],steps,3);
	BezConic([23.5, 11.0], [25, 15], [25, 23],steps,3);
	BezConic([25, 23], [25, 31], [23.5, 35.0],steps,3);
	BezConic([23.5, 35.0], [22, 39], [18, 39],steps,3);
	BezConic([18, 39], [15, 39], [13.5, 35.0],steps,3);
	BezConic([13.5, 35.0], [12, 31], [12, 23],steps,3);
}
}

module OpenSans_bottom_contour10x30_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour10x30(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour10x30_skeleton();
			OpenSans_bottom_contour10x30_subtractive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour10x30_additive_curves(steps);
	}
}

module OpenSans_bottom_chunk10x30(steps=2) {
	difference() {
		OpenSans_bottom_contour00x30(steps);
		scale([1,1,1.1]) OpenSans_bottom_contour10x30(steps);
	}
}

OpenSans_bottom_bbox0x30=[[2, -1], [34, 46]];

module OpenSans_bottom_letter0x30(detail=2) {
	OpenSans_bottom_chunk10x30(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x31_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[26, 0], [21.5, 0.0], [17, 0], 
		[17.0, 13.0], [17, 26], [17.0, 28.5], 
		[17, 31], [17.0, 33.5], [17, 36], 
		[15, 33], [14, 32], [11.0, 30.0], 
		[8, 28], [6.0, 31.0], [4, 34], 
		[11.5, 40.0], [19, 46], [22.5, 46.0], 
		[26, 46],[26.0, 23.0], ]);
}

module OpenSans_bottom_contour00x31_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour00x31_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([17, 36], [15, 33], [14, 32],steps,3);
}
}

module OpenSans_bottom_contour00x31(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x31_skeleton();
			OpenSans_bottom_contour00x31_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x31_subtractive_curves(steps);
	}
}

module OpenSans_bottom_chunk10x31(steps=2) {
	difference() {
		OpenSans_bottom_contour00x31(steps);
		
	}
}

OpenSans_bottom_bbox0x31=[[4, 0], [26, 46]];

module OpenSans_bottom_letter0x31(detail=2) {
	OpenSans_bottom_chunk10x31(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x32_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[35, 0], [19.0, 0.0], [3, 0], 
		[3.0, 3.5], [3, 7], [8.5, 12.5], 
		[14, 18], [19, 24], [20.5, 26.0], 
		[22, 28], [23.0, 29.5], [24, 31], 
		[24, 33], [24, 36], [22.5, 37.0], 
		[21, 38], [18, 38], [15, 38], 
		[12.5, 37.0], [10, 36], [8, 34], 
		[5.0, 37.0], [2, 40], [6, 43], 
		[8.0, 44.0], [10, 45], [13.0, 45.5], 
		[16, 46], [19, 46], [23, 46], 
		[26.5, 44.5], [30, 43], [31.5, 40.5], 
		[33, 38], [33, 34], [33, 31], 
		[32.0, 28.0], [31, 25], [28.5, 22.0], 
		[26, 19], [20, 14], [17.5, 11.5], 
		[15, 9], [15.0, 8.5], [15, 8], 
		[25.0, 8.0], [35, 8], [35.0, 4.0], 
		 ]);
}

module OpenSans_bottom_contour00x32_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([14, 18], [19, 24], [20.5, 26.0],steps,3);
	BezConic([20.5, 26.0], [22, 28], [23.0, 29.5],steps,3);
	BezConic([23.0, 29.5], [24, 31], [24, 33],steps,3);
	BezConic([24, 33], [24, 36], [22.5, 37.0],steps,3);
	BezConic([22.5, 37.0], [21, 38], [18, 38],steps,3);
	BezConic([18, 38], [15, 38], [12.5, 37.0],steps,3);
	BezConic([12.5, 37.0], [10, 36], [8, 34],steps,3);
}
}

module OpenSans_bottom_contour00x32_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([2, 40], [6, 43], [8.0, 44.0],steps,3);
	BezConic([8.0, 44.0], [10, 45], [13.0, 45.5],steps,3);
	BezConic([13.0, 45.5], [16, 46], [19, 46],steps,3);
	BezConic([19, 46], [23, 46], [26.5, 44.5],steps,3);
	BezConic([26.5, 44.5], [30, 43], [31.5, 40.5],steps,3);
	BezConic([31.5, 40.5], [33, 38], [33, 34],steps,3);
	BezConic([33, 34], [33, 31], [32.0, 28.0],steps,3);
	BezConic([32.0, 28.0], [31, 25], [28.5, 22.0],steps,3);
	BezConic([28.5, 22.0], [26, 19], [20, 14],steps,3);
}
}

module OpenSans_bottom_contour00x32(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x32_skeleton();
			OpenSans_bottom_contour00x32_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x32_subtractive_curves(steps);
	}
}

module OpenSans_bottom_chunk10x32(steps=2) {
	difference() {
		OpenSans_bottom_contour00x32(steps);
		
	}
}

OpenSans_bottom_bbox0x32=[[2, 0], [35, 46]];

module OpenSans_bottom_letter0x32(detail=2) {
	OpenSans_bottom_chunk10x32(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x33_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[33, 35], [33, 31], [30.5, 28.0], 
		[28, 25], [23, 24], [23.0, 24.0], 
		[23, 24], [28, 23], [31.0, 20.5], 
		[34, 18], [34, 13], [34, 7], 
		[29.5, 3.0], [25, -1], [16, -1], 
		[8, -1], [2, 2], [2.0, 6.0], 
		[2, 10], [5, 9], [8.0, 8.0], 
		[11, 7], [15, 7], [19, 7], 
		[21.5, 8.5], [24, 10], [24, 14], 
		[24, 17], [21.5, 18.5], [19, 20], 
		[13, 20], [11.0, 20.0], [9, 20], 
		[9.0, 23.5], [9, 27], [11.0, 27.0], 
		[13, 27], [18, 27], [20.5, 28.5], 
		[23, 30], [23, 33], [23, 39], 
		[17, 39], [14, 39], [12.0, 38.0], 
		[10, 37], [7, 35], [5.0, 38.5], 
		[3, 42], [9, 46], [17, 46], 
		[25, 46], [29.0, 43.5], [33, 41], 
		 ]);
}

module OpenSans_bottom_contour00x33_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([2, 10], [5, 9], [8.0, 8.0],steps,3);
	BezConic([8.0, 8.0], [11, 7], [15, 7],steps,3);
	BezConic([15, 7], [19, 7], [21.5, 8.5],steps,3);
	BezConic([21.5, 8.5], [24, 10], [24, 14],steps,3);
	BezConic([24, 14], [24, 17], [21.5, 18.5],steps,3);
	BezConic([21.5, 18.5], [19, 20], [13, 20],steps,3);
	BezConic([13, 27], [18, 27], [20.5, 28.5],steps,3);
	BezConic([20.5, 28.5], [23, 30], [23, 33],steps,3);
	BezConic([23, 33], [23, 39], [17, 39],steps,3);
	BezConic([17, 39], [14, 39], [12.0, 38.0],steps,3);
	BezConic([12.0, 38.0], [10, 37], [7, 35],steps,3);
}
}

module OpenSans_bottom_contour00x33_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([33, 35], [33, 31], [30.5, 28.0],steps,3);
	BezConic([30.5, 28.0], [28, 25], [23, 24],steps,3);
	BezConic([23, 24], [28, 23], [31.0, 20.5],steps,3);
	BezConic([31.0, 20.5], [34, 18], [34, 13],steps,3);
	BezConic([34, 13], [34, 7], [29.5, 3.0],steps,3);
	BezConic([29.5, 3.0], [25, -1], [16, -1],steps,3);
	BezConic([16, -1], [8, -1], [2, 2],steps,3);
	BezConic([3, 42], [9, 46], [17, 46],steps,3);
	BezConic([17, 46], [25, 46], [29.0, 43.5],steps,3);
	BezConic([29.0, 43.5], [33, 41], [33, 35],steps,3);
}
}

module OpenSans_bottom_contour00x33(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x33_skeleton();
			OpenSans_bottom_contour00x33_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x33_subtractive_curves(steps);
	}
}

module OpenSans_bottom_chunk10x33(steps=2) {
	difference() {
		OpenSans_bottom_contour00x33(steps);
		
	}
}

OpenSans_bottom_bbox0x33=[[2, -1], [34, 46]];

module OpenSans_bottom_letter0x33(detail=2) {
	OpenSans_bottom_chunk10x33(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x34_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[36, 9], [33.0, 9.0], [30, 9], 
		[30.0, 4.5], [30, 0], [25.5, 0.0], 
		[21, 0], [21.0, 4.5], [21, 9], 
		[11.0, 9.0], [1, 9], [1.0, 12.5], 
		[1, 16], [11.0, 31.0], [21, 46], 
		[25.5, 46.0], [30, 46], [30.0, 31.5], 
		[30, 17], [33.0, 17.0], [36, 17], 
		[36.0, 13.0], ]);
}

module OpenSans_bottom_contour00x34_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour00x34_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour00x34(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x34_skeleton();
			OpenSans_bottom_contour00x34_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x34_subtractive_curves(steps);
	}
}

module OpenSans_bottom_contour10x34_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[21, 17], [21.0, 21.0], [21, 25], 
		[21, 27], [21.0, 30.5], [21, 34], 
		[21, 35], [21.0, 35.0], [21, 35], 
		[20, 32], [18, 30], [14.0, 23.5], 
		[10, 17],[15.5, 17.0], ]);
}

module OpenSans_bottom_contour10x34_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([21, 25], [21, 27], [21.0, 30.5],steps,3);
	BezConic([21.0, 30.5], [21, 34], [21, 35],steps,3);
}
}

module OpenSans_bottom_contour10x34_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([21, 35], [20, 32], [18, 30],steps,3);
}
}

module OpenSans_bottom_contour10x34(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour10x34_skeleton();
			OpenSans_bottom_contour10x34_subtractive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour10x34_additive_curves(steps);
	}
}

module OpenSans_bottom_chunk10x34(steps=2) {
	difference() {
		OpenSans_bottom_contour00x34(steps);
		scale([1,1,1.1]) OpenSans_bottom_contour10x34(steps);
	}
}

OpenSans_bottom_bbox0x34=[[1, 0], [36, 46]];

module OpenSans_bottom_letter0x34(detail=2) {
	OpenSans_bottom_chunk10x34(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x35_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[19, 29], [26, 29], [30.0, 25.5], 
		[34, 22], [34, 15], [34, 8], 
		[29.0, 3.5], [24, -1], [15, -1], 
		[8, -1], [3, 2], [3.0, 6.0], 
		[3, 10], [6, 9], [9.0, 8.0], 
		[12, 7], [15, 7], [24, 7], 
		[24, 14], [24, 21], [15, 21], 
		[13, 21], [11.0, 21.0], [9, 21], 
		[8, 20], [6.0, 21.0], [4, 22], 
		[5.0, 34.0], [6, 46], [18.5, 46.0], 
		[31, 46], [31.0, 42.0], [31, 38], 
		[22.5, 38.0], [14, 38], [13.5, 33.5], 
		[13, 29], [13.5, 29.0], [14, 29], 
		[16, 29], ]);
}

module OpenSans_bottom_contour00x35_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([3, 10], [6, 9], [9.0, 8.0],steps,3);
	BezConic([9.0, 8.0], [12, 7], [15, 7],steps,3);
	BezConic([15, 7], [24, 7], [24, 14],steps,3);
	BezConic([24, 14], [24, 21], [15, 21],steps,3);
	BezConic([15, 21], [13, 21], [11.0, 21.0],steps,3);
	BezConic([11.0, 21.0], [9, 21], [8, 20],steps,3);
	BezConic([14, 29], [16, 29], [19, 29],steps,3);
}
}

module OpenSans_bottom_contour00x35_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([19, 29], [26, 29], [30.0, 25.5],steps,3);
	BezConic([30.0, 25.5], [34, 22], [34, 15],steps,3);
	BezConic([34, 15], [34, 8], [29.0, 3.5],steps,3);
	BezConic([29.0, 3.5], [24, -1], [15, -1],steps,3);
	BezConic([15, -1], [8, -1], [3, 2],steps,3);
}
}

module OpenSans_bottom_contour00x35(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x35_skeleton();
			OpenSans_bottom_contour00x35_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x35_subtractive_curves(steps);
	}
}

module OpenSans_bottom_chunk10x35(steps=2) {
	difference() {
		OpenSans_bottom_contour00x35(steps);
		
	}
}

OpenSans_bottom_bbox0x35=[[3, -1], [34, 46]];

module OpenSans_bottom_letter0x35(detail=2) {
	OpenSans_bottom_chunk10x35(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x36_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[2, 19], [2, 33], [8.0, 39.5], 
		[14, 46], [25, 46], [29, 46], 
		[31, 46], [31.0, 42.0], [31, 38], 
		[29, 39], [26, 39], [21, 39], 
		[18.0, 37.5], [15, 36], [13.0, 33.0], 
		[11, 30], [11, 24], [11.5, 24.0], 
		[12, 24], [15, 30], [21, 30], 
		[28, 30], [31.5, 26.0], [35, 22], 
		[35, 15], [35, 8], [30.5, 3.5], 
		[26, -1], [19, -1], [14, -1], 
		[10.0, 1.5], [6, 4], [4.0, 8.5], 
		[2, 13], ]);
}

module OpenSans_bottom_contour00x36_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([25, 46], [29, 46], [31, 46],steps,3);
	BezConic([31, 38], [29, 39], [26, 39],steps,3);
	BezConic([26, 39], [21, 39], [18.0, 37.5],steps,3);
	BezConic([18.0, 37.5], [15, 36], [13.0, 33.0],steps,3);
	BezConic([13.0, 33.0], [11, 30], [11, 24],steps,3);
}
}

module OpenSans_bottom_contour00x36_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([2, 19], [2, 33], [8.0, 39.5],steps,3);
	BezConic([8.0, 39.5], [14, 46], [25, 46],steps,3);
	BezConic([12, 24], [15, 30], [21, 30],steps,3);
	BezConic([21, 30], [28, 30], [31.5, 26.0],steps,3);
	BezConic([31.5, 26.0], [35, 22], [35, 15],steps,3);
	BezConic([35, 15], [35, 8], [30.5, 3.5],steps,3);
	BezConic([30.5, 3.5], [26, -1], [19, -1],steps,3);
	BezConic([19, -1], [14, -1], [10.0, 1.5],steps,3);
	BezConic([10.0, 1.5], [6, 4], [4.0, 8.5],steps,3);
	BezConic([4.0, 8.5], [2, 13], [2, 19],steps,3);
}
}

module OpenSans_bottom_contour00x36(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x36_skeleton();
			OpenSans_bottom_contour00x36_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x36_subtractive_curves(steps);
	}
}

module OpenSans_bottom_contour10x36_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[19, 7], [22, 7], [23.5, 9.0], 
		[25, 11], [25, 15], [25, 18], 
		[23.5, 20.0], [22, 22], [19, 22], 
		[16, 22], [14.0, 20.0], [12, 18], 
		[12, 16], [12, 12], [14.0, 9.5], 
		[16, 7], ]);
}

module OpenSans_bottom_contour10x36_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([19, 7], [22, 7], [23.5, 9.0],steps,3);
	BezConic([23.5, 9.0], [25, 11], [25, 15],steps,3);
	BezConic([25, 15], [25, 18], [23.5, 20.0],steps,3);
	BezConic([23.5, 20.0], [22, 22], [19, 22],steps,3);
	BezConic([19, 22], [16, 22], [14.0, 20.0],steps,3);
	BezConic([14.0, 20.0], [12, 18], [12, 16],steps,3);
	BezConic([12, 16], [12, 12], [14.0, 9.5],steps,3);
	BezConic([14.0, 9.5], [16, 7], [19, 7],steps,3);
}
}

module OpenSans_bottom_contour10x36_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour10x36(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour10x36_skeleton();
			OpenSans_bottom_contour10x36_subtractive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour10x36_additive_curves(steps);
	}
}

module OpenSans_bottom_chunk10x36(steps=2) {
	difference() {
		OpenSans_bottom_contour00x36(steps);
		scale([1,1,1.1]) OpenSans_bottom_contour10x36(steps);
	}
}

OpenSans_bottom_bbox0x36=[[2, -1], [35, 46]];

module OpenSans_bottom_letter0x36(detail=2) {
	OpenSans_bottom_chunk10x36(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x37_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[7, 0], [15.5, 19.0], [24, 38], 
		[13.0, 38.0], [2, 38], [2.0, 42.0], 
		[2, 46], [18.5, 46.0], [35, 46], 
		[35.0, 43.0], [35, 40], [26.0, 20.0], 
		[17, 0],[12.0, 0.0], ]);
}

module OpenSans_bottom_contour00x37_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour00x37_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour00x37(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x37_skeleton();
			OpenSans_bottom_contour00x37_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x37_subtractive_curves(steps);
	}
}

module OpenSans_bottom_chunk10x37(steps=2) {
	difference() {
		OpenSans_bottom_contour00x37(steps);
		
	}
}

OpenSans_bottom_bbox0x37=[[2, 0], [35, 46]];

module OpenSans_bottom_letter0x37(detail=2) {
	OpenSans_bottom_chunk10x37(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x38_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[18, 46], [25, 46], [29.0, 43.0], 
		[33, 40], [33, 35], [33, 32], 
		[31.0, 29.0], [29, 26], [25, 24], 
		[30, 21], [32.0, 18.0], [34, 15], 
		[34, 12], [34, 6], [30.0, 2.5], 
		[26, -1], [18, -1], [11, -1], 
		[6.5, 2.5], [2, 6], [2, 12], 
		[2, 16], [4.0, 19.0], [6, 22], 
		[11, 24], [7, 26], [5.5, 29.0], 
		[4, 32], [4, 35], [4, 40], 
		[8.0, 43.0],[12, 46], ]);
}

module OpenSans_bottom_contour00x38_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour00x38_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([18, 46], [25, 46], [29.0, 43.0],steps,3);
	BezConic([29.0, 43.0], [33, 40], [33, 35],steps,3);
	BezConic([33, 35], [33, 32], [31.0, 29.0],steps,3);
	BezConic([31.0, 29.0], [29, 26], [25, 24],steps,3);
	BezConic([25, 24], [30, 21], [32.0, 18.0],steps,3);
	BezConic([32.0, 18.0], [34, 15], [34, 12],steps,3);
	BezConic([34, 12], [34, 6], [30.0, 2.5],steps,3);
	BezConic([30.0, 2.5], [26, -1], [18, -1],steps,3);
	BezConic([18, -1], [11, -1], [6.5, 2.5],steps,3);
	BezConic([6.5, 2.5], [2, 6], [2, 12],steps,3);
	BezConic([2, 12], [2, 16], [4.0, 19.0],steps,3);
	BezConic([4.0, 19.0], [6, 22], [11, 24],steps,3);
	BezConic([11, 24], [7, 26], [5.5, 29.0],steps,3);
	BezConic([5.5, 29.0], [4, 32], [4, 35],steps,3);
	BezConic([4, 35], [4, 40], [8.0, 43.0],steps,3);
	BezConic([8.0, 43.0], [12, 46], [18, 46],steps,3);
}
}

module OpenSans_bottom_contour00x38(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x38_skeleton();
			OpenSans_bottom_contour00x38_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x38_subtractive_curves(steps);
	}
}

module OpenSans_bottom_contour10x38_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[11, 12], [11, 9], [13.0, 7.5], 
		[15, 6], [18, 6], [22, 6], 
		[23.5, 8.0], [25, 10], [25, 12], 
		[25, 14], [23.5, 16.0], [22, 18], 
		[18, 20],[11, 17], ]);
}

module OpenSans_bottom_contour10x38_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([11, 12], [11, 9], [13.0, 7.5],steps,3);
	BezConic([13.0, 7.5], [15, 6], [18, 6],steps,3);
	BezConic([18, 6], [22, 6], [23.5, 8.0],steps,3);
	BezConic([23.5, 8.0], [25, 10], [25, 12],steps,3);
	BezConic([25, 12], [25, 14], [23.5, 16.0],steps,3);
	BezConic([23.5, 16.0], [22, 18], [18, 20],steps,3);
	BezConic([18, 20], [11, 17], [11, 12],steps,3);
}
}

module OpenSans_bottom_contour10x38_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour10x38(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour10x38_skeleton();
			OpenSans_bottom_contour10x38_subtractive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour10x38_additive_curves(steps);
	}
}

module OpenSans_bottom_contour20x38_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[18, 39], [16, 39], [14.5, 38.0], 
		[13, 37], [13, 35], [13, 33], 
		[14.0, 31.5], [15, 30], [18, 28], 
		[21, 30], [22.5, 31.5], [24, 33], 
		[24, 35], [24, 37], [22.5, 38.0], 
		[21, 39], ]);
}

module OpenSans_bottom_contour20x38_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([18, 39], [16, 39], [14.5, 38.0],steps,3);
	BezConic([14.5, 38.0], [13, 37], [13, 35],steps,3);
	BezConic([13, 35], [13, 33], [14.0, 31.5],steps,3);
	BezConic([14.0, 31.5], [15, 30], [18, 28],steps,3);
	BezConic([18, 28], [21, 30], [22.5, 31.5],steps,3);
	BezConic([22.5, 31.5], [24, 33], [24, 35],steps,3);
	BezConic([24, 35], [24, 37], [22.5, 38.0],steps,3);
	BezConic([22.5, 38.0], [21, 39], [18, 39],steps,3);
}
}

module OpenSans_bottom_contour20x38_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour20x38(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour20x38_skeleton();
			OpenSans_bottom_contour20x38_subtractive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour20x38_additive_curves(steps);
	}
}

module OpenSans_bottom_chunk10x38(steps=2) {
	difference() {
		OpenSans_bottom_contour00x38(steps);
		scale([1,1,1.1]) OpenSans_bottom_contour10x38(steps);
	scale([1,1,1.1]) OpenSans_bottom_contour20x38(steps);
	}
}

OpenSans_bottom_bbox0x38=[[2, -1], [34, 46]];

module OpenSans_bottom_letter0x38(detail=2) {
	OpenSans_bottom_chunk10x38(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x39_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[34, 26], [34, 13], [28.5, 6.0], 
		[23, -1], [11, -1], [7, -1], 
		[5, 0], [5.0, 4.0], [5, 8], 
		[8, 7], [11, 7], [16, 7], 
		[19.0, 8.5], [22, 10], [23.5, 13.0], 
		[25, 16], [25, 21], [25.0, 21.0], 
		[25, 21], [23, 18], [20.5, 17.0], 
		[18, 16], [15, 16], [9, 16], 
		[5.5, 20.0], [2, 24], [2, 30], 
		[2, 38], [6.0, 42.0], [10, 46], 
		[18, 46], [23, 46], [26.5, 43.5], 
		[30, 41], [32.0, 36.5], [34, 32], 
		 ]);
}

module OpenSans_bottom_contour00x39_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([5, 8], [8, 7], [11, 7],steps,3);
	BezConic([11, 7], [16, 7], [19.0, 8.5],steps,3);
	BezConic([19.0, 8.5], [22, 10], [23.5, 13.0],steps,3);
	BezConic([23.5, 13.0], [25, 16], [25, 21],steps,3);
}
}

module OpenSans_bottom_contour00x39_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([34, 26], [34, 13], [28.5, 6.0],steps,3);
	BezConic([28.5, 6.0], [23, -1], [11, -1],steps,3);
	BezConic([11, -1], [7, -1], [5, 0],steps,3);
	BezConic([25, 21], [23, 18], [20.5, 17.0],steps,3);
	BezConic([20.5, 17.0], [18, 16], [15, 16],steps,3);
	BezConic([15, 16], [9, 16], [5.5, 20.0],steps,3);
	BezConic([5.5, 20.0], [2, 24], [2, 30],steps,3);
	BezConic([2, 30], [2, 38], [6.0, 42.0],steps,3);
	BezConic([6.0, 42.0], [10, 46], [18, 46],steps,3);
	BezConic([18, 46], [23, 46], [26.5, 43.5],steps,3);
	BezConic([26.5, 43.5], [30, 41], [32.0, 36.5],steps,3);
	BezConic([32.0, 36.5], [34, 32], [34, 26],steps,3);
}
}

module OpenSans_bottom_contour00x39(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x39_skeleton();
			OpenSans_bottom_contour00x39_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x39_subtractive_curves(steps);
	}
}

module OpenSans_bottom_contour10x39_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[18, 38], [15, 38], [13.0, 36.0], 
		[11, 34], [11, 30], [11, 27], 
		[12.5, 25.0], [14, 23], [18, 23], 
		[21, 23], [23.0, 25.0], [25, 27], 
		[25, 30], [25, 33], [23.0, 35.5], 
		[21, 38], ]);
}

module OpenSans_bottom_contour10x39_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([18, 38], [15, 38], [13.0, 36.0],steps,3);
	BezConic([13.0, 36.0], [11, 34], [11, 30],steps,3);
	BezConic([11, 30], [11, 27], [12.5, 25.0],steps,3);
	BezConic([12.5, 25.0], [14, 23], [18, 23],steps,3);
	BezConic([18, 23], [21, 23], [23.0, 25.0],steps,3);
	BezConic([23.0, 25.0], [25, 27], [25, 30],steps,3);
	BezConic([25, 30], [25, 33], [23.0, 35.5],steps,3);
	BezConic([23.0, 35.5], [21, 38], [18, 38],steps,3);
}
}

module OpenSans_bottom_contour10x39_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour10x39(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour10x39_skeleton();
			OpenSans_bottom_contour10x39_subtractive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour10x39_additive_curves(steps);
	}
}

module OpenSans_bottom_chunk10x39(steps=2) {
	difference() {
		OpenSans_bottom_contour00x39(steps);
		scale([1,1,1.1]) OpenSans_bottom_contour10x39(steps);
	}
}

OpenSans_bottom_bbox0x39=[[2, -1], [34, 46]];

module OpenSans_bottom_letter0x39(detail=2) {
	OpenSans_bottom_chunk10x39(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x3a_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[4, 4], [4, 7], [5.0, 8.5], 
		[6, 10], [9, 10], [12, 10], 
		[13.5, 8.5], [15, 7], [15, 4], 
		[15, 2], [13.5, 0.5], [12, -1], 
		[9, -1], [7, -1], [5.5, 0.5], 
		[4, 2], ]);
}

module OpenSans_bottom_contour00x3a_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour00x3a_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([4, 4], [4, 7], [5.0, 8.5],steps,3);
	BezConic([5.0, 8.5], [6, 10], [9, 10],steps,3);
	BezConic([9, 10], [12, 10], [13.5, 8.5],steps,3);
	BezConic([13.5, 8.5], [15, 7], [15, 4],steps,3);
	BezConic([15, 4], [15, 2], [13.5, 0.5],steps,3);
	BezConic([13.5, 0.5], [12, -1], [9, -1],steps,3);
	BezConic([9, -1], [7, -1], [5.5, 0.5],steps,3);
	BezConic([5.5, 0.5], [4, 2], [4, 4],steps,3);
}
}

module OpenSans_bottom_contour00x3a(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x3a_skeleton();
			OpenSans_bottom_contour00x3a_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x3a_subtractive_curves(steps);
	}
}

module OpenSans_bottom_contour10x3a_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[4, 30], [4, 33], [5.0, 34.5], 
		[6, 36], [9, 36], [12, 36], 
		[13.5, 34.5], [15, 33], [15, 30], 
		[15, 28], [13.5, 26.5], [12, 25], 
		[9, 25], [7, 25], [5.5, 26.5], 
		[4, 28], ]);
}

module OpenSans_bottom_contour10x3a_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour10x3a_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([4, 30], [4, 33], [5.0, 34.5],steps,3);
	BezConic([5.0, 34.5], [6, 36], [9, 36],steps,3);
	BezConic([9, 36], [12, 36], [13.5, 34.5],steps,3);
	BezConic([13.5, 34.5], [15, 33], [15, 30],steps,3);
	BezConic([15, 30], [15, 28], [13.5, 26.5],steps,3);
	BezConic([13.5, 26.5], [12, 25], [9, 25],steps,3);
	BezConic([9, 25], [7, 25], [5.5, 26.5],steps,3);
	BezConic([5.5, 26.5], [4, 28], [4, 30],steps,3);
}
}

module OpenSans_bottom_contour10x3a(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour10x3a_skeleton();
			OpenSans_bottom_contour10x3a_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour10x3a_subtractive_curves(steps);
	}
}

module OpenSans_bottom_chunk10x3a(steps=2) {
	difference() {
		OpenSans_bottom_contour00x3a(steps);
		
	}
}

module OpenSans_bottom_chunk20x3a(steps=2) {
	difference() {
		OpenSans_bottom_contour10x3a(steps);
		
	}
}

OpenSans_bottom_bbox0x3a=[[4, -1], [15, 36]];

module OpenSans_bottom_letter0x3a(detail=2) {
	OpenSans_bottom_chunk10x3a(steps=detail);
	OpenSans_bottom_chunk20x3a(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x3b_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[14, 7], [14.0, 7.0], [14, 7], 
		[13, 0], [9, -8], [5.5, -8.0], 
		[2, -8], [4, 0], [5, 7], 
		[9.5, 7.0], ]);
}

module OpenSans_bottom_contour00x3b_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([2, -8], [4, 0], [5, 7],steps,3);
}
}

module OpenSans_bottom_contour00x3b_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([14, 7], [13, 0], [9, -8],steps,3);
}
}

module OpenSans_bottom_contour00x3b(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x3b_skeleton();
			OpenSans_bottom_contour00x3b_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x3b_subtractive_curves(steps);
	}
}

module OpenSans_bottom_contour10x3b_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[4, 30], [4, 33], [5.0, 34.5], 
		[6, 36], [9, 36], [12, 36], 
		[13.5, 34.5], [15, 33], [15, 30], 
		[15, 28], [13.5, 26.5], [12, 25], 
		[9, 25], [7, 25], [5.5, 26.5], 
		[4, 28], ]);
}

module OpenSans_bottom_contour10x3b_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour10x3b_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([4, 30], [4, 33], [5.0, 34.5],steps,3);
	BezConic([5.0, 34.5], [6, 36], [9, 36],steps,3);
	BezConic([9, 36], [12, 36], [13.5, 34.5],steps,3);
	BezConic([13.5, 34.5], [15, 33], [15, 30],steps,3);
	BezConic([15, 30], [15, 28], [13.5, 26.5],steps,3);
	BezConic([13.5, 26.5], [12, 25], [9, 25],steps,3);
	BezConic([9, 25], [7, 25], [5.5, 26.5],steps,3);
	BezConic([5.5, 26.5], [4, 28], [4, 30],steps,3);
}
}

module OpenSans_bottom_contour10x3b(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour10x3b_skeleton();
			OpenSans_bottom_contour10x3b_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour10x3b_subtractive_curves(steps);
	}
}

module OpenSans_bottom_chunk10x3b(steps=2) {
	difference() {
		OpenSans_bottom_contour00x3b(steps);
		
	}
}

module OpenSans_bottom_chunk20x3b(steps=2) {
	difference() {
		OpenSans_bottom_contour10x3b(steps);
		
	}
}

OpenSans_bottom_bbox0x3b=[[2, -8], [15, 36]];

module OpenSans_bottom_letter0x3b(detail=2) {
	OpenSans_bottom_chunk10x3b(steps=detail);
	OpenSans_bottom_chunk20x3b(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x3c_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[34, 6], [18.5, 13.0], [3, 20], 
		[3.0, 22.5], [3, 25], [18.5, 32.5], 
		[34, 40], [34.0, 36.5], [34, 33], 
		[23.0, 28.0], [12, 23], [23.0, 18.5], 
		[34, 14],[34.0, 10.0], ]);
}

module OpenSans_bottom_contour00x3c_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour00x3c_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour00x3c(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x3c_skeleton();
			OpenSans_bottom_contour00x3c_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x3c_subtractive_curves(steps);
	}
}

module OpenSans_bottom_chunk10x3c(steps=2) {
	difference() {
		OpenSans_bottom_contour00x3c(steps);
		
	}
}

OpenSans_bottom_bbox0x3c=[[3, 6], [34, 40]];

module OpenSans_bottom_letter0x3c(detail=2) {
	OpenSans_bottom_chunk10x3c(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x3d_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[3, 25], [3.0, 28.5], [3, 32], 
		[18.5, 32.0], [34, 32], [34.0, 28.5], 
		[34, 25],[18.5, 25.0], ]);
}

module OpenSans_bottom_contour00x3d_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour00x3d_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour00x3d(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x3d_skeleton();
			OpenSans_bottom_contour00x3d_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x3d_subtractive_curves(steps);
	}
}

module OpenSans_bottom_contour10x3d_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[3, 13], [3.0, 16.5], [3, 20], 
		[18.5, 20.0], [34, 20], [34.0, 16.5], 
		[34, 13],[18.5, 13.0], ]);
}

module OpenSans_bottom_contour10x3d_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour10x3d_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour10x3d(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour10x3d_skeleton();
			OpenSans_bottom_contour10x3d_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour10x3d_subtractive_curves(steps);
	}
}

module OpenSans_bottom_chunk10x3d(steps=2) {
	difference() {
		OpenSans_bottom_contour00x3d(steps);
		
	}
}

module OpenSans_bottom_chunk20x3d(steps=2) {
	difference() {
		OpenSans_bottom_contour10x3d(steps);
		
	}
}

OpenSans_bottom_bbox0x3d=[[3, 13], [34, 32]];

module OpenSans_bottom_letter0x3d(detail=2) {
	OpenSans_bottom_chunk10x3d(steps=detail);
	OpenSans_bottom_chunk20x3d(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x3e_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[3, 14], [13.5, 18.5], [24, 23], 
		[13.5, 28.0], [3, 33], [3.0, 36.5], 
		[3, 40], [18.5, 32.5], [34, 25], 
		[34.0, 22.5], [34, 20], [18.5, 13.0], 
		[3, 6],[3.0, 10.0], ]);
}

module OpenSans_bottom_contour00x3e_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour00x3e_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour00x3e(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x3e_skeleton();
			OpenSans_bottom_contour00x3e_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x3e_subtractive_curves(steps);
	}
}

module OpenSans_bottom_chunk10x3e(steps=2) {
	difference() {
		OpenSans_bottom_contour00x3e(steps);
		
	}
}

OpenSans_bottom_bbox0x3e=[[3, 6], [34, 40]];

module OpenSans_bottom_letter0x3e(detail=2) {
	OpenSans_bottom_chunk10x3e(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x3f_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[9, 15], [9.0, 16.0], [9, 17], 
		[9, 20], [10.0, 22.5], [11, 25], 
		[15, 27], [18, 30], [19.0, 31.5], 
		[20, 33], [20, 35], [20, 37], 
		[18.5, 38.0], [17, 39], [14, 39], 
		[10, 39], [4, 36], [2.0, 39.0], 
		[0, 42], [7, 46], [15, 46], 
		[21, 46], [25.0, 43.0], [29, 40], 
		[29, 35], [29, 32], [27.5, 29.5], 
		[26, 27], [22, 23], [19, 21], 
		[18.0, 20.0], [17, 19], [17, 17], 
		[17.0, 16.0], [17, 15], [13.0, 15.0], 
		 ]);
}

module OpenSans_bottom_contour00x3f_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([15, 27], [18, 30], [19.0, 31.5],steps,3);
	BezConic([19.0, 31.5], [20, 33], [20, 35],steps,3);
	BezConic([20, 35], [20, 37], [18.5, 38.0],steps,3);
	BezConic([18.5, 38.0], [17, 39], [14, 39],steps,3);
	BezConic([14, 39], [10, 39], [4, 36],steps,3);
	BezConic([22, 23], [19, 21], [18.0, 20.0],steps,3);
	BezConic([18.0, 20.0], [17, 19], [17, 17],steps,3);
}
}

module OpenSans_bottom_contour00x3f_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([9, 17], [9, 20], [10.0, 22.5],steps,3);
	BezConic([10.0, 22.5], [11, 25], [15, 27],steps,3);
	BezConic([0, 42], [7, 46], [15, 46],steps,3);
	BezConic([15, 46], [21, 46], [25.0, 43.0],steps,3);
	BezConic([25.0, 43.0], [29, 40], [29, 35],steps,3);
	BezConic([29, 35], [29, 32], [27.5, 29.5],steps,3);
	BezConic([27.5, 29.5], [26, 27], [22, 23],steps,3);
}
}

module OpenSans_bottom_contour00x3f(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x3f_skeleton();
			OpenSans_bottom_contour00x3f_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x3f_subtractive_curves(steps);
	}
}

module OpenSans_bottom_contour10x3f_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[8, 4], [8, 7], [9.0, 8.5], 
		[10, 10], [13, 10], [16, 10], 
		[17.5, 8.5], [19, 7], [19, 4], 
		[19, 2], [17.5, 0.5], [16, -1], 
		[13, -1], [11, -1], [9.5, 0.5], 
		[8, 2], ]);
}

module OpenSans_bottom_contour10x3f_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour10x3f_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([8, 4], [8, 7], [9.0, 8.5],steps,3);
	BezConic([9.0, 8.5], [10, 10], [13, 10],steps,3);
	BezConic([13, 10], [16, 10], [17.5, 8.5],steps,3);
	BezConic([17.5, 8.5], [19, 7], [19, 4],steps,3);
	BezConic([19, 4], [19, 2], [17.5, 0.5],steps,3);
	BezConic([17.5, 0.5], [16, -1], [13, -1],steps,3);
	BezConic([13, -1], [11, -1], [9.5, 0.5],steps,3);
	BezConic([9.5, 0.5], [8, 2], [8, 4],steps,3);
}
}

module OpenSans_bottom_contour10x3f(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour10x3f_skeleton();
			OpenSans_bottom_contour10x3f_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour10x3f_subtractive_curves(steps);
	}
}

module OpenSans_bottom_chunk10x3f(steps=2) {
	difference() {
		OpenSans_bottom_contour00x3f(steps);
		
	}
}

module OpenSans_bottom_chunk20x3f(steps=2) {
	difference() {
		OpenSans_bottom_contour10x3f(steps);
		
	}
}

OpenSans_bottom_bbox0x3f=[[0, -1], [29, 46]];

module OpenSans_bottom_letter0x3f(detail=2) {
	OpenSans_bottom_chunk10x3f(steps=detail);
	OpenSans_bottom_chunk20x3f(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x40_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[54, 24], [54, 19], [52.5, 15.5], 
		[51, 12], [48.5, 9.5], [46, 7], 
		[43, 7], [40, 7], [38.5, 8.5], 
		[37, 10], [36, 11], [35.5, 11.0], 
		[35, 11], [32, 7], [27, 7], 
		[21, 7], [18.0, 10.5], [15, 14], 
		[15, 20], [15, 26], [19.0, 30.0], 
		[23, 34], [30, 34], [33, 34], 
		[36.0, 33.5], [39, 33], [41, 33], 
		[41.0, 25.0], [41, 17], [41, 13], 
		[43, 13], [45, 13], [46.0, 16.0], 
		[47, 19], [47, 24], [47, 29], 
		[45.0, 32.5], [43, 36], [39.5, 38.0], 
		[36, 40], [31, 40], [24, 40], 
		[19.5, 37.5], [15, 35], [12.5, 30.0], 
		[10, 25], [10, 19], [10, 10], 
		[14.5, 5.5], [19, 1], [28, 1], 
		[31, 1], [35.0, 2.0], [39, 3], 
		[43, 4], [43.0, 1.0], [43, -2], 
		[37, -5], [28, -5], [16, -5], 
		[9.5, 1.5], [3, 8], [3, 19], 
		[3, 27], [6.5, 33.0], [10, 39], 
		[16.5, 42.5], [23, 46], [31, 46], 
		[38, 46], [43.0, 43.5], [48, 41], 
		[51.0, 35.5],[54, 30], ]);
}

module OpenSans_bottom_contour00x40_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([38.5, 8.5], [37, 10], [36, 11],steps,3);
	BezConic([36.0, 33.5], [39, 33], [41, 33],steps,3);
	BezConic([41, 17], [41, 13], [43, 13],steps,3);
	BezConic([43, 13], [45, 13], [46.0, 16.0],steps,3);
	BezConic([46.0, 16.0], [47, 19], [47, 24],steps,3);
	BezConic([47, 24], [47, 29], [45.0, 32.5],steps,3);
	BezConic([45.0, 32.5], [43, 36], [39.5, 38.0],steps,3);
	BezConic([39.5, 38.0], [36, 40], [31, 40],steps,3);
	BezConic([31, 40], [24, 40], [19.5, 37.5],steps,3);
	BezConic([19.5, 37.5], [15, 35], [12.5, 30.0],steps,3);
	BezConic([12.5, 30.0], [10, 25], [10, 19],steps,3);
	BezConic([10, 19], [10, 10], [14.5, 5.5],steps,3);
	BezConic([14.5, 5.5], [19, 1], [28, 1],steps,3);
	BezConic([28, 1], [31, 1], [35.0, 2.0],steps,3);
	BezConic([35.0, 2.0], [39, 3], [43, 4],steps,3);
}
}

module OpenSans_bottom_contour00x40_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([54, 24], [54, 19], [52.5, 15.5],steps,3);
	BezConic([52.5, 15.5], [51, 12], [48.5, 9.5],steps,3);
	BezConic([48.5, 9.5], [46, 7], [43, 7],steps,3);
	BezConic([43, 7], [40, 7], [38.5, 8.5],steps,3);
	BezConic([35, 11], [32, 7], [27, 7],steps,3);
	BezConic([27, 7], [21, 7], [18.0, 10.5],steps,3);
	BezConic([18.0, 10.5], [15, 14], [15, 20],steps,3);
	BezConic([15, 20], [15, 26], [19.0, 30.0],steps,3);
	BezConic([19.0, 30.0], [23, 34], [30, 34],steps,3);
	BezConic([30, 34], [33, 34], [36.0, 33.5],steps,3);
	BezConic([43, -2], [37, -5], [28, -5],steps,3);
	BezConic([28, -5], [16, -5], [9.5, 1.5],steps,3);
	BezConic([9.5, 1.5], [3, 8], [3, 19],steps,3);
	BezConic([3, 19], [3, 27], [6.5, 33.0],steps,3);
	BezConic([6.5, 33.0], [10, 39], [16.5, 42.5],steps,3);
	BezConic([16.5, 42.5], [23, 46], [31, 46],steps,3);
	BezConic([31, 46], [38, 46], [43.0, 43.5],steps,3);
	BezConic([43.0, 43.5], [48, 41], [51.0, 35.5],steps,3);
	BezConic([51.0, 35.5], [54, 30], [54, 24],steps,3);
}
}

module OpenSans_bottom_contour00x40(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x40_skeleton();
			OpenSans_bottom_contour00x40_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x40_subtractive_curves(steps);
	}
}

module OpenSans_bottom_contour10x40_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[22, 20], [22, 13], [28, 13], 
		[30, 13], [31.5, 15.0], [33, 17], 
		[34, 21], [34.0, 24.5], [34, 28], 
		[32, 29], [30, 29], [27, 29], 
		[24.5, 26.5],[22, 24], ]);
}

module OpenSans_bottom_contour10x40_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([22, 20], [22, 13], [28, 13],steps,3);
	BezConic([28, 13], [30, 13], [31.5, 15.0],steps,3);
	BezConic([31.5, 15.0], [33, 17], [34, 21],steps,3);
	BezConic([34, 28], [32, 29], [30, 29],steps,3);
	BezConic([30, 29], [27, 29], [24.5, 26.5],steps,3);
	BezConic([24.5, 26.5], [22, 24], [22, 20],steps,3);
}
}

module OpenSans_bottom_contour10x40_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour10x40(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour10x40_skeleton();
			OpenSans_bottom_contour10x40_subtractive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour10x40_additive_curves(steps);
	}
}

module OpenSans_bottom_chunk10x40(steps=2) {
	difference() {
		OpenSans_bottom_contour00x40(steps);
		scale([1,1,1.1]) OpenSans_bottom_contour10x40(steps);
	}
}

OpenSans_bottom_bbox0x40=[[3, -5], [54, 46]];

module OpenSans_bottom_letter0x40(detail=2) {
	OpenSans_bottom_chunk10x40(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x41_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[34, 0], [32.0, 5.5], [30, 11], 
		[22.0, 11.0], [14, 11], [12.0, 5.5], 
		[10, 0], [5.0, 0.0], [0, 0], 
		[8.0, 23.0], [16, 46], [22.0, 46.0], 
		[28, 46], [36.0, 23.0], [44, 0], 
		[39.0, 0.0], ]);
}

module OpenSans_bottom_contour00x41_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour00x41_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour00x41(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x41_skeleton();
			OpenSans_bottom_contour00x41_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x41_subtractive_curves(steps);
	}
}

module OpenSans_bottom_contour10x41_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[28, 19], [24, 34], [23.0, 36.0], 
		[22, 38], [22, 39], [21, 35], 
		[16, 19],[22.0, 19.0], ]);
}

module OpenSans_bottom_contour10x41_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([28, 19], [24, 34], [23.0, 36.0],steps,3);
}
}

module OpenSans_bottom_contour10x41_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([23.0, 36.0], [22, 38], [22, 39],steps,3);
	BezConic([22, 39], [21, 35], [16, 19],steps,3);
}
}

module OpenSans_bottom_contour10x41(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour10x41_skeleton();
			OpenSans_bottom_contour10x41_subtractive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour10x41_additive_curves(steps);
	}
}

module OpenSans_bottom_chunk10x41(steps=2) {
	difference() {
		OpenSans_bottom_contour00x41(steps);
		scale([1,1,1.1]) OpenSans_bottom_contour10x41(steps);
	}
}

OpenSans_bottom_bbox0x41=[[0, 0], [44, 46]];

module OpenSans_bottom_letter0x41(detail=2) {
	OpenSans_bottom_chunk10x41(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x42_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[6, 46], [13.0, 46.0], [20, 46], 
		[30, 46], [34.0, 43.0], [38, 40], 
		[38, 34], [38, 30], [36.5, 27.5], 
		[35, 25], [31, 24], [31.0, 24.0], 
		[31, 24], [36, 23], [38.0, 20.5], 
		[40, 18], [40, 13], [40, 7], 
		[35.5, 3.5], [31, 0], [23, 0], 
		[14.5, 0.0], [6, 0], [6.0, 23.0], 
		 ]);
}

module OpenSans_bottom_contour00x42_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour00x42_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([20, 46], [30, 46], [34.0, 43.0],steps,3);
	BezConic([34.0, 43.0], [38, 40], [38, 34],steps,3);
	BezConic([38, 34], [38, 30], [36.5, 27.5],steps,3);
	BezConic([36.5, 27.5], [35, 25], [31, 24],steps,3);
	BezConic([31, 24], [36, 23], [38.0, 20.5],steps,3);
	BezConic([38.0, 20.5], [40, 18], [40, 13],steps,3);
	BezConic([40, 13], [40, 7], [35.5, 3.5],steps,3);
	BezConic([35.5, 3.5], [31, 0], [23, 0],steps,3);
}
}

module OpenSans_bottom_contour00x42(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x42_skeleton();
			OpenSans_bottom_contour00x42_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x42_subtractive_curves(steps);
	}
}

module OpenSans_bottom_contour10x42_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[15, 28], [18.0, 28.0], [21, 28], 
		[25, 28], [27.0, 29.0], [29, 30], 
		[29, 33], [29, 35], [27.0, 36.5], 
		[25, 38], [21, 38], [18.0, 38.0], 
		[15, 38],[15.0, 33.0], ]);
}

module OpenSans_bottom_contour10x42_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([21, 28], [25, 28], [27.0, 29.0],steps,3);
	BezConic([27.0, 29.0], [29, 30], [29, 33],steps,3);
	BezConic([29, 33], [29, 35], [27.0, 36.5],steps,3);
	BezConic([27.0, 36.5], [25, 38], [21, 38],steps,3);
}
}

module OpenSans_bottom_contour10x42_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour10x42(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour10x42_skeleton();
			OpenSans_bottom_contour10x42_subtractive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour10x42_additive_curves(steps);
	}
}

module OpenSans_bottom_contour20x42_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[15, 20], [15.0, 14.0], [15, 8], 
		[18.5, 8.0], [22, 8], [26, 8], 
		[28.0, 9.5], [30, 11], [30, 14], 
		[30, 20], [21, 20], [18.0, 20.0], 
		 ]);
}

module OpenSans_bottom_contour20x42_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([22, 8], [26, 8], [28.0, 9.5],steps,3);
	BezConic([28.0, 9.5], [30, 11], [30, 14],steps,3);
	BezConic([30, 14], [30, 20], [21, 20],steps,3);
}
}

module OpenSans_bottom_contour20x42_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour20x42(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour20x42_skeleton();
			OpenSans_bottom_contour20x42_subtractive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour20x42_additive_curves(steps);
	}
}

module OpenSans_bottom_chunk10x42(steps=2) {
	difference() {
		OpenSans_bottom_contour00x42(steps);
		scale([1,1,1.1]) OpenSans_bottom_contour10x42(steps);
	scale([1,1,1.1]) OpenSans_bottom_contour20x42(steps);
	}
}

OpenSans_bottom_bbox0x42=[[6, 0], [40, 46]];

module OpenSans_bottom_letter0x42(detail=2) {
	OpenSans_bottom_chunk10x42(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x43_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[25, 38], [20, 38], [17.0, 34.0], 
		[14, 30], [14, 23], [14, 7], 
		[25, 7], [30, 7], [37, 10], 
		[37.0, 6.0], [37, 2], [31, -1], 
		[24, -1], [14, -1], [9.0, 5.0], 
		[4, 11], [4, 23], [4, 30], 
		[6.5, 35.5], [9, 41], [14.0, 43.5], 
		[19, 46], [25, 46], [32, 46], 
		[39, 43], [37.0, 39.0], [35, 35], 
		[33, 36], [30.5, 37.0], [28, 38], 
		 ]);
}

module OpenSans_bottom_contour00x43_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([25, 38], [20, 38], [17.0, 34.0],steps,3);
	BezConic([17.0, 34.0], [14, 30], [14, 23],steps,3);
	BezConic([14, 23], [14, 7], [25, 7],steps,3);
	BezConic([25, 7], [30, 7], [37, 10],steps,3);
	BezConic([35, 35], [33, 36], [30.5, 37.0],steps,3);
	BezConic([30.5, 37.0], [28, 38], [25, 38],steps,3);
}
}

module OpenSans_bottom_contour00x43_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([37, 2], [31, -1], [24, -1],steps,3);
	BezConic([24, -1], [14, -1], [9.0, 5.0],steps,3);
	BezConic([9.0, 5.0], [4, 11], [4, 23],steps,3);
	BezConic([4, 23], [4, 30], [6.5, 35.5],steps,3);
	BezConic([6.5, 35.5], [9, 41], [14.0, 43.5],steps,3);
	BezConic([14.0, 43.5], [19, 46], [25, 46],steps,3);
	BezConic([25, 46], [32, 46], [39, 43],steps,3);
}
}

module OpenSans_bottom_contour00x43(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x43_skeleton();
			OpenSans_bottom_contour00x43_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x43_subtractive_curves(steps);
	}
}

module OpenSans_bottom_chunk10x43(steps=2) {
	difference() {
		OpenSans_bottom_contour00x43(steps);
		
	}
}

OpenSans_bottom_bbox0x43=[[4, -1], [39, 46]];

module OpenSans_bottom_letter0x43(detail=2) {
	OpenSans_bottom_chunk10x43(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x44_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[44, 23], [44, 12], [37.5, 6.0], 
		[31, 0], [19, 0], [12.5, 0.0], 
		[6, 0], [6.0, 23.0], [6, 46], 
		[13.0, 46.0], [20, 46], [31, 46], 
		[37.5, 40.0],[44, 34], ]);
}

module OpenSans_bottom_contour00x44_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour00x44_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([44, 23], [44, 12], [37.5, 6.0],steps,3);
	BezConic([37.5, 6.0], [31, 0], [19, 0],steps,3);
	BezConic([20, 46], [31, 46], [37.5, 40.0],steps,3);
	BezConic([37.5, 40.0], [44, 34], [44, 23],steps,3);
}
}

module OpenSans_bottom_contour00x44(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x44_skeleton();
			OpenSans_bottom_contour00x44_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x44_subtractive_curves(steps);
	}
}

module OpenSans_bottom_contour10x44_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[34, 23], [34, 38], [21, 38], 
		[18.0, 38.0], [15, 38], [15.0, 23.0], 
		[15, 8], [17.5, 8.0], [20, 8], 
		[34, 8], ]);
}

module OpenSans_bottom_contour10x44_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([34, 23], [34, 38], [21, 38],steps,3);
	BezConic([20, 8], [34, 8], [34, 23],steps,3);
}
}

module OpenSans_bottom_contour10x44_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour10x44(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour10x44_skeleton();
			OpenSans_bottom_contour10x44_subtractive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour10x44_additive_curves(steps);
	}
}

module OpenSans_bottom_chunk10x44(steps=2) {
	difference() {
		OpenSans_bottom_contour00x44(steps);
		scale([1,1,1.1]) OpenSans_bottom_contour10x44(steps);
	}
}

OpenSans_bottom_bbox0x44=[[6, 0], [44, 46]];

module OpenSans_bottom_letter0x44(detail=2) {
	OpenSans_bottom_chunk10x44(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x45_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[32, 0], [19.0, 0.0], [6, 0], 
		[6.0, 23.0], [6, 46], [19.0, 46.0], 
		[32, 46], [32.0, 42.0], [32, 38], 
		[23.5, 38.0], [15, 38], [15.0, 33.0], 
		[15, 28], [23.0, 28.0], [31, 28], 
		[31.0, 24.0], [31, 20], [23.0, 20.0], 
		[15, 20], [15.0, 14.0], [15, 8], 
		[23.5, 8.0], [32, 8], [32.0, 4.0], 
		 ]);
}

module OpenSans_bottom_contour00x45_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour00x45_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour00x45(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x45_skeleton();
			OpenSans_bottom_contour00x45_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x45_subtractive_curves(steps);
	}
}

module OpenSans_bottom_chunk10x45(steps=2) {
	difference() {
		OpenSans_bottom_contour00x45(steps);
		
	}
}

OpenSans_bottom_bbox0x45=[[6, 0], [32, 46]];

module OpenSans_bottom_letter0x45(detail=2) {
	OpenSans_bottom_chunk10x45(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x46_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[15, 0], [10.5, 0.0], [6, 0], 
		[6.0, 23.0], [6, 46], [19.0, 46.0], 
		[32, 46], [32.0, 42.0], [32, 38], 
		[23.5, 38.0], [15, 38], [15.0, 32.0], 
		[15, 26], [23.0, 26.0], [31, 26], 
		[31.0, 22.0], [31, 18], [23.0, 18.0], 
		[15, 18],[15.0, 9.0], ]);
}

module OpenSans_bottom_contour00x46_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour00x46_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour00x46(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x46_skeleton();
			OpenSans_bottom_contour00x46_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x46_subtractive_curves(steps);
	}
}

module OpenSans_bottom_chunk10x46(steps=2) {
	difference() {
		OpenSans_bottom_contour00x46(steps);
		
	}
}

OpenSans_bottom_bbox0x46=[[6, 0], [32, 46]];

module OpenSans_bottom_letter0x46(detail=2) {
	OpenSans_bottom_chunk10x46(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x47_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[23, 26], [32.0, 26.0], [41, 26], 
		[41.0, 14.0], [41, 2], [37, 1], 
		[33.0, 0.0], [29, -1], [25, -1], 
		[15, -1], [9.5, 5.5], [4, 12], 
		[4, 23], [4, 34], [10.0, 40.0], 
		[16, 46], [28, 46], [35, 46], 
		[41, 44], [39.5, 40.0], [38, 36], 
		[33, 38], [28, 38], [21, 38], 
		[17.5, 34.0], [14, 30], [14, 23], 
		[14, 15], [17.0, 11.0], [20, 7], 
		[26, 7], [29, 7], [32, 8], 
		[32.0, 13.0], [32, 18], [27.5, 18.0], 
		[23, 18],[23.0, 22.0], ]);
}

module OpenSans_bottom_contour00x47_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([41, 2], [37, 1], [33.0, 0.0],steps,3);
	BezConic([38, 36], [33, 38], [28, 38],steps,3);
	BezConic([28, 38], [21, 38], [17.5, 34.0],steps,3);
	BezConic([17.5, 34.0], [14, 30], [14, 23],steps,3);
	BezConic([14, 23], [14, 15], [17.0, 11.0],steps,3);
	BezConic([17.0, 11.0], [20, 7], [26, 7],steps,3);
	BezConic([26, 7], [29, 7], [32, 8],steps,3);
}
}

module OpenSans_bottom_contour00x47_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([33.0, 0.0], [29, -1], [25, -1],steps,3);
	BezConic([25, -1], [15, -1], [9.5, 5.5],steps,3);
	BezConic([9.5, 5.5], [4, 12], [4, 23],steps,3);
	BezConic([4, 23], [4, 34], [10.0, 40.0],steps,3);
	BezConic([10.0, 40.0], [16, 46], [28, 46],steps,3);
	BezConic([28, 46], [35, 46], [41, 44],steps,3);
}
}

module OpenSans_bottom_contour00x47(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x47_skeleton();
			OpenSans_bottom_contour00x47_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x47_subtractive_curves(steps);
	}
}

module OpenSans_bottom_chunk10x47(steps=2) {
	difference() {
		OpenSans_bottom_contour00x47(steps);
		
	}
}

OpenSans_bottom_bbox0x47=[[4, -1], [41, 46]];

module OpenSans_bottom_letter0x47(detail=2) {
	OpenSans_bottom_chunk10x47(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x48_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[43, 0], [38.5, 0.0], [34, 0], 
		[34.0, 10.0], [34, 20], [24.5, 20.0], 
		[15, 20], [15.0, 10.0], [15, 0], 
		[10.5, 0.0], [6, 0], [6.0, 23.0], 
		[6, 46], [10.5, 46.0], [15, 46], 
		[15.0, 37.0], [15, 28], [24.5, 28.0], 
		[34, 28], [34.0, 37.0], [34, 46], 
		[38.5, 46.0], [43, 46], [43.0, 23.0], 
		 ]);
}

module OpenSans_bottom_contour00x48_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour00x48_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour00x48(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x48_skeleton();
			OpenSans_bottom_contour00x48_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x48_subtractive_curves(steps);
	}
}

module OpenSans_bottom_chunk10x48(steps=2) {
	difference() {
		OpenSans_bottom_contour00x48(steps);
		
	}
}

OpenSans_bottom_bbox0x48=[[6, 0], [43, 46]];

module OpenSans_bottom_letter0x48(detail=2) {
	OpenSans_bottom_chunk10x48(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x49_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[6, 0], [6.0, 23.0], [6, 46], 
		[10.5, 46.0], [15, 46], [15.0, 23.0], 
		[15, 0],[10.5, 0.0], ]);
}

module OpenSans_bottom_contour00x49_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour00x49_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour00x49(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x49_skeleton();
			OpenSans_bottom_contour00x49_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x49_subtractive_curves(steps);
	}
}

module OpenSans_bottom_chunk10x49(steps=2) {
	difference() {
		OpenSans_bottom_contour00x49(steps);
		
	}
}

OpenSans_bottom_bbox0x49=[[6, 0], [15, 46]];

module OpenSans_bottom_letter0x49(detail=2) {
	OpenSans_bottom_chunk10x49(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x4a_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[1, -13], [-2, -13], [-5, -13], 
		[-5.0, -9.0], [-5, -5], [-2, -5], 
		[0, -5], [3, -5], [4.5, -3.0], 
		[6, -1], [6, 3], [6.0, 24.5], 
		[6, 46], [10.5, 46.0], [15, 46], 
		[15.0, 24.5], [15, 3], [15, -5], 
		[11.5, -9.0],[8, -13], ]);
}

module OpenSans_bottom_contour00x4a_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([1, -13], [-2, -13], [-5, -13],steps,3);
	BezConic([-5, -5], [-2, -5], [0, -5],steps,3);
	BezConic([0, -5], [3, -5], [4.5, -3.0],steps,3);
	BezConic([4.5, -3.0], [6, -1], [6, 3],steps,3);
}
}

module OpenSans_bottom_contour00x4a_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([15, 3], [15, -5], [11.5, -9.0],steps,3);
	BezConic([11.5, -9.0], [8, -13], [1, -13],steps,3);
}
}

module OpenSans_bottom_contour00x4a(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x4a_skeleton();
			OpenSans_bottom_contour00x4a_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x4a_subtractive_curves(steps);
	}
}

module OpenSans_bottom_chunk10x4a(steps=2) {
	difference() {
		OpenSans_bottom_contour00x4a(steps);
		
	}
}

OpenSans_bottom_bbox0x4a=[[-5, -13], [15, 46]];

module OpenSans_bottom_letter0x4a(detail=2) {
	OpenSans_bottom_chunk10x4a(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x4b_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[43, 0], [37.5, 0.0], [32, 0], 
		[26.0, 9.5], [20, 19], [17.5, 17.5], 
		[15, 16], [15.0, 8.0], [15, 0], 
		[10.5, 0.0], [6, 0], [6.0, 23.0], 
		[6, 46], [10.5, 46.0], [15, 46], 
		[15.0, 35.5], [15, 25], [17.0, 27.5], 
		[19, 30], [25.5, 38.0], [32, 46], 
		[37.0, 46.0], [42, 46], [34.0, 35.5], 
		[26, 25],[34.5, 12.5], ]);
}

module OpenSans_bottom_contour00x4b_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour00x4b_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour00x4b(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x4b_skeleton();
			OpenSans_bottom_contour00x4b_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x4b_subtractive_curves(steps);
	}
}

module OpenSans_bottom_chunk10x4b(steps=2) {
	difference() {
		OpenSans_bottom_contour00x4b(steps);
		
	}
}

OpenSans_bottom_bbox0x4b=[[6, 0], [43, 46]];

module OpenSans_bottom_letter0x4b(detail=2) {
	OpenSans_bottom_chunk10x4b(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x4c_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[6, 0], [6.0, 23.0], [6, 46], 
		[10.5, 46.0], [15, 46], [15.0, 27.0], 
		[15, 8], [24.5, 8.0], [34, 8], 
		[34.0, 4.0], [34, 0], [20.0, 0.0], 
		 ]);
}

module OpenSans_bottom_contour00x4c_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour00x4c_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour00x4c(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x4c_skeleton();
			OpenSans_bottom_contour00x4c_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x4c_subtractive_curves(steps);
	}
}

module OpenSans_bottom_chunk10x4c(steps=2) {
	difference() {
		OpenSans_bottom_contour00x4c(steps);
		
	}
}

OpenSans_bottom_bbox0x4c=[[6, 0], [34, 46]];

module OpenSans_bottom_letter0x4c(detail=2) {
	OpenSans_bottom_chunk10x4c(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x4d_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[25, 0], [19.5, 18.0], [14, 36], 
		[14.0, 36.0], [14, 36], [14, 25], 
		[14, 21], [14.0, 10.5], [14, 0], 
		[10.0, 0.0], [6, 0], [6.0, 23.0], 
		[6, 46], [12.5, 46.0], [19, 46], 
		[24.5, 28.5], [30, 11], [30.0, 11.0], 
		[30, 11], [35.5, 28.5], [41, 46], 
		[48.0, 46.0], [55, 46], [55.0, 23.0], 
		[55, 0], [50.5, 0.0], [46, 0], 
		[46.0, 11.0], [46, 22], [46, 23], 
		[46.0, 25.0], [46, 27], [46, 36], 
		[46.0, 36.0], [46, 36], [40.0, 18.0], 
		[34, 0],[29.5, 0.0], ]);
}

module OpenSans_bottom_contour00x4d_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([14, 36], [14, 25], [14, 21],steps,3);
	BezConic([46, 22], [46, 23], [46.0, 25.0],steps,3);
	BezConic([46.0, 25.0], [46, 27], [46, 36],steps,3);
}
}

module OpenSans_bottom_contour00x4d_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour00x4d(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x4d_skeleton();
			OpenSans_bottom_contour00x4d_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x4d_subtractive_curves(steps);
	}
}

module OpenSans_bottom_chunk10x4d(steps=2) {
	difference() {
		OpenSans_bottom_contour00x4d(steps);
		
	}
}

OpenSans_bottom_bbox0x4d=[[6, 0], [55, 46]];

module OpenSans_bottom_letter0x4d(detail=2) {
	OpenSans_bottom_chunk10x4d(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x4e_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[46, 0], [40.0, 0.0], [34, 0], 
		[24.0, 17.5], [14, 35], [14.0, 35.0], 
		[14, 35], [14, 25], [14, 22], 
		[14.0, 11.0], [14, 0], [10.0, 0.0], 
		[6, 0], [6.0, 23.0], [6, 46], 
		[12.0, 46.0], [18, 46], [28.0, 28.5], 
		[38, 11], [38.0, 11.0], [38, 11], 
		[38, 20], [38, 24], [38.0, 35.0], 
		[38, 46], [42.0, 46.0], [46, 46], 
		[46.0, 23.0], ]);
}

module OpenSans_bottom_contour00x4e_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([14, 35], [14, 25], [14, 22],steps,3);
	BezConic([38, 11], [38, 20], [38, 24],steps,3);
}
}

module OpenSans_bottom_contour00x4e_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour00x4e(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x4e_skeleton();
			OpenSans_bottom_contour00x4e_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x4e_subtractive_curves(steps);
	}
}

module OpenSans_bottom_chunk10x4e(steps=2) {
	difference() {
		OpenSans_bottom_contour00x4e(steps);
		
	}
}

OpenSans_bottom_bbox0x4e=[[6, 0], [46, 46]];

module OpenSans_bottom_letter0x4e(detail=2) {
	OpenSans_bottom_chunk10x4e(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x4f_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[47, 23], [47, 12], [41.5, 5.5], 
		[36, -1], [25, -1], [15, -1], 
		[9.5, 5.5], [4, 12], [4, 23], 
		[4, 34], [9.5, 40.0], [15, 46], 
		[26, 46], [36, 46], [41.5, 40.0], 
		[47, 34], ]);
}

module OpenSans_bottom_contour00x4f_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour00x4f_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([47, 23], [47, 12], [41.5, 5.5],steps,3);
	BezConic([41.5, 5.5], [36, -1], [25, -1],steps,3);
	BezConic([25, -1], [15, -1], [9.5, 5.5],steps,3);
	BezConic([9.5, 5.5], [4, 12], [4, 23],steps,3);
	BezConic([4, 23], [4, 34], [9.5, 40.0],steps,3);
	BezConic([9.5, 40.0], [15, 46], [26, 46],steps,3);
	BezConic([26, 46], [36, 46], [41.5, 40.0],steps,3);
	BezConic([41.5, 40.0], [47, 34], [47, 23],steps,3);
}
}

module OpenSans_bottom_contour00x4f(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x4f_skeleton();
			OpenSans_bottom_contour00x4f_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x4f_subtractive_curves(steps);
	}
}

module OpenSans_bottom_contour10x4f_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[14, 23], [14, 15], [17.0, 11.5], 
		[20, 8], [25, 8], [37, 8], 
		[37, 23], [37, 38], [26, 38], 
		[20, 38], [17.0, 34.5], [14, 31], 
		 ]);
}

module OpenSans_bottom_contour10x4f_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([14, 23], [14, 15], [17.0, 11.5],steps,3);
	BezConic([17.0, 11.5], [20, 8], [25, 8],steps,3);
	BezConic([25, 8], [37, 8], [37, 23],steps,3);
	BezConic([37, 23], [37, 38], [26, 38],steps,3);
	BezConic([26, 38], [20, 38], [17.0, 34.5],steps,3);
	BezConic([17.0, 34.5], [14, 31], [14, 23],steps,3);
}
}

module OpenSans_bottom_contour10x4f_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour10x4f(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour10x4f_skeleton();
			OpenSans_bottom_contour10x4f_subtractive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour10x4f_additive_curves(steps);
	}
}

module OpenSans_bottom_chunk10x4f(steps=2) {
	difference() {
		OpenSans_bottom_contour00x4f(steps);
		scale([1,1,1.1]) OpenSans_bottom_contour10x4f(steps);
	}
}

OpenSans_bottom_bbox0x4f=[[4, -1], [47, 46]];

module OpenSans_bottom_letter0x4f(detail=2) {
	OpenSans_bottom_chunk10x4f(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x50_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[15, 24], [17.0, 24.0], [19, 24], 
		[23, 24], [25.5, 26.0], [28, 28], 
		[28, 31], [28, 35], [26.0, 36.5], 
		[24, 38], [20, 38], [17.5, 38.0], 
		[15, 38],[15.0, 31.0], ]);
}

module OpenSans_bottom_contour00x50_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([19, 24], [23, 24], [25.5, 26.0],steps,3);
	BezConic([25.5, 26.0], [28, 28], [28, 31],steps,3);
	BezConic([28, 31], [28, 35], [26.0, 36.5],steps,3);
	BezConic([26.0, 36.5], [24, 38], [20, 38],steps,3);
}
}

module OpenSans_bottom_contour00x50_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour00x50(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x50_skeleton();
			OpenSans_bottom_contour00x50_subtractive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x50_additive_curves(steps);
	}
}

module OpenSans_bottom_contour10x50_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[37, 31], [37, 24], [32.5, 20.0], 
		[28, 16], [20, 16], [17.5, 16.0], 
		[15, 16], [15.0, 8.0], [15, 0], 
		[10.5, 0.0], [6, 0], [6.0, 23.0], 
		[6, 46], [13.0, 46.0], [20, 46], 
		[29, 46], [33.0, 42.5], [37, 39], 
		 ]);
}

module OpenSans_bottom_contour10x50_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour10x50_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([37, 31], [37, 24], [32.5, 20.0],steps,3);
	BezConic([32.5, 20.0], [28, 16], [20, 16],steps,3);
	BezConic([20, 46], [29, 46], [33.0, 42.5],steps,3);
	BezConic([33.0, 42.5], [37, 39], [37, 31],steps,3);
}
}

module OpenSans_bottom_contour10x50(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour10x50_skeleton();
			OpenSans_bottom_contour10x50_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour10x50_subtractive_curves(steps);
	}
}

module OpenSans_bottom_chunk00x50(steps=2) {
	difference() {
		
		scale([1,1,1.1]) OpenSans_bottom_contour00x50(steps);
	}
}

module OpenSans_bottom_chunk10x50(steps=2) {
	difference() {
		OpenSans_bottom_contour10x50(steps);
		
	}
}

OpenSans_bottom_bbox0x50=[[6, 0], [37, 46]];

module OpenSans_bottom_letter0x50(detail=2) {
	OpenSans_bottom_chunk00x50(steps=detail);
	OpenSans_bottom_chunk10x50(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x51_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[47, 23], [47, 15], [44.5, 9.5], 
		[42, 4], [36, 1], [41.5, -5.0], 
		[47, -11], [41.0, -11.0], [35, -11], 
		[30.5, -6.0], [26, -1], [25.5, -1.0], 
		[25, -1], [15, -1], [9.5, 5.5], 
		[4, 12], [4, 23], [4, 34], 
		[9.5, 40.0], [15, 46], [26, 46], 
		[36, 46], [41.5, 40.0], [47, 34], 
		 ]);
}

module OpenSans_bottom_contour00x51_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour00x51_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([47, 23], [47, 15], [44.5, 9.5],steps,3);
	BezConic([44.5, 9.5], [42, 4], [36, 1],steps,3);
	BezConic([25, -1], [15, -1], [9.5, 5.5],steps,3);
	BezConic([9.5, 5.5], [4, 12], [4, 23],steps,3);
	BezConic([4, 23], [4, 34], [9.5, 40.0],steps,3);
	BezConic([9.5, 40.0], [15, 46], [26, 46],steps,3);
	BezConic([26, 46], [36, 46], [41.5, 40.0],steps,3);
	BezConic([41.5, 40.0], [47, 34], [47, 23],steps,3);
}
}

module OpenSans_bottom_contour00x51(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x51_skeleton();
			OpenSans_bottom_contour00x51_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x51_subtractive_curves(steps);
	}
}

module OpenSans_bottom_contour10x51_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[14, 23], [14, 15], [17.0, 11.5], 
		[20, 8], [25, 8], [37, 8], 
		[37, 23], [37, 38], [26, 38], 
		[20, 38], [17.0, 34.5], [14, 31], 
		 ]);
}

module OpenSans_bottom_contour10x51_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([14, 23], [14, 15], [17.0, 11.5],steps,3);
	BezConic([17.0, 11.5], [20, 8], [25, 8],steps,3);
	BezConic([25, 8], [37, 8], [37, 23],steps,3);
	BezConic([37, 23], [37, 38], [26, 38],steps,3);
	BezConic([26, 38], [20, 38], [17.0, 34.5],steps,3);
	BezConic([17.0, 34.5], [14, 31], [14, 23],steps,3);
}
}

module OpenSans_bottom_contour10x51_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour10x51(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour10x51_skeleton();
			OpenSans_bottom_contour10x51_subtractive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour10x51_additive_curves(steps);
	}
}

module OpenSans_bottom_chunk10x51(steps=2) {
	difference() {
		OpenSans_bottom_contour00x51(steps);
		scale([1,1,1.1]) OpenSans_bottom_contour10x51(steps);
	}
}

OpenSans_bottom_bbox0x51=[[4, -11], [47, 46]];

module OpenSans_bottom_letter0x51(detail=2) {
	OpenSans_bottom_chunk10x51(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x52_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[15, 25], [17.0, 25.0], [19, 25], 
		[23, 25], [25.5, 26.5], [28, 28], 
		[28, 32], [28, 35], [25.5, 36.5], 
		[23, 38], [18, 38], [16.5, 38.0], 
		[15, 38],[15.0, 31.5], ]);
}

module OpenSans_bottom_contour00x52_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([19, 25], [23, 25], [25.5, 26.5],steps,3);
	BezConic([25.5, 26.5], [28, 28], [28, 32],steps,3);
	BezConic([28, 32], [28, 35], [25.5, 36.5],steps,3);
	BezConic([25.5, 36.5], [23, 38], [18, 38],steps,3);
}
}

module OpenSans_bottom_contour00x52_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour00x52(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x52_skeleton();
			OpenSans_bottom_contour00x52_subtractive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x52_additive_curves(steps);
	}
}

module OpenSans_bottom_contour10x52_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[15, 18], [15.0, 9.0], [15, 0], 
		[10.5, 0.0], [6, 0], [6.0, 23.0], 
		[6, 46], [12.5, 46.0], [19, 46], 
		[28, 46], [32.5, 42.5], [37, 39], 
		[37, 32], [37, 28], [35.0, 25.0], 
		[33, 22], [29, 20], [39, 5], 
		[42, 0], [37.0, 0.0], [32, 0], 
		[26.5, 9.0], [21, 18], [18.0, 18.0], 
		 ]);
}

module OpenSans_bottom_contour10x52_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour10x52_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([19, 46], [28, 46], [32.5, 42.5],steps,3);
	BezConic([32.5, 42.5], [37, 39], [37, 32],steps,3);
	BezConic([37, 32], [37, 28], [35.0, 25.0],steps,3);
	BezConic([35.0, 25.0], [33, 22], [29, 20],steps,3);
	BezConic([29, 20], [39, 5], [42, 0],steps,3);
}
}

module OpenSans_bottom_contour10x52(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour10x52_skeleton();
			OpenSans_bottom_contour10x52_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour10x52_subtractive_curves(steps);
	}
}

module OpenSans_bottom_chunk00x52(steps=2) {
	difference() {
		
		scale([1,1,1.1]) OpenSans_bottom_contour00x52(steps);
	}
}

module OpenSans_bottom_chunk10x52(steps=2) {
	difference() {
		OpenSans_bottom_contour10x52(steps);
		
	}
}

OpenSans_bottom_bbox0x52=[[6, 0], [42, 46]];

module OpenSans_bottom_letter0x52(detail=2) {
	OpenSans_bottom_chunk00x52(steps=detail);
	OpenSans_bottom_chunk10x52(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x53_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[33, 13], [33, 7], [28.5, 3.0], 
		[24, -1], [16, -1], [9, -1], 
		[3, 2], [3.0, 6.5], [3, 11], 
		[8, 9], [11.0, 8.0], [14, 7], 
		[17, 7], [20, 7], [21.5, 8.5], 
		[23, 10], [23, 12], [23, 14], 
		[22.5, 15.0], [22, 16], [20.5, 17.0], 
		[19, 18], [14, 20], [10, 22], 
		[8.0, 23.5], [6, 25], [4.5, 27.5], 
		[3, 30], [3, 33], [3, 39], 
		[7.5, 42.5], [12, 46], [19, 46], 
		[23, 46], [26.0, 45.5], [29, 45], 
		[33, 43], [31.0, 39.5], [29, 36], 
		[26, 37], [23.5, 37.5], [21, 38], 
		[19, 38], [16, 38], [14.5, 37.0], 
		[13, 36], [13, 34], [13, 32], 
		[13.5, 31.0], [14, 30], [15.5, 29.5], 
		[17, 29], [22, 26], [28, 23], 
		[30.5, 20.0],[33, 17], ]);
}

module OpenSans_bottom_contour00x53_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([3, 11], [8, 9], [11.0, 8.0],steps,3);
	BezConic([11.0, 8.0], [14, 7], [17, 7],steps,3);
	BezConic([17, 7], [20, 7], [21.5, 8.5],steps,3);
	BezConic([21.5, 8.5], [23, 10], [23, 12],steps,3);
	BezConic([23, 12], [23, 14], [22.5, 15.0],steps,3);
	BezConic([22.5, 15.0], [22, 16], [20.5, 17.0],steps,3);
	BezConic([20.5, 17.0], [19, 18], [14, 20],steps,3);
	BezConic([29, 36], [26, 37], [23.5, 37.5],steps,3);
	BezConic([23.5, 37.5], [21, 38], [19, 38],steps,3);
	BezConic([19, 38], [16, 38], [14.5, 37.0],steps,3);
	BezConic([14.5, 37.0], [13, 36], [13, 34],steps,3);
	BezConic([13, 34], [13, 32], [13.5, 31.0],steps,3);
	BezConic([13.5, 31.0], [14, 30], [15.5, 29.5],steps,3);
}
}

module OpenSans_bottom_contour00x53_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([33, 13], [33, 7], [28.5, 3.0],steps,3);
	BezConic([28.5, 3.0], [24, -1], [16, -1],steps,3);
	BezConic([16, -1], [9, -1], [3, 2],steps,3);
	BezConic([14, 20], [10, 22], [8.0, 23.5],steps,3);
	BezConic([8.0, 23.5], [6, 25], [4.5, 27.5],steps,3);
	BezConic([4.5, 27.5], [3, 30], [3, 33],steps,3);
	BezConic([3, 33], [3, 39], [7.5, 42.5],steps,3);
	BezConic([7.5, 42.5], [12, 46], [19, 46],steps,3);
	BezConic([19, 46], [23, 46], [26.0, 45.5],steps,3);
	BezConic([26.0, 45.5], [29, 45], [33, 43],steps,3);
	BezConic([15.5, 29.5], [17, 29], [22, 26],steps,3);
	BezConic([22, 26], [28, 23], [30.5, 20.0],steps,3);
	BezConic([30.5, 20.0], [33, 17], [33, 13],steps,3);
}
}

module OpenSans_bottom_contour00x53(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x53_skeleton();
			OpenSans_bottom_contour00x53_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x53_subtractive_curves(steps);
	}
}

module OpenSans_bottom_chunk10x53(steps=2) {
	difference() {
		OpenSans_bottom_contour00x53(steps);
		
	}
}

OpenSans_bottom_bbox0x53=[[3, -1], [33, 46]];

module OpenSans_bottom_letter0x53(detail=2) {
	OpenSans_bottom_chunk10x53(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x54_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[23, 0], [18.5, 0.0], [14, 0], 
		[14.0, 19.0], [14, 38], [7.5, 38.0], 
		[1, 38], [1.0, 42.0], [1, 46], 
		[18.5, 46.0], [36, 46], [36.0, 42.0], 
		[36, 38], [29.5, 38.0], [23, 38], 
		[23.0, 19.0], ]);
}

module OpenSans_bottom_contour00x54_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour00x54_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour00x54(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x54_skeleton();
			OpenSans_bottom_contour00x54_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x54_subtractive_curves(steps);
	}
}

module OpenSans_bottom_chunk10x54(steps=2) {
	difference() {
		OpenSans_bottom_contour00x54(steps);
		
	}
}

OpenSans_bottom_bbox0x54=[[1, 0], [36, 46]];

module OpenSans_bottom_letter0x54(detail=2) {
	OpenSans_bottom_chunk10x54(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x55_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[43, 46], [43.0, 31.0], [43, 16], 
		[43, 11], [40.5, 7.0], [38, 3], 
		[34.0, 1.0], [30, -1], [24, -1], 
		[15, -1], [10.0, 3.5], [5, 8], 
		[5, 16], [5.0, 31.0], [5, 46], 
		[10.0, 46.0], [15, 46], [15.0, 32.0], 
		[15, 18], [15, 12], [17.0, 10.0], 
		[19, 8], [24, 8], [29, 8], 
		[31.0, 10.0], [33, 12], [33, 18], 
		[33.0, 32.0], [33, 46], [38.0, 46.0], 
		 ]);
}

module OpenSans_bottom_contour00x55_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([15, 18], [15, 12], [17.0, 10.0],steps,3);
	BezConic([17.0, 10.0], [19, 8], [24, 8],steps,3);
	BezConic([24, 8], [29, 8], [31.0, 10.0],steps,3);
	BezConic([31.0, 10.0], [33, 12], [33, 18],steps,3);
}
}

module OpenSans_bottom_contour00x55_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([43, 16], [43, 11], [40.5, 7.0],steps,3);
	BezConic([40.5, 7.0], [38, 3], [34.0, 1.0],steps,3);
	BezConic([34.0, 1.0], [30, -1], [24, -1],steps,3);
	BezConic([24, -1], [15, -1], [10.0, 3.5],steps,3);
	BezConic([10.0, 3.5], [5, 8], [5, 16],steps,3);
}
}

module OpenSans_bottom_contour00x55(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x55_skeleton();
			OpenSans_bottom_contour00x55_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x55_subtractive_curves(steps);
	}
}

module OpenSans_bottom_chunk10x55(steps=2) {
	difference() {
		OpenSans_bottom_contour00x55(steps);
		
	}
}

OpenSans_bottom_bbox0x55=[[5, -1], [43, 46]];

module OpenSans_bottom_letter0x55(detail=2) {
	OpenSans_bottom_chunk10x55(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x56_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[32, 46], [37.0, 46.0], [42, 46], 
		[34.0, 23.0], [26, 0], [21.0, 0.0], 
		[16, 0], [8.0, 23.0], [0, 46], 
		[5.0, 46.0], [10, 46], [14.0, 32.5], 
		[18, 19], [19, 16], [20.0, 13.0], 
		[21, 10], [21, 8], [21, 11], 
		[23, 19],[27.5, 32.5], ]);
}

module OpenSans_bottom_contour00x56_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([18, 19], [19, 16], [20.0, 13.0],steps,3);
}
}

module OpenSans_bottom_contour00x56_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([20.0, 13.0], [21, 10], [21, 8],steps,3);
	BezConic([21, 8], [21, 11], [23, 19],steps,3);
}
}

module OpenSans_bottom_contour00x56(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x56_skeleton();
			OpenSans_bottom_contour00x56_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x56_subtractive_curves(steps);
	}
}

module OpenSans_bottom_chunk10x56(steps=2) {
	difference() {
		OpenSans_bottom_contour00x56(steps);
		
	}
}

OpenSans_bottom_bbox0x56=[[0, 0], [42, 46]];

module OpenSans_bottom_letter0x56(detail=2) {
	OpenSans_bottom_chunk10x56(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x57_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[50, 0], [44.5, 0.0], [39, 0], 
		[36.0, 12.0], [33, 24], [33, 25], 
		[32.0, 29.0], [31, 33], [31, 35], 
		[31, 33], [30.0, 29.5], [29, 26], 
		[29, 24], [26.0, 12.0], [23, 0], 
		[17.5, 0.0], [12, 0], [6.0, 23.0], 
		[0, 46], [5.0, 46.0], [10, 46], 
		[12.5, 33.5], [15, 21], [17, 14], 
		[18, 9], [18, 11], [18.5, 14.5], 
		[19, 18], [20, 20], [23.0, 33.0], 
		[26, 46], [31.0, 46.0], [36, 46], 
		[39.0, 33.0], [42, 20], [43, 18], 
		[43.5, 14.5], [44, 11], [44, 9], 
		[45, 11], [45.5, 15.0], [46, 19], 
		[47, 21], [49.5, 33.5], [52, 46], 
		[57.0, 46.0], [62, 46], [56.0, 23.0], 
		 ]);
}

module OpenSans_bottom_contour00x57_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([33, 24], [33, 25], [32.0, 29.0],steps,3);
	BezConic([30.0, 29.5], [29, 26], [29, 24],steps,3);
	BezConic([44, 9], [45, 11], [45.5, 15.0],steps,3);
}
}

module OpenSans_bottom_contour00x57_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([32.0, 29.0], [31, 33], [31, 35],steps,3);
	BezConic([31, 35], [31, 33], [30.0, 29.5],steps,3);
	BezConic([15, 21], [17, 14], [18, 9],steps,3);
	BezConic([18, 9], [18, 11], [18.5, 14.5],steps,3);
	BezConic([18.5, 14.5], [19, 18], [20, 20],steps,3);
	BezConic([42, 20], [43, 18], [43.5, 14.5],steps,3);
	BezConic([43.5, 14.5], [44, 11], [44, 9],steps,3);
	BezConic([45.5, 15.0], [46, 19], [47, 21],steps,3);
}
}

module OpenSans_bottom_contour00x57(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x57_skeleton();
			OpenSans_bottom_contour00x57_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x57_subtractive_curves(steps);
	}
}

module OpenSans_bottom_chunk10x57(steps=2) {
	difference() {
		OpenSans_bottom_contour00x57(steps);
		
	}
}

OpenSans_bottom_bbox0x57=[[0, 0], [62, 46]];

module OpenSans_bottom_letter0x57(detail=2) {
	OpenSans_bottom_chunk10x57(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x58_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[43, 0], [37.5, 0.0], [32, 0], 
		[26.5, 8.5], [21, 17], [15.5, 8.5], 
		[10, 0], [5.0, 0.0], [0, 0], 
		[7.5, 12.0], [15, 24], [8.0, 35.0], 
		[1, 46], [6.5, 46.0], [12, 46], 
		[17.0, 37.5], [22, 29], [26.5, 37.5], 
		[31, 46], [36.5, 46.0], [42, 46], 
		[34.5, 34.5], [27, 23], [35.0, 11.5], 
		 ]);
}

module OpenSans_bottom_contour00x58_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour00x58_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour00x58(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x58_skeleton();
			OpenSans_bottom_contour00x58_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x58_subtractive_curves(steps);
	}
}

module OpenSans_bottom_chunk10x58(steps=2) {
	difference() {
		OpenSans_bottom_contour00x58(steps);
		
	}
}

OpenSans_bottom_bbox0x58=[[0, 0], [43, 46]];

module OpenSans_bottom_letter0x58(detail=2) {
	OpenSans_bottom_chunk10x58(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x59_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[20, 27], [25.0, 36.5], [30, 46], 
		[35.0, 46.0], [40, 46], [32.5, 32.0], 
		[25, 18], [25.0, 9.0], [25, 0], 
		[20.0, 0.0], [15, 0], [15.0, 8.5], 
		[15, 17], [7.5, 31.5], [0, 46], 
		[5.5, 46.0], [11, 46], [15.5, 36.5], 
		 ]);
}

module OpenSans_bottom_contour00x59_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour00x59_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour00x59(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x59_skeleton();
			OpenSans_bottom_contour00x59_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x59_subtractive_curves(steps);
	}
}

module OpenSans_bottom_chunk10x59(steps=2) {
	difference() {
		OpenSans_bottom_contour00x59(steps);
		
	}
}

OpenSans_bottom_bbox0x59=[[0, 0], [40, 46]];

module OpenSans_bottom_letter0x59(detail=2) {
	OpenSans_bottom_chunk10x59(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x5a_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[36, 0], [19.0, 0.0], [2, 0], 
		[2.0, 3.0], [2, 6], [12.5, 22.0], 
		[23, 38], [12.5, 38.0], [2, 38], 
		[2.0, 42.0], [2, 46], [18.5, 46.0], 
		[35, 46], [35.0, 42.5], [35, 39], 
		[24.0, 23.5], [13, 8], [24.5, 8.0], 
		[36, 8],[36.0, 4.0], ]);
}

module OpenSans_bottom_contour00x5a_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour00x5a_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour00x5a(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x5a_skeleton();
			OpenSans_bottom_contour00x5a_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x5a_subtractive_curves(steps);
	}
}

module OpenSans_bottom_chunk10x5a(steps=2) {
	difference() {
		OpenSans_bottom_contour00x5a(steps);
		
	}
}

OpenSans_bottom_bbox0x5a=[[2, 0], [36, 46]];

module OpenSans_bottom_letter0x5a(detail=2) {
	OpenSans_bottom_chunk10x5a(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x5b_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[20, -10], [12.0, -10.0], [4, -10], 
		[4.0, 18.0], [4, 46], [12.0, 46.0], 
		[20, 46], [20.0, 42.5], [20, 39], 
		[16.5, 39.0], [13, 39], [13.0, 17.5], 
		[13, -4], [16.5, -4.0], [20, -4], 
		[20.0, -7.0], ]);
}

module OpenSans_bottom_contour00x5b_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour00x5b_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour00x5b(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x5b_skeleton();
			OpenSans_bottom_contour00x5b_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x5b_subtractive_curves(steps);
	}
}

module OpenSans_bottom_chunk10x5b(steps=2) {
	difference() {
		OpenSans_bottom_contour00x5b(steps);
		
	}
}

OpenSans_bottom_bbox0x5b=[[4, -10], [20, 46]];

module OpenSans_bottom_letter0x5b(detail=2) {
	OpenSans_bottom_chunk10x5b(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x5c_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[9, 46], [17.5, 23.0], [26, 0], 
		[21.5, 0.0], [17, 0], [8.5, 23.0], 
		[0, 46],[4.5, 46.0], ]);
}

module OpenSans_bottom_contour00x5c_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour00x5c_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour00x5c(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x5c_skeleton();
			OpenSans_bottom_contour00x5c_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x5c_subtractive_curves(steps);
	}
}

module OpenSans_bottom_chunk10x5c(steps=2) {
	difference() {
		OpenSans_bottom_contour00x5c(steps);
		
	}
}

OpenSans_bottom_bbox0x5c=[[0, 0], [26, 46]];

module OpenSans_bottom_letter0x5c(detail=2) {
	OpenSans_bottom_chunk10x5c(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x5d_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[2, -4], [5.5, -4.0], [9, -4], 
		[9.0, 17.5], [9, 39], [5.5, 39.0], 
		[2, 39], [2.0, 42.5], [2, 46], 
		[9.5, 46.0], [17, 46], [17.0, 18.0], 
		[17, -10], [9.5, -10.0], [2, -10], 
		[2.0, -7.0], ]);
}

module OpenSans_bottom_contour00x5d_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour00x5d_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour00x5d(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x5d_skeleton();
			OpenSans_bottom_contour00x5d_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x5d_subtractive_curves(steps);
	}
}

module OpenSans_bottom_chunk10x5d(steps=2) {
	difference() {
		OpenSans_bottom_contour00x5d(steps);
		
	}
}

OpenSans_bottom_bbox0x5d=[[2, -10], [17, 46]];

module OpenSans_bottom_letter0x5d(detail=2) {
	OpenSans_bottom_chunk10x5d(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x5e_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[0, 16], [7.0, 31.0], [14, 46], 
		[16.0, 46.0], [18, 46], [26.0, 31.0], 
		[34, 16], [30.0, 16.0], [26, 16], 
		[21.0, 26.0], [16, 36], [12.0, 26.0], 
		[8, 16],[4.0, 16.0], ]);
}

module OpenSans_bottom_contour00x5e_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour00x5e_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour00x5e(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x5e_skeleton();
			OpenSans_bottom_contour00x5e_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x5e_subtractive_curves(steps);
	}
}

module OpenSans_bottom_chunk10x5e(steps=2) {
	difference() {
		OpenSans_bottom_contour00x5e(steps);
		
	}
}

OpenSans_bottom_bbox0x5e=[[0, 16], [34, 46]];

module OpenSans_bottom_letter0x5e(detail=2) {
	OpenSans_bottom_chunk10x5e(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x5f_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[26, -10], [13.0, -10.0], [0, -10], 
		[0.0, -8.0], [0, -6], [13.0, -6.0], 
		[26, -6],[26.0, -8.0], ]);
}

module OpenSans_bottom_contour00x5f_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour00x5f_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour00x5f(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x5f_skeleton();
			OpenSans_bottom_contour00x5f_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x5f_subtractive_curves(steps);
	}
}

module OpenSans_bottom_chunk10x5f(steps=2) {
	difference() {
		OpenSans_bottom_contour00x5f(steps);
		
	}
}

OpenSans_bottom_bbox0x5f=[[0, -10], [26, -6]];

module OpenSans_bottom_letter0x5f(detail=2) {
	OpenSans_bottom_chunk10x5f(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x60_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[22, 39], [20, 40], [16.5, 43.0], 
		[13, 46], [10, 48], [10.0, 48.5], 
		[10, 49], [15.5, 49.0], [21, 49], 
		[23, 46], [28, 40], [28.0, 39.5], 
		[28, 39],[25.0, 39.0], ]);
}

module OpenSans_bottom_contour00x60_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([16.5, 43.0], [13, 46], [10, 48],steps,3);
	BezConic([21, 49], [23, 46], [28, 40],steps,3);
}
}

module OpenSans_bottom_contour00x60_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([22, 39], [20, 40], [16.5, 43.0],steps,3);
}
}

module OpenSans_bottom_contour00x60(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x60_skeleton();
			OpenSans_bottom_contour00x60_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x60_subtractive_curves(steps);
	}
}

module OpenSans_bottom_chunk10x60(steps=2) {
	difference() {
		OpenSans_bottom_contour00x60(steps);
		
	}
}

OpenSans_bottom_bbox0x60=[[10, 39], [28, 49]];

module OpenSans_bottom_letter0x60(detail=2) {
	OpenSans_bottom_chunk10x60(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x61_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[27, 0], [26.0, 2.5], [25, 5], 
		[25.0, 5.0], [25, 5], [23, 2], 
		[20.5, 0.5], [18, -1], [14, -1], 
		[8, -1], [5.5, 2.0], [3, 5], 
		[3, 10], [3, 16], [6.5, 18.5], 
		[10, 21], [18, 22], [21.0, 22.0], 
		[24, 22], [24.0, 22.5], [24, 23], 
		[24, 29], [19, 29], [15, 29], 
		[9, 26], [7.5, 29.5], [6, 33], 
		[12, 36], [19, 36], [26, 36], 
		[30.0, 33.0], [34, 30], [34, 23], 
		[34.0, 11.5], [34, 0], [30.5, 0.0], 
		 ]);
}

module OpenSans_bottom_contour00x61_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([24, 23], [24, 29], [19, 29],steps,3);
	BezConic([19, 29], [15, 29], [9, 26],steps,3);
}
}

module OpenSans_bottom_contour00x61_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([25, 5], [23, 2], [20.5, 0.5],steps,3);
	BezConic([20.5, 0.5], [18, -1], [14, -1],steps,3);
	BezConic([14, -1], [8, -1], [5.5, 2.0],steps,3);
	BezConic([5.5, 2.0], [3, 5], [3, 10],steps,3);
	BezConic([3, 10], [3, 16], [6.5, 18.5],steps,3);
	BezConic([6.5, 18.5], [10, 21], [18, 22],steps,3);
	BezConic([6, 33], [12, 36], [19, 36],steps,3);
	BezConic([19, 36], [26, 36], [30.0, 33.0],steps,3);
	BezConic([30.0, 33.0], [34, 30], [34, 23],steps,3);
}
}

module OpenSans_bottom_contour00x61(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x61_skeleton();
			OpenSans_bottom_contour00x61_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x61_subtractive_curves(steps);
	}
}

module OpenSans_bottom_contour10x61_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[24, 16], [22.5, 16.0], [21, 16], 
		[17, 16], [14.5, 14.5], [12, 13], 
		[12, 10], [12, 6], [17, 6], 
		[20, 6], [22.0, 8.0], [24, 10], 
		[24, 13],[24.0, 14.5], ]);
}

module OpenSans_bottom_contour10x61_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([21, 16], [17, 16], [14.5, 14.5],steps,3);
	BezConic([14.5, 14.5], [12, 13], [12, 10],steps,3);
	BezConic([12, 10], [12, 6], [17, 6],steps,3);
	BezConic([17, 6], [20, 6], [22.0, 8.0],steps,3);
	BezConic([22.0, 8.0], [24, 10], [24, 13],steps,3);
}
}

module OpenSans_bottom_contour10x61_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour10x61(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour10x61_skeleton();
			OpenSans_bottom_contour10x61_subtractive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour10x61_additive_curves(steps);
	}
}

module OpenSans_bottom_chunk10x61(steps=2) {
	difference() {
		OpenSans_bottom_contour00x61(steps);
		scale([1,1,1.1]) OpenSans_bottom_contour10x61(steps);
	}
}

OpenSans_bottom_bbox0x61=[[3, -1], [34, 36]];

module OpenSans_bottom_letter0x61(detail=2) {
	OpenSans_bottom_chunk10x61(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x62_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[24, 36], [31, 36], [34.5, 31.0], 
		[38, 26], [38, 18], [38, 9], 
		[34.0, 4.0], [30, -1], [24, -1], 
		[18, -1], [15, 4], [14.5, 4.0], 
		[14, 4], [13.0, 2.0], [12, 0], 
		[8.5, 0.0], [5, 0], [5.0, 24.5], 
		[5, 49], [10.0, 49.0], [15, 49], 
		[15.0, 43.0], [15, 37], [15, 35], 
		[14, 30], [14.5, 30.0], [15, 30], 
		[18, 36], ]);
}

module OpenSans_bottom_contour00x62_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour00x62_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([24, 36], [31, 36], [34.5, 31.0],steps,3);
	BezConic([34.5, 31.0], [38, 26], [38, 18],steps,3);
	BezConic([38, 18], [38, 9], [34.0, 4.0],steps,3);
	BezConic([34.0, 4.0], [30, -1], [24, -1],steps,3);
	BezConic([24, -1], [18, -1], [15, 4],steps,3);
	BezConic([15, 37], [15, 35], [14, 30],steps,3);
	BezConic([15, 30], [18, 36], [24, 36],steps,3);
}
}

module OpenSans_bottom_contour00x62(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x62_skeleton();
			OpenSans_bottom_contour00x62_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x62_subtractive_curves(steps);
	}
}

module OpenSans_bottom_contour10x62_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[21, 28], [18, 28], [16.5, 26.0], 
		[15, 24], [15, 19], [15.0, 18.5], 
		[15, 18], [15, 12], [16.5, 9.5], 
		[18, 7], [22, 7], [24, 7], 
		[26.0, 10.0], [28, 13], [28, 18], 
		[28, 23], [26.0, 25.5], [24, 28], 
		 ]);
}

module OpenSans_bottom_contour10x62_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([21, 28], [18, 28], [16.5, 26.0],steps,3);
	BezConic([16.5, 26.0], [15, 24], [15, 19],steps,3);
	BezConic([15, 18], [15, 12], [16.5, 9.5],steps,3);
	BezConic([16.5, 9.5], [18, 7], [22, 7],steps,3);
	BezConic([22, 7], [24, 7], [26.0, 10.0],steps,3);
	BezConic([26.0, 10.0], [28, 13], [28, 18],steps,3);
	BezConic([28, 18], [28, 23], [26.0, 25.5],steps,3);
	BezConic([26.0, 25.5], [24, 28], [21, 28],steps,3);
}
}

module OpenSans_bottom_contour10x62_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour10x62(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour10x62_skeleton();
			OpenSans_bottom_contour10x62_subtractive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour10x62_additive_curves(steps);
	}
}

module OpenSans_bottom_chunk10x62(steps=2) {
	difference() {
		OpenSans_bottom_contour00x62(steps);
		scale([1,1,1.1]) OpenSans_bottom_contour10x62(steps);
	}
}

OpenSans_bottom_bbox0x62=[[5, -1], [38, 49]];

module OpenSans_bottom_letter0x62(detail=2) {
	OpenSans_bottom_chunk10x62(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x63_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[19, -1], [3, -1], [3, 17], 
		[3, 26], [7.5, 31.0], [12, 36], 
		[20, 36], [26, 36], [31, 33], 
		[29.5, 29.5], [28, 26], [26, 27], 
		[24.0, 27.5], [22, 28], [20, 28], 
		[13, 28], [13, 17], [13, 7], 
		[20, 7], [23, 7], [25.0, 8.0], 
		[27, 9], [30, 10], [30.0, 6.0], 
		[30, 2], [28, 1], [25.5, 0.0], 
		[23, -1], ]);
}

module OpenSans_bottom_contour00x63_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([28, 26], [26, 27], [24.0, 27.5],steps,3);
	BezConic([24.0, 27.5], [22, 28], [20, 28],steps,3);
	BezConic([20, 28], [13, 28], [13, 17],steps,3);
	BezConic([13, 17], [13, 7], [20, 7],steps,3);
	BezConic([20, 7], [23, 7], [25.0, 8.0],steps,3);
}
}

module OpenSans_bottom_contour00x63_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([19, -1], [3, -1], [3, 17],steps,3);
	BezConic([3, 17], [3, 26], [7.5, 31.0],steps,3);
	BezConic([7.5, 31.0], [12, 36], [20, 36],steps,3);
	BezConic([20, 36], [26, 36], [31, 33],steps,3);
	BezConic([25.0, 8.0], [27, 9], [30, 10],steps,3);
	BezConic([30, 2], [28, 1], [25.5, 0.0],steps,3);
	BezConic([25.5, 0.0], [23, -1], [19, -1],steps,3);
}
}

module OpenSans_bottom_contour00x63(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x63_skeleton();
			OpenSans_bottom_contour00x63_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x63_subtractive_curves(steps);
	}
}

module OpenSans_bottom_chunk10x63(steps=2) {
	difference() {
		OpenSans_bottom_contour00x63(steps);
		
	}
}

OpenSans_bottom_bbox0x63=[[3, -1], [31, 36]];

module OpenSans_bottom_letter0x63(detail=2) {
	OpenSans_bottom_chunk10x63(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x64_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[16, -1], [10, -1], [6.5, 4.0], 
		[3, 9], [3, 17], [3, 26], 
		[6.5, 31.0], [10, 36], [16, 36], 
		[23, 36], [26, 30], [26.5, 30.0], 
		[27, 30], [26, 34], [26, 37], 
		[26.0, 43.0], [26, 49], [31.0, 49.0], 
		[36, 49], [36.0, 24.5], [36, 0], 
		[32.0, 0.0], [28, 0], [27.0, 2.5], 
		[26, 5], [26.0, 5.0], [26, 5], 
		[23, -1], ]);
}

module OpenSans_bottom_contour00x64_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour00x64_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([16, -1], [10, -1], [6.5, 4.0],steps,3);
	BezConic([6.5, 4.0], [3, 9], [3, 17],steps,3);
	BezConic([3, 17], [3, 26], [6.5, 31.0],steps,3);
	BezConic([6.5, 31.0], [10, 36], [16, 36],steps,3);
	BezConic([16, 36], [23, 36], [26, 30],steps,3);
	BezConic([27, 30], [26, 34], [26, 37],steps,3);
	BezConic([26, 5], [23, -1], [16, -1],steps,3);
}
}

module OpenSans_bottom_contour00x64(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x64_skeleton();
			OpenSans_bottom_contour00x64_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x64_subtractive_curves(steps);
	}
}

module OpenSans_bottom_contour10x64_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[19, 7], [23, 7], [24.5, 9.0], 
		[26, 11], [27, 16], [27.0, 16.5], 
		[27, 17], [27, 23], [25.0, 25.5], 
		[23, 28], [19, 28], [16, 28], 
		[14.5, 25.0], [13, 22], [13, 17], 
		[13, 12], [14.5, 9.5], [16, 7], 
		 ]);
}

module OpenSans_bottom_contour10x64_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([19, 7], [23, 7], [24.5, 9.0],steps,3);
	BezConic([24.5, 9.0], [26, 11], [27, 16],steps,3);
	BezConic([27, 17], [27, 23], [25.0, 25.5],steps,3);
	BezConic([25.0, 25.5], [23, 28], [19, 28],steps,3);
	BezConic([19, 28], [16, 28], [14.5, 25.0],steps,3);
	BezConic([14.5, 25.0], [13, 22], [13, 17],steps,3);
	BezConic([13, 17], [13, 12], [14.5, 9.5],steps,3);
	BezConic([14.5, 9.5], [16, 7], [19, 7],steps,3);
}
}

module OpenSans_bottom_contour10x64_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour10x64(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour10x64_skeleton();
			OpenSans_bottom_contour10x64_subtractive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour10x64_additive_curves(steps);
	}
}

module OpenSans_bottom_chunk10x64(steps=2) {
	difference() {
		OpenSans_bottom_contour00x64(steps);
		scale([1,1,1.1]) OpenSans_bottom_contour10x64(steps);
	}
}

OpenSans_bottom_bbox0x64=[[3, -1], [36, 49]];

module OpenSans_bottom_letter0x64(detail=2) {
	OpenSans_bottom_chunk10x64(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x65_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[19, 29], [16, 29], [14.5, 27.0], 
		[13, 25], [13, 21], [19.5, 21.0], 
		[26, 21], [26, 25], [24.5, 27.0], 
		[23, 29], ]);
}

module OpenSans_bottom_contour00x65_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([19, 29], [16, 29], [14.5, 27.0],steps,3);
	BezConic([14.5, 27.0], [13, 25], [13, 21],steps,3);
	BezConic([26, 21], [26, 25], [24.5, 27.0],steps,3);
	BezConic([24.5, 27.0], [23, 29], [19, 29],steps,3);
}
}

module OpenSans_bottom_contour00x65_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour00x65(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x65_skeleton();
			OpenSans_bottom_contour00x65_subtractive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x65_additive_curves(steps);
	}
}

module OpenSans_bottom_contour10x65_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[21, -1], [12, -1], [7.5, 4.0], 
		[3, 9], [3, 17], [3, 26], 
		[7.5, 31.0], [12, 36], [19, 36], 
		[27, 36], [31.0, 31.5], [35, 27], 
		[35, 20], [35.0, 17.5], [35, 15], 
		[24.0, 15.0], [13, 15], [13, 11], 
		[15.0, 8.5], [17, 6], [21, 6], 
		[24, 6], [27.0, 7.0], [30, 8], 
		[33, 9], [33.0, 5.5], [33, 2], 
		[31, 1], [28.0, 0.0], [25, -1], 
		 ]);
}

module OpenSans_bottom_contour10x65_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([13, 15], [13, 11], [15.0, 8.5],steps,3);
	BezConic([15.0, 8.5], [17, 6], [21, 6],steps,3);
	BezConic([21, 6], [24, 6], [27.0, 7.0],steps,3);
	BezConic([27.0, 7.0], [30, 8], [33, 9],steps,3);
}
}

module OpenSans_bottom_contour10x65_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([21, -1], [12, -1], [7.5, 4.0],steps,3);
	BezConic([7.5, 4.0], [3, 9], [3, 17],steps,3);
	BezConic([3, 17], [3, 26], [7.5, 31.0],steps,3);
	BezConic([7.5, 31.0], [12, 36], [19, 36],steps,3);
	BezConic([19, 36], [27, 36], [31.0, 31.5],steps,3);
	BezConic([31.0, 31.5], [35, 27], [35, 20],steps,3);
	BezConic([33, 2], [31, 1], [28.0, 0.0],steps,3);
	BezConic([28.0, 0.0], [25, -1], [21, -1],steps,3);
}
}

module OpenSans_bottom_contour10x65(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour10x65_skeleton();
			OpenSans_bottom_contour10x65_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour10x65_subtractive_curves(steps);
	}
}

module OpenSans_bottom_chunk00x65(steps=2) {
	difference() {
		
		scale([1,1,1.1]) OpenSans_bottom_contour00x65(steps);
	}
}

module OpenSans_bottom_chunk10x65(steps=2) {
	difference() {
		OpenSans_bottom_contour10x65(steps);
		
	}
}

OpenSans_bottom_bbox0x65=[[3, -1], [35, 36]];

module OpenSans_bottom_letter0x65(detail=2) {
	OpenSans_bottom_chunk00x65(steps=detail);
	OpenSans_bottom_chunk10x65(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x66_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[24, 28], [20.0, 28.0], [16, 28], 
		[16.0, 14.0], [16, 0], [11.5, 0.0], 
		[7, 0], [7.0, 14.0], [7, 28], 
		[4.0, 28.0], [1, 28], [1.0, 30.0], 
		[1, 32], [4.0, 33.5], [7, 35], 
		[7.0, 36.5], [7, 38], [7, 43], 
		[9.5, 46.0], [12, 49], [19, 49], 
		[24, 49], [28, 48], [26.5, 44.5], 
		[25, 41], [22, 41], [20, 41], 
		[18, 41], [17.0, 40.0], [16, 39], 
		[16, 37], [16.0, 36.0], [16, 35], 
		[20.0, 35.0], [24, 35], [24.0, 31.5], 
		 ]);
}

module OpenSans_bottom_contour00x66_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([25, 41], [22, 41], [20, 41],steps,3);
	BezConic([20, 41], [18, 41], [17.0, 40.0],steps,3);
	BezConic([17.0, 40.0], [16, 39], [16, 37],steps,3);
}
}

module OpenSans_bottom_contour00x66_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([7, 38], [7, 43], [9.5, 46.0],steps,3);
	BezConic([9.5, 46.0], [12, 49], [19, 49],steps,3);
	BezConic([19, 49], [24, 49], [28, 48],steps,3);
}
}

module OpenSans_bottom_contour00x66(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x66_skeleton();
			OpenSans_bottom_contour00x66_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x66_subtractive_curves(steps);
	}
}

module OpenSans_bottom_chunk10x66(steps=2) {
	difference() {
		OpenSans_bottom_contour00x66(steps);
		
	}
}

OpenSans_bottom_bbox0x66=[[1, 0], [28, 49]];

module OpenSans_bottom_letter0x66(detail=2) {
	OpenSans_bottom_chunk10x66(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x67_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[35, 35], [35.0, 32.5], [35, 30], 
		[32.5, 29.5], [30, 29], [31, 26], 
		[31, 23], [31, 18], [27.5, 15.0], 
		[24, 12], [17, 12], [16.0, 12.0], 
		[15, 12], [14.5, 12.0], [14, 12], 
		[12, 11], [12, 9], [12, 7], 
		[17, 7], [20.0, 7.0], [23, 7], 
		[29, 7], [32.0, 4.5], [35, 2], 
		[35, -3], [35, -9], [30.0, -12.0], 
		[25, -15], [15, -15], [8, -15], 
		[4.0, -12.5], [0, -10], [0, -6], 
		[0, -3], [2.0, -0.5], [4, 2], 
		[8, 3], [6, 3], [5.0, 4.5], 
		[4, 6], [4, 8], [4, 10], 
		[5.5, 11.0], [7, 12], [9, 14], 
		[6, 15], [4.5, 17.5], [3, 20], 
		[3, 24], [3, 29], [6.5, 32.5], 
		[10, 36], [17, 36], [19, 36], 
		[21.0, 35.5], [23, 35], [23, 35], 
		[29.0, 35.0], ]);
}

module OpenSans_bottom_contour00x67_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([14, 12], [12, 11], [12, 9],steps,3);
	BezConic([12, 9], [12, 7], [17, 7],steps,3);
	BezConic([5.5, 11.0], [7, 12], [9, 14],steps,3);
	BezConic([21.0, 35.5], [23, 35], [23, 35],steps,3);
}
}

module OpenSans_bottom_contour00x67_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([30, 29], [31, 26], [31, 23],steps,3);
	BezConic([31, 23], [31, 18], [27.5, 15.0],steps,3);
	BezConic([27.5, 15.0], [24, 12], [17, 12],steps,3);
	BezConic([23, 7], [29, 7], [32.0, 4.5],steps,3);
	BezConic([32.0, 4.5], [35, 2], [35, -3],steps,3);
	BezConic([35, -3], [35, -9], [30.0, -12.0],steps,3);
	BezConic([30.0, -12.0], [25, -15], [15, -15],steps,3);
	BezConic([15, -15], [8, -15], [4.0, -12.5],steps,3);
	BezConic([4.0, -12.5], [0, -10], [0, -6],steps,3);
	BezConic([0, -6], [0, -3], [2.0, -0.5],steps,3);
	BezConic([2.0, -0.5], [4, 2], [8, 3],steps,3);
	BezConic([8, 3], [6, 3], [5.0, 4.5],steps,3);
	BezConic([5.0, 4.5], [4, 6], [4, 8],steps,3);
	BezConic([4, 8], [4, 10], [5.5, 11.0],steps,3);
	BezConic([9, 14], [6, 15], [4.5, 17.5],steps,3);
	BezConic([4.5, 17.5], [3, 20], [3, 24],steps,3);
	BezConic([3, 24], [3, 29], [6.5, 32.5],steps,3);
	BezConic([6.5, 32.5], [10, 36], [17, 36],steps,3);
	BezConic([17, 36], [19, 36], [21.0, 35.5],steps,3);
}
}

module OpenSans_bottom_contour00x67(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x67_skeleton();
			OpenSans_bottom_contour00x67_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x67_subtractive_curves(steps);
	}
}

module OpenSans_bottom_contour10x67_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[8, -5], [8, -7], [10.0, -8.0], 
		[12, -9], [16, -9], [21, -9], 
		[24.0, -7.5], [27, -6], [27, -4], 
		[27, -2], [25.0, -1.0], [23, 0], 
		[20, 0], [17.5, 0.0], [15, 0], 
		[12, 0], [10.0, -1.5], [8, -3], 
		 ]);
}

module OpenSans_bottom_contour10x67_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([8, -5], [8, -7], [10.0, -8.0],steps,3);
	BezConic([10.0, -8.0], [12, -9], [16, -9],steps,3);
	BezConic([16, -9], [21, -9], [24.0, -7.5],steps,3);
	BezConic([24.0, -7.5], [27, -6], [27, -4],steps,3);
	BezConic([27, -4], [27, -2], [25.0, -1.0],steps,3);
	BezConic([25.0, -1.0], [23, 0], [20, 0],steps,3);
	BezConic([15, 0], [12, 0], [10.0, -1.5],steps,3);
	BezConic([10.0, -1.5], [8, -3], [8, -5],steps,3);
}
}

module OpenSans_bottom_contour10x67_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour10x67(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour10x67_skeleton();
			OpenSans_bottom_contour10x67_subtractive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour10x67_additive_curves(steps);
	}
}

module OpenSans_bottom_contour20x67_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[12, 24], [12, 21], [13.5, 19.0], 
		[15, 17], [17, 17], [20, 17], 
		[21.0, 19.0], [22, 21], [22, 24], 
		[22, 30], [17, 30], [12, 30], 
		 ]);
}

module OpenSans_bottom_contour20x67_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([12, 24], [12, 21], [13.5, 19.0],steps,3);
	BezConic([13.5, 19.0], [15, 17], [17, 17],steps,3);
	BezConic([17, 17], [20, 17], [21.0, 19.0],steps,3);
	BezConic([21.0, 19.0], [22, 21], [22, 24],steps,3);
	BezConic([22, 24], [22, 30], [17, 30],steps,3);
	BezConic([17, 30], [12, 30], [12, 24],steps,3);
}
}

module OpenSans_bottom_contour20x67_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour20x67(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour20x67_skeleton();
			OpenSans_bottom_contour20x67_subtractive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour20x67_additive_curves(steps);
	}
}

module OpenSans_bottom_chunk10x67(steps=2) {
	difference() {
		OpenSans_bottom_contour00x67(steps);
		scale([1,1,1.1]) OpenSans_bottom_contour10x67(steps);
	scale([1,1,1.1]) OpenSans_bottom_contour20x67(steps);
	}
}

OpenSans_bottom_bbox0x67=[[0, -15], [35, 36]];

module OpenSans_bottom_letter0x67(detail=2) {
	OpenSans_bottom_chunk10x67(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x68_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[37, 0], [32.5, 0.0], [28, 0], 
		[28.0, 10.0], [28, 20], [28, 28], 
		[22, 28], [18, 28], [16.5, 25.5], 
		[15, 23], [15, 16], [15.0, 8.0], 
		[15, 0], [10.0, 0.0], [5, 0], 
		[5.0, 24.5], [5, 49], [10.0, 49.0], 
		[15, 49], [15.0, 44.0], [15, 39], 
		[15, 38], [14, 33], [14.0, 31.5], 
		[14, 30], [14.5, 30.0], [15, 30], 
		[18, 36], [25, 36], [31, 36], 
		[34.0, 32.5], [37, 29], [37, 23], 
		[37.0, 11.5], ]);
}

module OpenSans_bottom_contour00x68_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([28, 20], [28, 28], [22, 28],steps,3);
	BezConic([22, 28], [18, 28], [16.5, 25.5],steps,3);
	BezConic([16.5, 25.5], [15, 23], [15, 16],steps,3);
}
}

module OpenSans_bottom_contour00x68_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([15, 39], [15, 38], [14, 33],steps,3);
	BezConic([15, 30], [18, 36], [25, 36],steps,3);
	BezConic([25, 36], [31, 36], [34.0, 32.5],steps,3);
	BezConic([34.0, 32.5], [37, 29], [37, 23],steps,3);
}
}

module OpenSans_bottom_contour00x68(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x68_skeleton();
			OpenSans_bottom_contour00x68_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x68_subtractive_curves(steps);
	}
}

module OpenSans_bottom_chunk10x68(steps=2) {
	difference() {
		OpenSans_bottom_contour00x68(steps);
		
	}
}

OpenSans_bottom_bbox0x68=[[5, 0], [37, 49]];

module OpenSans_bottom_letter0x68(detail=2) {
	OpenSans_bottom_chunk10x68(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x69_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[5, 44], [5, 49], [10, 49], 
		[15, 49], [15, 44], [15, 42], 
		[13.5, 40.5], [12, 39], [10, 39], 
		[5, 39], ]);
}

module OpenSans_bottom_contour00x69_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour00x69_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([5, 44], [5, 49], [10, 49],steps,3);
	BezConic([10, 49], [15, 49], [15, 44],steps,3);
	BezConic([15, 44], [15, 42], [13.5, 40.5],steps,3);
	BezConic([13.5, 40.5], [12, 39], [10, 39],steps,3);
	BezConic([10, 39], [5, 39], [5, 44],steps,3);
}
}

module OpenSans_bottom_contour00x69(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x69_skeleton();
			OpenSans_bottom_contour00x69_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x69_subtractive_curves(steps);
	}
}

module OpenSans_bottom_contour10x69_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[15, 0], [10.0, 0.0], [5, 0], 
		[5.0, 17.5], [5, 35], [10.0, 35.0], 
		[15, 35],[15.0, 17.5], ]);
}

module OpenSans_bottom_contour10x69_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour10x69_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour10x69(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour10x69_skeleton();
			OpenSans_bottom_contour10x69_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour10x69_subtractive_curves(steps);
	}
}

module OpenSans_bottom_chunk10x69(steps=2) {
	difference() {
		OpenSans_bottom_contour00x69(steps);
		
	}
}

module OpenSans_bottom_chunk20x69(steps=2) {
	difference() {
		OpenSans_bottom_contour10x69(steps);
		
	}
}

OpenSans_bottom_bbox0x69=[[5, 0], [15, 49]];

module OpenSans_bottom_letter0x69(detail=2) {
	OpenSans_bottom_chunk10x69(steps=detail);
	OpenSans_bottom_chunk20x69(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x6a_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[2, -15], [-1, -15], [-4, -15], 
		[-4.0, -11.0], [-4, -7], [-2, -8], 
		[0, -8], [3, -8], [4.0, -6.5], 
		[5, -5], [5, -2], [5.0, 16.5], 
		[5, 35], [10.0, 35.0], [15, 35], 
		[15.0, 15.5], [15, -4], [15, -9], 
		[11.5, -12.0],[8, -15], ]);
}

module OpenSans_bottom_contour00x6a_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([2, -15], [-1, -15], [-4, -15],steps,3);
	BezConic([-4, -7], [-2, -8], [0, -8],steps,3);
	BezConic([0, -8], [3, -8], [4.0, -6.5],steps,3);
	BezConic([4.0, -6.5], [5, -5], [5, -2],steps,3);
}
}

module OpenSans_bottom_contour00x6a_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([15, -4], [15, -9], [11.5, -12.0],steps,3);
	BezConic([11.5, -12.0], [8, -15], [2, -15],steps,3);
}
}

module OpenSans_bottom_contour00x6a(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x6a_skeleton();
			OpenSans_bottom_contour00x6a_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x6a_subtractive_curves(steps);
	}
}

module OpenSans_bottom_contour10x6a_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[5, 44], [5, 49], [10, 49], 
		[15, 49], [15, 44], [15, 42], 
		[13.5, 40.5], [12, 39], [10, 39], 
		[5, 39], ]);
}

module OpenSans_bottom_contour10x6a_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour10x6a_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([5, 44], [5, 49], [10, 49],steps,3);
	BezConic([10, 49], [15, 49], [15, 44],steps,3);
	BezConic([15, 44], [15, 42], [13.5, 40.5],steps,3);
	BezConic([13.5, 40.5], [12, 39], [10, 39],steps,3);
	BezConic([10, 39], [5, 39], [5, 44],steps,3);
}
}

module OpenSans_bottom_contour10x6a(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour10x6a_skeleton();
			OpenSans_bottom_contour10x6a_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour10x6a_subtractive_curves(steps);
	}
}

module OpenSans_bottom_chunk10x6a(steps=2) {
	difference() {
		OpenSans_bottom_contour00x6a(steps);
		
	}
}

module OpenSans_bottom_chunk20x6a(steps=2) {
	difference() {
		OpenSans_bottom_contour10x6a(steps);
		
	}
}

OpenSans_bottom_bbox0x6a=[[-4, -15], [15, 49]];

module OpenSans_bottom_letter0x6a(detail=2) {
	OpenSans_bottom_chunk10x6a(steps=detail);
	OpenSans_bottom_chunk20x6a(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x6b_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[14, 19], [16.0, 21.5], [18, 24], 
		[23.0, 29.5], [28, 35], [33.5, 35.0], 
		[39, 35], [32.0, 27.5], [25, 20], 
		[32.5, 10.0], [40, 0], [34.5, 0.0], 
		[29, 0], [24.0, 7.0], [19, 14], 
		[17.0, 12.5], [15, 11], [15.0, 5.5], 
		[15, 0], [10.0, 0.0], [5, 0], 
		[5.0, 24.5], [5, 49], [10.0, 49.0], 
		[15, 49], [15.0, 38.0], [15, 27], 
		[14.5, 23.0], [14, 19], [14.0, 19.0], 
		 ]);
}

module OpenSans_bottom_contour00x6b_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour00x6b_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour00x6b(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x6b_skeleton();
			OpenSans_bottom_contour00x6b_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x6b_subtractive_curves(steps);
	}
}

module OpenSans_bottom_chunk10x6b(steps=2) {
	difference() {
		OpenSans_bottom_contour00x6b(steps);
		
	}
}

OpenSans_bottom_bbox0x6b=[[5, 0], [40, 49]];

module OpenSans_bottom_letter0x6b(detail=2) {
	OpenSans_bottom_chunk10x6b(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x6c_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[15, 0], [10.0, 0.0], [5, 0], 
		[5.0, 24.5], [5, 49], [10.0, 49.0], 
		[15, 49],[15.0, 24.5], ]);
}

module OpenSans_bottom_contour00x6c_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour00x6c_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour00x6c(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x6c_skeleton();
			OpenSans_bottom_contour00x6c_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x6c_subtractive_curves(steps);
	}
}

module OpenSans_bottom_chunk10x6c(steps=2) {
	difference() {
		OpenSans_bottom_contour00x6c(steps);
		
	}
}

OpenSans_bottom_bbox0x6c=[[5, 0], [15, 49]];

module OpenSans_bottom_letter0x6c(detail=2) {
	OpenSans_bottom_chunk10x6c(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x6d_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[36, 0], [31.5, 0.0], [27, 0], 
		[27.0, 10.0], [27, 20], [27, 24], 
		[25.5, 26.0], [24, 28], [22, 28], 
		[18, 28], [16.5, 25.5], [15, 23], 
		[15, 16], [15.0, 8.0], [15, 0], 
		[10.0, 0.0], [5, 0], [5.0, 17.5], 
		[5, 35], [8.5, 35.0], [12, 35], 
		[13.0, 32.5], [14, 30], [14.0, 30.0], 
		[14, 30], [16, 33], [18.5, 34.5], 
		[21, 36], [24, 36], [32, 36], 
		[35, 30], [35.5, 30.0], [36, 30], 
		[37, 33], [40.0, 34.5], [43, 36], 
		[46, 36], [52, 36], [55.0, 33.0], 
		[58, 30], [58, 23], [58.0, 11.5], 
		[58, 0], [53.5, 0.0], [49, 0], 
		[49.0, 10.0], [49, 20], [49, 24], 
		[47.5, 26.0], [46, 28], [43, 28], 
		[40, 28], [38.0, 25.5], [36, 23], 
		[36, 18],[36.0, 9.0], ]);
}

module OpenSans_bottom_contour00x6d_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([27, 20], [27, 24], [25.5, 26.0],steps,3);
	BezConic([25.5, 26.0], [24, 28], [22, 28],steps,3);
	BezConic([22, 28], [18, 28], [16.5, 25.5],steps,3);
	BezConic([16.5, 25.5], [15, 23], [15, 16],steps,3);
	BezConic([49, 20], [49, 24], [47.5, 26.0],steps,3);
	BezConic([47.5, 26.0], [46, 28], [43, 28],steps,3);
	BezConic([43, 28], [40, 28], [38.0, 25.5],steps,3);
	BezConic([38.0, 25.5], [36, 23], [36, 18],steps,3);
}
}

module OpenSans_bottom_contour00x6d_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([14, 30], [16, 33], [18.5, 34.5],steps,3);
	BezConic([18.5, 34.5], [21, 36], [24, 36],steps,3);
	BezConic([24, 36], [32, 36], [35, 30],steps,3);
	BezConic([36, 30], [37, 33], [40.0, 34.5],steps,3);
	BezConic([40.0, 34.5], [43, 36], [46, 36],steps,3);
	BezConic([46, 36], [52, 36], [55.0, 33.0],steps,3);
	BezConic([55.0, 33.0], [58, 30], [58, 23],steps,3);
}
}

module OpenSans_bottom_contour00x6d(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x6d_skeleton();
			OpenSans_bottom_contour00x6d_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x6d_subtractive_curves(steps);
	}
}

module OpenSans_bottom_chunk10x6d(steps=2) {
	difference() {
		OpenSans_bottom_contour00x6d(steps);
		
	}
}

OpenSans_bottom_bbox0x6d=[[5, 0], [58, 36]];

module OpenSans_bottom_letter0x6d(detail=2) {
	OpenSans_bottom_chunk10x6d(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x6e_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[37, 0], [32.5, 0.0], [28, 0], 
		[28.0, 10.0], [28, 20], [28, 24], 
		[26.5, 26.0], [25, 28], [22, 28], 
		[18, 28], [16.5, 25.5], [15, 23], 
		[15, 16], [15.0, 8.0], [15, 0], 
		[10.0, 0.0], [5, 0], [5.0, 17.5], 
		[5, 35], [8.5, 35.0], [12, 35], 
		[13.0, 32.5], [14, 30], [14.0, 30.0], 
		[14, 30], [16, 33], [18.5, 34.5], 
		[21, 36], [25, 36], [31, 36], 
		[34.0, 32.5], [37, 29], [37, 23], 
		[37.0, 11.5], ]);
}

module OpenSans_bottom_contour00x6e_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([28, 20], [28, 24], [26.5, 26.0],steps,3);
	BezConic([26.5, 26.0], [25, 28], [22, 28],steps,3);
	BezConic([22, 28], [18, 28], [16.5, 25.5],steps,3);
	BezConic([16.5, 25.5], [15, 23], [15, 16],steps,3);
}
}

module OpenSans_bottom_contour00x6e_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([14, 30], [16, 33], [18.5, 34.5],steps,3);
	BezConic([18.5, 34.5], [21, 36], [25, 36],steps,3);
	BezConic([25, 36], [31, 36], [34.0, 32.5],steps,3);
	BezConic([34.0, 32.5], [37, 29], [37, 23],steps,3);
}
}

module OpenSans_bottom_contour00x6e(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x6e_skeleton();
			OpenSans_bottom_contour00x6e_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x6e_subtractive_curves(steps);
	}
}

module OpenSans_bottom_chunk10x6e(steps=2) {
	difference() {
		OpenSans_bottom_contour00x6e(steps);
		
	}
}

OpenSans_bottom_bbox0x6e=[[5, 0], [37, 36]];

module OpenSans_bottom_letter0x6e(detail=2) {
	OpenSans_bottom_chunk10x6e(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x6f_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[13, 18], [13, 12], [14.5, 9.5], 
		[16, 7], [20, 7], [24, 7], 
		[25.5, 9.5], [27, 12], [27, 18], 
		[27, 23], [25.5, 25.5], [24, 28], 
		[20, 28], [16, 28], [14.5, 25.5], 
		[13, 23], ]);
}

module OpenSans_bottom_contour00x6f_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([13, 18], [13, 12], [14.5, 9.5],steps,3);
	BezConic([14.5, 9.5], [16, 7], [20, 7],steps,3);
	BezConic([20, 7], [24, 7], [25.5, 9.5],steps,3);
	BezConic([25.5, 9.5], [27, 12], [27, 18],steps,3);
	BezConic([27, 18], [27, 23], [25.5, 25.5],steps,3);
	BezConic([25.5, 25.5], [24, 28], [20, 28],steps,3);
	BezConic([20, 28], [16, 28], [14.5, 25.5],steps,3);
	BezConic([14.5, 25.5], [13, 23], [13, 18],steps,3);
}
}

module OpenSans_bottom_contour00x6f_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour00x6f(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x6f_skeleton();
			OpenSans_bottom_contour00x6f_subtractive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x6f_additive_curves(steps);
	}
}

module OpenSans_bottom_contour10x6f_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[37, 18], [37, 9], [32.5, 4.0], 
		[28, -1], [20, -1], [15, -1], 
		[11.0, 1.5], [7, 4], [5.0, 8.0], 
		[3, 12], [3, 18], [3, 26], 
		[7.5, 31.0], [12, 36], [20, 36], 
		[25, 36], [29.0, 33.5], [33, 31], 
		[35.0, 27.0],[37, 23], ]);
}

module OpenSans_bottom_contour10x6f_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour10x6f_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([37, 18], [37, 9], [32.5, 4.0],steps,3);
	BezConic([32.5, 4.0], [28, -1], [20, -1],steps,3);
	BezConic([20, -1], [15, -1], [11.0, 1.5],steps,3);
	BezConic([11.0, 1.5], [7, 4], [5.0, 8.0],steps,3);
	BezConic([5.0, 8.0], [3, 12], [3, 18],steps,3);
	BezConic([3, 18], [3, 26], [7.5, 31.0],steps,3);
	BezConic([7.5, 31.0], [12, 36], [20, 36],steps,3);
	BezConic([20, 36], [25, 36], [29.0, 33.5],steps,3);
	BezConic([29.0, 33.5], [33, 31], [35.0, 27.0],steps,3);
	BezConic([35.0, 27.0], [37, 23], [37, 18],steps,3);
}
}

module OpenSans_bottom_contour10x6f(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour10x6f_skeleton();
			OpenSans_bottom_contour10x6f_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour10x6f_subtractive_curves(steps);
	}
}

module OpenSans_bottom_chunk00x6f(steps=2) {
	difference() {
		
		scale([1,1,1.1]) OpenSans_bottom_contour00x6f(steps);
	}
}

module OpenSans_bottom_chunk10x6f(steps=2) {
	difference() {
		OpenSans_bottom_contour10x6f(steps);
		
	}
}

OpenSans_bottom_bbox0x6f=[[3, -1], [37, 36]];

module OpenSans_bottom_letter0x6f(detail=2) {
	OpenSans_bottom_chunk00x6f(steps=detail);
	OpenSans_bottom_chunk10x6f(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x70_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[24, -1], [18, -1], [15, 4], 
		[14.5, 4.0], [14, 4], [15, -1], 
		[15, -1], [15.0, -8.0], [15, -15], 
		[10.0, -15.0], [5, -15], [5.0, 10.0], 
		[5, 35], [9.0, 35.0], [13, 35], 
		[13.5, 32.5], [14, 30], [14.5, 30.0], 
		[15, 30], [18, 36], [24, 36], 
		[31, 36], [34.5, 31.0], [38, 26], 
		[38, 18], [38, 12], [36.0, 8.0], 
		[34, 4], [31.0, 1.5], [28, -1], 
		 ]);
}

module OpenSans_bottom_contour00x70_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([14, 4], [15, -1], [15, -1],steps,3);
}
}

module OpenSans_bottom_contour00x70_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([24, -1], [18, -1], [15, 4],steps,3);
	BezConic([15, 30], [18, 36], [24, 36],steps,3);
	BezConic([24, 36], [31, 36], [34.5, 31.0],steps,3);
	BezConic([34.5, 31.0], [38, 26], [38, 18],steps,3);
	BezConic([38, 18], [38, 12], [36.0, 8.0],steps,3);
	BezConic([36.0, 8.0], [34, 4], [31.0, 1.5],steps,3);
	BezConic([31.0, 1.5], [28, -1], [24, -1],steps,3);
}
}

module OpenSans_bottom_contour00x70(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x70_skeleton();
			OpenSans_bottom_contour00x70_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x70_subtractive_curves(steps);
	}
}

module OpenSans_bottom_contour10x70_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[21, 28], [18, 28], [16.5, 26.0], 
		[15, 24], [15, 19], [15.0, 18.5], 
		[15, 18], [15, 12], [16.5, 9.5], 
		[18, 7], [22, 7], [28, 7], 
		[28, 18], [28, 23], [26.5, 25.5], 
		[25, 28], ]);
}

module OpenSans_bottom_contour10x70_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([21, 28], [18, 28], [16.5, 26.0],steps,3);
	BezConic([16.5, 26.0], [15, 24], [15, 19],steps,3);
	BezConic([15, 18], [15, 12], [16.5, 9.5],steps,3);
	BezConic([16.5, 9.5], [18, 7], [22, 7],steps,3);
	BezConic([22, 7], [28, 7], [28, 18],steps,3);
	BezConic([28, 18], [28, 23], [26.5, 25.5],steps,3);
	BezConic([26.5, 25.5], [25, 28], [21, 28],steps,3);
}
}

module OpenSans_bottom_contour10x70_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour10x70(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour10x70_skeleton();
			OpenSans_bottom_contour10x70_subtractive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour10x70_additive_curves(steps);
	}
}

module OpenSans_bottom_chunk10x70(steps=2) {
	difference() {
		OpenSans_bottom_contour00x70(steps);
		scale([1,1,1.1]) OpenSans_bottom_contour10x70(steps);
	}
}

OpenSans_bottom_bbox0x70=[[5, -15], [38, 36]];

module OpenSans_bottom_letter0x70(detail=2) {
	OpenSans_bottom_chunk10x70(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x71_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[19, 7], [23, 7], [24.5, 9.0], 
		[26, 11], [27, 16], [27.0, 16.5], 
		[27, 17], [27, 23], [25.0, 25.5], 
		[23, 28], [19, 28], [13, 28], 
		[13, 17], [13, 12], [14.5, 9.5], 
		[16, 7], ]);
}

module OpenSans_bottom_contour00x71_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([19, 7], [23, 7], [24.5, 9.0],steps,3);
	BezConic([24.5, 9.0], [26, 11], [27, 16],steps,3);
	BezConic([27, 17], [27, 23], [25.0, 25.5],steps,3);
	BezConic([25.0, 25.5], [23, 28], [19, 28],steps,3);
	BezConic([19, 28], [13, 28], [13, 17],steps,3);
	BezConic([13, 17], [13, 12], [14.5, 9.5],steps,3);
	BezConic([14.5, 9.5], [16, 7], [19, 7],steps,3);
}
}

module OpenSans_bottom_contour00x71_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour00x71(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x71_skeleton();
			OpenSans_bottom_contour00x71_subtractive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x71_additive_curves(steps);
	}
}

module OpenSans_bottom_contour10x71_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[16, -1], [10, -1], [6.5, 4.0], 
		[3, 9], [3, 17], [3, 26], 
		[6.5, 31.0], [10, 36], [16, 36], 
		[20, 36], [22.5, 34.5], [25, 33], 
		[26, 30], [26.5, 30.0], [27, 30], 
		[27.0, 32.5], [27, 35], [31.5, 35.0], 
		[36, 35], [36.0, 10.0], [36, -15], 
		[31.0, -15.0], [26, -15], [26.0, -8.0], 
		[26, -1], [26, 1], [26, 5], 
		[26.0, 5.0], [26, 5], [24, 2], 
		[21.5, 0.5],[19, -1], ]);
}

module OpenSans_bottom_contour10x71_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([26, -1], [26, 1], [26, 5],steps,3);
}
}

module OpenSans_bottom_contour10x71_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([16, -1], [10, -1], [6.5, 4.0],steps,3);
	BezConic([6.5, 4.0], [3, 9], [3, 17],steps,3);
	BezConic([3, 17], [3, 26], [6.5, 31.0],steps,3);
	BezConic([6.5, 31.0], [10, 36], [16, 36],steps,3);
	BezConic([16, 36], [20, 36], [22.5, 34.5],steps,3);
	BezConic([22.5, 34.5], [25, 33], [26, 30],steps,3);
	BezConic([26, 5], [24, 2], [21.5, 0.5],steps,3);
	BezConic([21.5, 0.5], [19, -1], [16, -1],steps,3);
}
}

module OpenSans_bottom_contour10x71(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour10x71_skeleton();
			OpenSans_bottom_contour10x71_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour10x71_subtractive_curves(steps);
	}
}

module OpenSans_bottom_chunk00x71(steps=2) {
	difference() {
		
		scale([1,1,1.1]) OpenSans_bottom_contour00x71(steps);
	}
}

module OpenSans_bottom_chunk10x71(steps=2) {
	difference() {
		OpenSans_bottom_contour10x71(steps);
		
	}
}

OpenSans_bottom_bbox0x71=[[3, -15], [36, 36]];

module OpenSans_bottom_letter0x71(detail=2) {
	OpenSans_bottom_chunk00x71(steps=detail);
	OpenSans_bottom_chunk10x71(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x72_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[25, 36], [26, 36], [28, 35], 
		[27.5, 30.5], [27, 26], [26, 27], 
		[24, 27], [20, 27], [17.5, 24.5], 
		[15, 22], [15, 18], [15.0, 9.0], 
		[15, 0], [10.0, 0.0], [5, 0], 
		[5.0, 17.5], [5, 35], [8.5, 35.0], 
		[12, 35], [13.0, 32.0], [14, 29], 
		[14.0, 29.0], [14, 29], [16, 32], 
		[18.5, 34.0],[21, 36], ]);
}

module OpenSans_bottom_contour00x72_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([27, 26], [26, 27], [24, 27],steps,3);
	BezConic([24, 27], [20, 27], [17.5, 24.5],steps,3);
	BezConic([17.5, 24.5], [15, 22], [15, 18],steps,3);
}
}

module OpenSans_bottom_contour00x72_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([25, 36], [26, 36], [28, 35],steps,3);
	BezConic([14, 29], [16, 32], [18.5, 34.0],steps,3);
	BezConic([18.5, 34.0], [21, 36], [25, 36],steps,3);
}
}

module OpenSans_bottom_contour00x72(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x72_skeleton();
			OpenSans_bottom_contour00x72_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x72_subtractive_curves(steps);
	}
}

module OpenSans_bottom_chunk10x72(steps=2) {
	difference() {
		OpenSans_bottom_contour00x72(steps);
		
	}
}

OpenSans_bottom_bbox0x72=[[5, 0], [28, 36]];

module OpenSans_bottom_letter0x72(detail=2) {
	OpenSans_bottom_chunk10x72(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x73_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[29, 10], [29, 5], [25.5, 2.0], 
		[22, -1], [14, -1], [11, -1], 
		[8.0, -0.5], [5, 0], [3, 1], 
		[3.0, 5.0], [3, 9], [6, 8], 
		[9.0, 7.0], [12, 6], [15, 6], 
		[20, 6], [20, 9], [20, 10], 
		[19.5, 11.0], [19, 12], [17.0, 13.0], 
		[15, 14], [12, 15], [8, 17], 
		[6.5, 18.0], [5, 19], [4.0, 21.0], 
		[3, 23], [3, 26], [3, 31], 
		[6.5, 33.5], [10, 36], [17, 36], 
		[23, 36], [29, 33], [27.5, 29.5], 
		[26, 26], [24, 27], [21.5, 28.0], 
		[19, 29], [17, 29], [12, 29], 
		[12, 26], [12, 25], [13.5, 24.0], 
		[15, 23], [20, 21], [24, 20], 
		[26.0, 18.5], [28, 17], [28.5, 15.0], 
		[29, 13], ]);
}

module OpenSans_bottom_contour00x73_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([3, 9], [6, 8], [9.0, 7.0],steps,3);
	BezConic([9.0, 7.0], [12, 6], [15, 6],steps,3);
	BezConic([15, 6], [20, 6], [20, 9],steps,3);
	BezConic([20, 9], [20, 10], [19.5, 11.0],steps,3);
	BezConic([19.5, 11.0], [19, 12], [17.0, 13.0],steps,3);
	BezConic([17.0, 13.0], [15, 14], [12, 15],steps,3);
	BezConic([26, 26], [24, 27], [21.5, 28.0],steps,3);
	BezConic([21.5, 28.0], [19, 29], [17, 29],steps,3);
	BezConic([17, 29], [12, 29], [12, 26],steps,3);
	BezConic([12, 26], [12, 25], [13.5, 24.0],steps,3);
	BezConic([13.5, 24.0], [15, 23], [20, 21],steps,3);
}
}

module OpenSans_bottom_contour00x73_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([29, 10], [29, 5], [25.5, 2.0],steps,3);
	BezConic([25.5, 2.0], [22, -1], [14, -1],steps,3);
	BezConic([14, -1], [11, -1], [8.0, -0.5],steps,3);
	BezConic([8.0, -0.5], [5, 0], [3, 1],steps,3);
	BezConic([12, 15], [8, 17], [6.5, 18.0],steps,3);
	BezConic([6.5, 18.0], [5, 19], [4.0, 21.0],steps,3);
	BezConic([4.0, 21.0], [3, 23], [3, 26],steps,3);
	BezConic([3, 26], [3, 31], [6.5, 33.5],steps,3);
	BezConic([6.5, 33.5], [10, 36], [17, 36],steps,3);
	BezConic([17, 36], [23, 36], [29, 33],steps,3);
	BezConic([20, 21], [24, 20], [26.0, 18.5],steps,3);
	BezConic([26.0, 18.5], [28, 17], [28.5, 15.0],steps,3);
	BezConic([28.5, 15.0], [29, 13], [29, 10],steps,3);
}
}

module OpenSans_bottom_contour00x73(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x73_skeleton();
			OpenSans_bottom_contour00x73_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x73_subtractive_curves(steps);
	}
}

module OpenSans_bottom_chunk10x73(steps=2) {
	difference() {
		OpenSans_bottom_contour00x73(steps);
		
	}
}

OpenSans_bottom_bbox0x73=[[3, -1], [29, 36]];

module OpenSans_bottom_letter0x73(detail=2) {
	OpenSans_bottom_chunk10x73(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x74_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[20, 7], [22, 7], [26, 8], 
		[26.0, 4.5], [26, 1], [22, -1], 
		[17, -1], [11, -1], [8.5, 2.0], 
		[6, 5], [6, 11], [6.0, 19.5], 
		[6, 28], [3.5, 28.0], [1, 28], 
		[1.0, 30.0], [1, 32], [4.0, 33.5], 
		[7, 35], [8.0, 38.5], [9, 42], 
		[12.5, 42.0], [16, 42], [16.0, 38.5], 
		[16, 35], [20.5, 35.0], [25, 35], 
		[25.0, 31.5], [25, 28], [20.5, 28.0], 
		[16, 28], [16.0, 19.5], [16, 11], 
		[16, 9], [17.0, 8.0], [18, 7], 
		 ]);
}

module OpenSans_bottom_contour00x74_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([20, 7], [22, 7], [26, 8],steps,3);
	BezConic([16, 11], [16, 9], [17.0, 8.0],steps,3);
	BezConic([17.0, 8.0], [18, 7], [20, 7],steps,3);
}
}

module OpenSans_bottom_contour00x74_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([26, 1], [22, -1], [17, -1],steps,3);
	BezConic([17, -1], [11, -1], [8.5, 2.0],steps,3);
	BezConic([8.5, 2.0], [6, 5], [6, 11],steps,3);
}
}

module OpenSans_bottom_contour00x74(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x74_skeleton();
			OpenSans_bottom_contour00x74_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x74_subtractive_curves(steps);
	}
}

module OpenSans_bottom_chunk10x74(steps=2) {
	difference() {
		OpenSans_bottom_contour00x74(steps);
		
	}
}

OpenSans_bottom_bbox0x74=[[1, -1], [26, 42]];

module OpenSans_bottom_letter0x74(detail=2) {
	OpenSans_bottom_chunk10x74(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x75_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[30, 0], [29.0, 2.0], [28, 4], 
		[28.0, 4.0], [28, 4], [26, 2], 
		[23.5, 0.5], [21, -1], [17, -1], 
		[11, -1], [8.0, 2.5], [5, 6], 
		[5, 12], [5.0, 23.5], [5, 35], 
		[9.5, 35.0], [14, 35], [14.0, 25.0], 
		[14, 15], [14, 11], [15.5, 9.0], 
		[17, 7], [20, 7], [24, 7], 
		[26.0, 9.5], [28, 12], [28, 19], 
		[28.0, 27.0], [28, 35], [32.5, 35.0], 
		[37, 35], [37.0, 17.5], [37, 0], 
		[33.5, 0.0], ]);
}

module OpenSans_bottom_contour00x75_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([14, 15], [14, 11], [15.5, 9.0],steps,3);
	BezConic([15.5, 9.0], [17, 7], [20, 7],steps,3);
	BezConic([20, 7], [24, 7], [26.0, 9.5],steps,3);
	BezConic([26.0, 9.5], [28, 12], [28, 19],steps,3);
}
}

module OpenSans_bottom_contour00x75_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([28, 4], [26, 2], [23.5, 0.5],steps,3);
	BezConic([23.5, 0.5], [21, -1], [17, -1],steps,3);
	BezConic([17, -1], [11, -1], [8.0, 2.5],steps,3);
	BezConic([8.0, 2.5], [5, 6], [5, 12],steps,3);
}
}

module OpenSans_bottom_contour00x75(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x75_skeleton();
			OpenSans_bottom_contour00x75_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x75_subtractive_curves(steps);
	}
}

module OpenSans_bottom_chunk10x75(steps=2) {
	difference() {
		OpenSans_bottom_contour00x75(steps);
		
	}
}

OpenSans_bottom_bbox0x75=[[5, -1], [37, 35]];

module OpenSans_bottom_letter0x75(detail=2) {
	OpenSans_bottom_chunk10x75(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x76_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[13, 0], [6.5, 17.5], [0, 35], 
		[5.0, 35.0], [10, 35], [13.5, 25.0], 
		[17, 15], [18, 11], [18, 8], 
		[18.0, 8.0], [18, 8], [18, 11], 
		[20, 15], [23.0, 25.0], [26, 35], 
		[31.0, 35.0], [36, 35], [29.5, 17.5], 
		[23, 0],[18.0, 0.0], ]);
}

module OpenSans_bottom_contour00x76_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour00x76_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([17, 15], [18, 11], [18, 8],steps,3);
	BezConic([18, 8], [18, 11], [20, 15],steps,3);
}
}

module OpenSans_bottom_contour00x76(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x76_skeleton();
			OpenSans_bottom_contour00x76_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x76_subtractive_curves(steps);
	}
}

module OpenSans_bottom_chunk10x76(steps=2) {
	difference() {
		OpenSans_bottom_contour00x76(steps);
		
	}
}

OpenSans_bottom_bbox0x76=[[0, 0], [36, 35]];

module OpenSans_bottom_letter0x76(detail=2) {
	OpenSans_bottom_chunk10x76(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x77_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[34, 0], [32.5, 6.0], [31, 12], 
		[29.0, 20.0], [27, 28], [27.0, 28.0], 
		[27, 28], [24.0, 14.0], [21, 0], 
		[16.0, 0.0], [11, 0], [6.0, 17.5], 
		[1, 35], [5.5, 35.0], [10, 35], 
		[12.0, 27.0], [14, 19], [15, 15], 
		[16, 8], [16.0, 8.0], [16, 8], 
		[16, 10], [17, 16], [17.5, 17.0], 
		[18, 18], [20.0, 26.5], [22, 35], 
		[27.5, 35.0], [33, 35], [35.0, 26.5], 
		[37, 18], [37, 18], [37.0, 16.5], 
		[37, 15], [37.5, 13.5], [38, 12], 
		[38.0, 10.5], [38, 9], [38, 8], 
		[38.5, 8.0], [39, 8], [39, 10], 
		[39.5, 14.0], [40, 18], [41, 19], 
		[43.0, 27.0], [45, 35], [49.5, 35.0], 
		[54, 35], [49.0, 17.5], [44, 0], 
		[39.0, 0.0], ]);
}

module OpenSans_bottom_contour00x77_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([37.0, 16.5], [37, 15], [37.5, 13.5],steps,3);
	BezConic([38.0, 10.5], [38, 9], [38, 8],steps,3);
}
}

module OpenSans_bottom_contour00x77_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([14, 19], [15, 15], [16, 8],steps,3);
	BezConic([16, 8], [16, 10], [17, 16],steps,3);
	BezConic([37, 18], [37, 18], [37.0, 16.5],steps,3);
	BezConic([37.5, 13.5], [38, 12], [38.0, 10.5],steps,3);
	BezConic([39, 8], [39, 10], [39.5, 14.0],steps,3);
	BezConic([39.5, 14.0], [40, 18], [41, 19],steps,3);
}
}

module OpenSans_bottom_contour00x77(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x77_skeleton();
			OpenSans_bottom_contour00x77_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x77_subtractive_curves(steps);
	}
}

module OpenSans_bottom_chunk10x77(steps=2) {
	difference() {
		OpenSans_bottom_contour00x77(steps);
		
	}
}

OpenSans_bottom_bbox0x77=[[1, 0], [54, 35]];

module OpenSans_bottom_letter0x77(detail=2) {
	OpenSans_bottom_chunk10x77(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x78_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[12, 18], [6.5, 26.5], [1, 35], 
		[6.5, 35.0], [12, 35], [15.5, 29.5], 
		[19, 24], [22.0, 29.5], [25, 35], 
		[30.5, 35.0], [36, 35], [30.5, 26.5], 
		[25, 18], [31.0, 9.0], [37, 0], 
		[31.5, 0.0], [26, 0], [22.5, 6.0], 
		[19, 12], [15.0, 6.0], [11, 0], 
		[5.5, 0.0], [0, 0], [6.0, 9.0], 
		 ]);
}

module OpenSans_bottom_contour00x78_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour00x78_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour00x78(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x78_skeleton();
			OpenSans_bottom_contour00x78_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x78_subtractive_curves(steps);
	}
}

module OpenSans_bottom_chunk10x78(steps=2) {
	difference() {
		OpenSans_bottom_contour00x78(steps);
		
	}
}

OpenSans_bottom_bbox0x78=[[0, 0], [37, 35]];

module OpenSans_bottom_letter0x78(detail=2) {
	OpenSans_bottom_chunk10x78(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x79_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[0, 35], [5.0, 35.0], [10, 35], 
		[13.5, 25.0], [17, 15], [18, 13], 
		[18, 9], [18.0, 9.0], [18, 9], 
		[19, 12], [20, 15], [23.0, 25.0], 
		[26, 35], [31.0, 35.0], [36, 35], 
		[29.0, 15.5], [22, -4], [20, -10], 
		[16.0, -12.5], [12, -15], [7, -15], 
		[5, -15], [2, -15], [2.0, -11.0], 
		[2, -7], [4, -8], [6, -8], 
		[8, -8], [10.0, -6.5], [12, -5], 
		[13, -1], [13.5, -0.5], [14, 0], 
		[7.0, 17.5], ]);
}

module OpenSans_bottom_contour00x79_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([7, -15], [5, -15], [2, -15],steps,3);
	BezConic([2, -7], [4, -8], [6, -8],steps,3);
	BezConic([6, -8], [8, -8], [10.0, -6.5],steps,3);
	BezConic([10.0, -6.5], [12, -5], [13, -1],steps,3);
}
}

module OpenSans_bottom_contour00x79_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([17, 15], [18, 13], [18, 9],steps,3);
	BezConic([18, 9], [19, 12], [20, 15],steps,3);
	BezConic([22, -4], [20, -10], [16.0, -12.5],steps,3);
	BezConic([16.0, -12.5], [12, -15], [7, -15],steps,3);
}
}

module OpenSans_bottom_contour00x79(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x79_skeleton();
			OpenSans_bottom_contour00x79_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x79_subtractive_curves(steps);
	}
}

module OpenSans_bottom_chunk10x79(steps=2) {
	difference() {
		OpenSans_bottom_contour00x79(steps);
		
	}
}

OpenSans_bottom_bbox0x79=[[0, -15], [36, 35]];

module OpenSans_bottom_letter0x79(detail=2) {
	OpenSans_bottom_chunk10x79(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x7a_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[29, 0], [15.5, 0.0], [2, 0], 
		[2.0, 3.0], [2, 6], [10.0, 17.0], 
		[18, 28], [10.5, 28.0], [3, 28], 
		[3.0, 31.5], [3, 35], [16.0, 35.0], 
		[29, 35], [29.0, 32.0], [29, 29], 
		[21.0, 18.0], [13, 7], [21.0, 7.0], 
		[29, 7],[29.0, 3.5], ]);
}

module OpenSans_bottom_contour00x7a_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour00x7a_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour00x7a(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x7a_skeleton();
			OpenSans_bottom_contour00x7a_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x7a_subtractive_curves(steps);
	}
}

module OpenSans_bottom_chunk10x7a(steps=2) {
	difference() {
		OpenSans_bottom_contour00x7a(steps);
		
	}
}

OpenSans_bottom_bbox0x7a=[[2, 0], [29, 35]];

module OpenSans_bottom_letter0x7a(detail=2) {
	OpenSans_bottom_chunk10x7a(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x7b_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[9, 8], [9, 11], [7.0, 12.5], 
		[5, 14], [1, 14], [1.0, 18.0], 
		[1, 22], [5, 22], [7.0, 23.0], 
		[9, 24], [9, 27], [9.0, 27.0], 
		[9, 27], [9.0, 32.0], [9, 37], 
		[9, 42], [12.0, 44.0], [15, 46], 
		[23, 46], [23.0, 42.5], [23, 39], 
		[20, 39], [18.5, 37.5], [17, 36], 
		[17, 34], [17.0, 29.5], [17, 25], 
		[17, 19], [10, 18], [10.0, 18.0], 
		[10, 18], [17, 17], [17, 11], 
		[17.0, 11.0], [17, 11], [17.0, 6.0], 
		[17, 1], [17, -1], [18.5, -2.0], 
		[20, -3], [23, -3], [23.0, -6.5], 
		[23, -10], [15, -10], [12.0, -8.0], 
		[9, -6], [9, -1], [9.0, 3.5], 
		 ]);
}

module OpenSans_bottom_contour00x7b_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([9, 8], [9, 11], [7.0, 12.5],steps,3);
	BezConic([7.0, 12.5], [5, 14], [1, 14],steps,3);
	BezConic([1, 22], [5, 22], [7.0, 23.0],steps,3);
	BezConic([7.0, 23.0], [9, 24], [9, 27],steps,3);
	BezConic([23, 39], [20, 39], [18.5, 37.5],steps,3);
	BezConic([18.5, 37.5], [17, 36], [17, 34],steps,3);
	BezConic([17, 1], [17, -1], [18.5, -2.0],steps,3);
	BezConic([18.5, -2.0], [20, -3], [23, -3],steps,3);
}
}

module OpenSans_bottom_contour00x7b_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([9, 37], [9, 42], [12.0, 44.0],steps,3);
	BezConic([12.0, 44.0], [15, 46], [23, 46],steps,3);
	BezConic([17, 25], [17, 19], [10, 18],steps,3);
	BezConic([10, 18], [17, 17], [17, 11],steps,3);
	BezConic([23, -10], [15, -10], [12.0, -8.0],steps,3);
	BezConic([12.0, -8.0], [9, -6], [9, -1],steps,3);
}
}

module OpenSans_bottom_contour00x7b(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x7b_skeleton();
			OpenSans_bottom_contour00x7b_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x7b_subtractive_curves(steps);
	}
}

module OpenSans_bottom_chunk10x7b(steps=2) {
	difference() {
		OpenSans_bottom_contour00x7b(steps);
		
	}
}

OpenSans_bottom_bbox0x7b=[[1, -10], [23, 46]];

module OpenSans_bottom_letter0x7b(detail=2) {
	OpenSans_bottom_chunk10x7b(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x7c_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[14, 48], [17.5, 48.0], [21, 48], 
		[21.0, 16.5], [21, -15], [17.5, -15.0], 
		[14, -15],[14.0, 16.5], ]);
}

module OpenSans_bottom_contour00x7c_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour00x7c_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
}
}

module OpenSans_bottom_contour00x7c(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x7c_skeleton();
			OpenSans_bottom_contour00x7c_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x7c_subtractive_curves(steps);
	}
}

module OpenSans_bottom_chunk10x7c(steps=2) {
	difference() {
		OpenSans_bottom_contour00x7c(steps);
		
	}
}

OpenSans_bottom_bbox0x7c=[[14, -15], [21, 48]];

module OpenSans_bottom_letter0x7c(detail=2) {
	OpenSans_bottom_chunk10x7c(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x7d_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[16, -1], [16, -5], [15.0, -6.5], 
		[14, -8], [11.0, -9.0], [8, -10], 
		[3, -10], [3.0, -6.5], [3, -3], 
		[6, -3], [7.0, -2.0], [8, -1], 
		[8, 1], [8.0, 6.0], [8, 11], 
		[8.0, 11.0], [8, 11], [8, 14], 
		[10.0, 15.5], [12, 17], [15, 18], 
		[15.0, 18.0], [15, 18], [8, 19], 
		[8, 25], [8.0, 29.5], [8, 34], 
		[8, 36], [7.0, 37.5], [6, 39], 
		[3, 39], [3.0, 42.5], [3, 46], 
		[8, 46], [11.0, 45.0], [14, 44], 
		[15.0, 42.0], [16, 40], [16, 37], 
		[16.0, 32.0], [16, 27], [16.0, 27.0], 
		[16, 27], [16, 24], [18.0, 23.0], 
		[20, 22], [24, 22], [24.0, 18.0], 
		[24, 14], [20, 14], [18.0, 12.5], 
		[16, 11], [16, 8], [16.0, 3.5], 
		 ]);
}

module OpenSans_bottom_contour00x7d_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([3, -3], [6, -3], [7.0, -2.0],steps,3);
	BezConic([7.0, -2.0], [8, -1], [8, 1],steps,3);
	BezConic([8, 34], [8, 36], [7.0, 37.5],steps,3);
	BezConic([7.0, 37.5], [6, 39], [3, 39],steps,3);
	BezConic([16, 27], [16, 24], [18.0, 23.0],steps,3);
	BezConic([18.0, 23.0], [20, 22], [24, 22],steps,3);
	BezConic([24, 14], [20, 14], [18.0, 12.5],steps,3);
	BezConic([18.0, 12.5], [16, 11], [16, 8],steps,3);
}
}

module OpenSans_bottom_contour00x7d_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([16, -1], [16, -5], [15.0, -6.5],steps,3);
	BezConic([15.0, -6.5], [14, -8], [11.0, -9.0],steps,3);
	BezConic([11.0, -9.0], [8, -10], [3, -10],steps,3);
	BezConic([8, 11], [8, 14], [10.0, 15.5],steps,3);
	BezConic([10.0, 15.5], [12, 17], [15, 18],steps,3);
	BezConic([15, 18], [8, 19], [8, 25],steps,3);
	BezConic([3, 46], [8, 46], [11.0, 45.0],steps,3);
	BezConic([11.0, 45.0], [14, 44], [15.0, 42.0],steps,3);
	BezConic([15.0, 42.0], [16, 40], [16, 37],steps,3);
}
}

module OpenSans_bottom_contour00x7d(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x7d_skeleton();
			OpenSans_bottom_contour00x7d_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x7d_subtractive_curves(steps);
	}
}

module OpenSans_bottom_chunk10x7d(steps=2) {
	difference() {
		OpenSans_bottom_contour00x7d(steps);
		
	}
}

OpenSans_bottom_bbox0x7d=[[3, -10], [24, 46]];

module OpenSans_bottom_letter0x7d(detail=2) {
	OpenSans_bottom_chunk10x7d(steps=detail);
} //end skeleton

module OpenSans_bottom_contour00x7e_skeleton() {
translate([0,0,-3/2]) 	linear_extrude(height=3) polygon( points=[
		[10, 21], [8, 21], [6.0, 20.0], 
		[4, 19], [3, 17], [3.0, 20.5], 
		[3, 24], [6, 28], [11, 28], 
		[13, 28], [15.0, 27.5], [17, 27], 
		[19, 26], [23, 24], [27, 24], 
		[28, 24], [30.0, 25.0], [32, 26], 
		[34, 28], [34.0, 24.5], [34, 21], 
		[31, 17], [26, 17], [24, 17], 
		[22.0, 17.5], [20, 18], [17, 19], 
		[13, 21], ]);
}

module OpenSans_bottom_contour00x7e_additive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([10, 21], [8, 21], [6.0, 20.0],steps,3);
	BezConic([6.0, 20.0], [4, 19], [3, 17],steps,3);
	BezConic([19, 26], [23, 24], [27, 24],steps,3);
	BezConic([27, 24], [28, 24], [30.0, 25.0],steps,3);
	BezConic([30.0, 25.0], [32, 26], [34, 28],steps,3);
	BezConic([17, 19], [13, 21], [10, 21],steps,3);
}
}

module OpenSans_bottom_contour00x7e_subtractive_curves(steps=2) {
translate([0,0,-3/2]){ 
	BezConic([3, 24], [6, 28], [11, 28],steps,3);
	BezConic([11, 28], [13, 28], [15.0, 27.5],steps,3);
	BezConic([15.0, 27.5], [17, 27], [19, 26],steps,3);
	BezConic([34, 21], [31, 17], [26, 17],steps,3);
	BezConic([26, 17], [24, 17], [22.0, 17.5],steps,3);
	BezConic([22.0, 17.5], [20, 18], [17, 19],steps,3);
}
}

module OpenSans_bottom_contour00x7e(steps=2) {
	difference() {
		union() {
			OpenSans_bottom_contour00x7e_skeleton();
			OpenSans_bottom_contour00x7e_additive_curves(steps);
		}
		scale([1,1,1.1]) OpenSans_bottom_contour00x7e_subtractive_curves(steps);
	}
}

module OpenSans_bottom_chunk10x7e(steps=2) {
	difference() {
		OpenSans_bottom_contour00x7e(steps);
		
	}
}

OpenSans_bottom_bbox0x7e=[[3, 17], [34, 28]];

module OpenSans_bottom_letter0x7e(detail=2) {
	OpenSans_bottom_chunk10x7e(steps=detail);
} //end skeleton



module OpenSans_bottom(charcode,center=true, steps=2){
    if (charcode == "0x21" || charcode == 33 || charcode=="!"){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x21[1][0]/2,0,0]) OpenSans_bottom_letter0x21(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x21(steps);
        }
    }
    if (charcode == "0x22" || charcode == 34 || charcode=="\""){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x22[1][0]/2,0,0]) OpenSans_bottom_letter0x22(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x22(steps);
        }
    }
    if (charcode == "0x23" || charcode == 35 || charcode=="#"){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x23[1][0]/2,0,0]) OpenSans_bottom_letter0x23(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x23(steps);
        }
    }
    if (charcode == "0x24" || charcode == 36 || charcode=="$"){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x24[1][0]/2,0,0]) OpenSans_bottom_letter0x24(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x24(steps);
        }
    }
    if (charcode == "0x25" || charcode == 37 || charcode=="%"){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x25[1][0]/2,0,0]) OpenSans_bottom_letter0x25(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x25(steps);
        }
    }
    if (charcode == "0x26" || charcode == 38 || charcode=="&"){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x26[1][0]/2,0,0]) OpenSans_bottom_letter0x26(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x26(steps);
        }
    }
    if (charcode == "0x27" || charcode == 39 || charcode=="'"){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x27[1][0]/2,0,0]) OpenSans_bottom_letter0x27(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x27(steps);
        }
    }
    if (charcode == "0x28" || charcode == 40 || charcode=="("){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x28[1][0]/2,0,0]) OpenSans_bottom_letter0x28(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x28(steps);
        }
    }
    if (charcode == "0x29" || charcode == 41 || charcode==")"){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x29[1][0]/2,0,0]) OpenSans_bottom_letter0x29(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x29(steps);
        }
    }
    if (charcode == "0x2a" || charcode == 42 || charcode=="*"){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x2a[1][0]/2,0,0]) OpenSans_bottom_letter0x2a(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x2a(steps);
        }
    }
    if (charcode == "0x2b" || charcode == 43 || charcode=="+"){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x2b[1][0]/2,0,0]) OpenSans_bottom_letter0x2b(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x2b(steps);
        }
    }
    if (charcode == "0x2c" || charcode == 44 || charcode==","){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x2c[1][0]/2,0,0]) OpenSans_bottom_letter0x2c(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x2c(steps);
        }
    }
    if (charcode == "0x2d" || charcode == 45 || charcode=="-"){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x2d[1][0]/2,0,0]) OpenSans_bottom_letter0x2d(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x2d(steps);
        }
    }
    if (charcode == "0x2e" || charcode == 46 || charcode=="."){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x2e[1][0]/2,0,0]) OpenSans_bottom_letter0x2e(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x2e(steps);
        }
    }
    if (charcode == "0x2f" || charcode == 47 || charcode=="/"){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x2f[1][0]/2,0,0]) OpenSans_bottom_letter0x2f(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x2f(steps);
        }
    }
    if (charcode == "0x30" || charcode == 48 || charcode=="0"){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x30[1][0]/2,0,0]) OpenSans_bottom_letter0x30(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x30(steps);
        }
    }
    if (charcode == "0x31" || charcode == 49 || charcode=="1"){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x31[1][0]/2,0,0]) OpenSans_bottom_letter0x31(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x31(steps);
        }
    }
    if (charcode == "0x32" || charcode == 50 || charcode=="2"){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x32[1][0]/2,0,0]) OpenSans_bottom_letter0x32(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x32(steps);
        }
    }
    if (charcode == "0x33" || charcode == 51 || charcode=="3"){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x33[1][0]/2,0,0]) OpenSans_bottom_letter0x33(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x33(steps);
        }
    }
    if (charcode == "0x34" || charcode == 52 || charcode=="4"){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x34[1][0]/2,0,0]) OpenSans_bottom_letter0x34(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x34(steps);
        }
    }
    if (charcode == "0x35" || charcode == 53 || charcode=="5"){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x35[1][0]/2,0,0]) OpenSans_bottom_letter0x35(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x35(steps);
        }
    }
    if (charcode == "0x36" || charcode == 54 || charcode=="6"){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x36[1][0]/2,0,0]) OpenSans_bottom_letter0x36(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x36(steps);
        }
    }
    if (charcode == "0x37" || charcode == 55 || charcode=="7"){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x37[1][0]/2,0,0]) OpenSans_bottom_letter0x37(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x37(steps);
        }
    }
    if (charcode == "0x38" || charcode == 56 || charcode=="8"){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x38[1][0]/2,0,0]) OpenSans_bottom_letter0x38(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x38(steps);
        }
    }
    if (charcode == "0x39" || charcode == 57 || charcode=="9"){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x39[1][0]/2,0,0]) OpenSans_bottom_letter0x39(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x39(steps);
        }
    }
    if (charcode == "0x3a" || charcode == 58 || charcode==":"){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x3a[1][0]/2,0,0]) OpenSans_bottom_letter0x3a(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x3a(steps);
        }
    }
    if (charcode == "0x3b" || charcode == 59 || charcode==";"){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x3b[1][0]/2,0,0]) OpenSans_bottom_letter0x3b(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x3b(steps);
        }
    }
    if (charcode == "0x3c" || charcode == 60 || charcode=="<"){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x3c[1][0]/2,0,0]) OpenSans_bottom_letter0x3c(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x3c(steps);
        }
    }
    if (charcode == "0x3d" || charcode == 61 || charcode=="="){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x3d[1][0]/2,0,0]) OpenSans_bottom_letter0x3d(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x3d(steps);
        }
    }
    if (charcode == "0x3e" || charcode == 62 || charcode==">"){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x3e[1][0]/2,0,0]) OpenSans_bottom_letter0x3e(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x3e(steps);
        }
    }
    if (charcode == "0x3f" || charcode == 63 || charcode=="?"){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x3f[1][0]/2,0,0]) OpenSans_bottom_letter0x3f(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x3f(steps);
        }
    }
    if (charcode == "0x40" || charcode == 64 || charcode=="@"){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x40[1][0]/2,0,0]) OpenSans_bottom_letter0x40(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x40(steps);
        }
    }
    if (charcode == "0x41" || charcode == 65 || charcode=="A"){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x41[1][0]/2,0,0]) OpenSans_bottom_letter0x41(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x41(steps);
        }
    }
    if (charcode == "0x42" || charcode == 66 || charcode=="B"){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x42[1][0]/2,0,0]) OpenSans_bottom_letter0x42(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x42(steps);
        }
    }
    if (charcode == "0x43" || charcode == 67 || charcode=="C"){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x43[1][0]/2,0,0]) OpenSans_bottom_letter0x43(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x43(steps);
        }
    }
    if (charcode == "0x44" || charcode == 68 || charcode=="D"){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x44[1][0]/2,0,0]) OpenSans_bottom_letter0x44(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x44(steps);
        }
    }
    if (charcode == "0x45" || charcode == 69 || charcode=="E"){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x45[1][0]/2,0,0]) OpenSans_bottom_letter0x45(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x45(steps);
        }
    }
    if (charcode == "0x46" || charcode == 70 || charcode=="F"){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x46[1][0]/2,0,0]) OpenSans_bottom_letter0x46(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x46(steps);
        }
    }
    if (charcode == "0x47" || charcode == 71 || charcode=="G"){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x47[1][0]/2,0,0]) OpenSans_bottom_letter0x47(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x47(steps);
        }
    }
    if (charcode == "0x48" || charcode == 72 || charcode=="H"){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x48[1][0]/2,0,0]) OpenSans_bottom_letter0x48(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x48(steps);
        }
    }
    if (charcode == "0x49" || charcode == 73 || charcode=="I"){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x49[1][0]/2,0,0]) OpenSans_bottom_letter0x49(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x49(steps);
        }
    }
    if (charcode == "0x4a" || charcode == 74 || charcode=="J"){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x4a[1][0]/2,0,0]) OpenSans_bottom_letter0x4a(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x4a(steps);
        }
    }
    if (charcode == "0x4b" || charcode == 75 || charcode=="K"){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x4b[1][0]/2,0,0]) OpenSans_bottom_letter0x4b(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x4b(steps);
        }
    }
    if (charcode == "0x4c" || charcode == 76 || charcode=="L"){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x4c[1][0]/2,0,0]) OpenSans_bottom_letter0x4c(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x4c(steps);
        }
    }
    if (charcode == "0x4d" || charcode == 77 || charcode=="M"){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x4d[1][0]/2,0,0]) OpenSans_bottom_letter0x4d(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x4d(steps);
        }
    }
    if (charcode == "0x4e" || charcode == 78 || charcode=="N"){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x4e[1][0]/2,0,0]) OpenSans_bottom_letter0x4e(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x4e(steps);
        }
    }
    if (charcode == "0x4f" || charcode == 79 || charcode=="O"){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x4f[1][0]/2,0,0]) OpenSans_bottom_letter0x4f(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x4f(steps);
        }
    }
    if (charcode == "0x50" || charcode == 80 || charcode=="P"){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x50[1][0]/2,0,0]) OpenSans_bottom_letter0x50(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x50(steps);
        }
    }
    if (charcode == "0x51" || charcode == 81 || charcode=="Q"){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x51[1][0]/2,0,0]) OpenSans_bottom_letter0x51(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x51(steps);
        }
    }
    if (charcode == "0x52" || charcode == 82 || charcode=="R"){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x52[1][0]/2,0,0]) OpenSans_bottom_letter0x52(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x52(steps);
        }
    }
    if (charcode == "0x53" || charcode == 83 || charcode=="S"){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x53[1][0]/2,0,0]) OpenSans_bottom_letter0x53(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x53(steps);
        }
    }
    if (charcode == "0x54" || charcode == 84 || charcode=="T"){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x54[1][0]/2,0,0]) OpenSans_bottom_letter0x54(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x54(steps);
        }
    }
    if (charcode == "0x55" || charcode == 85 || charcode=="U"){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x55[1][0]/2,0,0]) OpenSans_bottom_letter0x55(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x55(steps);
        }
    }
    if (charcode == "0x56" || charcode == 86 || charcode=="V"){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x56[1][0]/2,0,0]) OpenSans_bottom_letter0x56(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x56(steps);
        }
    }
    if (charcode == "0x57" || charcode == 87 || charcode=="W"){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x57[1][0]/2,0,0]) OpenSans_bottom_letter0x57(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x57(steps);
        }
    }
    if (charcode == "0x58" || charcode == 88 || charcode=="X"){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x58[1][0]/2,0,0]) OpenSans_bottom_letter0x58(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x58(steps);
        }
    }
    if (charcode == "0x59" || charcode == 89 || charcode=="Y"){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x59[1][0]/2,0,0]) OpenSans_bottom_letter0x59(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x59(steps);
        }
    }
    if (charcode == "0x5a" || charcode == 90 || charcode=="Z"){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x5a[1][0]/2,0,0]) OpenSans_bottom_letter0x5a(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x5a(steps);
        }
    }
    if (charcode == "0x5b" || charcode == 91 || charcode=="["){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x5b[1][0]/2,0,0]) OpenSans_bottom_letter0x5b(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x5b(steps);
        }
    }
    if (charcode == "0x5c" || charcode == 92 || charcode=="\\"){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x5c[1][0]/2,0,0]) OpenSans_bottom_letter0x5c(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x5c(steps);
        }
    }
    if (charcode == "0x5d" || charcode == 93 || charcode=="]"){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x5d[1][0]/2,0,0]) OpenSans_bottom_letter0x5d(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x5d(steps);
        }
    }
    if (charcode == "0x5e" || charcode == 94 || charcode=="^"){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x5e[1][0]/2,0,0]) OpenSans_bottom_letter0x5e(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x5e(steps);
        }
    }
    if (charcode == "0x5f" || charcode == 95 || charcode=="_"){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x5f[1][0]/2,0,0]) OpenSans_bottom_letter0x5f(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x5f(steps);
        }
    }
    if (charcode == "0x60" || charcode == 96 || charcode=="`"){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x60[1][0]/2,0,0]) OpenSans_bottom_letter0x60(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x60(steps);
        }
    }
    if (charcode == "0x61" || charcode == 97 || charcode=="a"){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x61[1][0]/2,0,0]) OpenSans_bottom_letter0x61(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x61(steps);
        }
    }
    if (charcode == "0x62" || charcode == 98 || charcode=="b"){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x62[1][0]/2,0,0]) OpenSans_bottom_letter0x62(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x62(steps);
        }
    }
    if (charcode == "0x63" || charcode == 99 || charcode=="c"){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x63[1][0]/2,0,0]) OpenSans_bottom_letter0x63(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x63(steps);
        }
    }
    if (charcode == "0x64" || charcode == 100 || charcode=="d"){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x64[1][0]/2,0,0]) OpenSans_bottom_letter0x64(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x64(steps);
        }
    }
    if (charcode == "0x65" || charcode == 101 || charcode=="e"){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x65[1][0]/2,0,0]) OpenSans_bottom_letter0x65(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x65(steps);
        }
    }
    if (charcode == "0x66" || charcode == 102 || charcode=="f"){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x66[1][0]/2,0,0]) OpenSans_bottom_letter0x66(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x66(steps);
        }
    }
    if (charcode == "0x67" || charcode == 103 || charcode=="g"){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x67[1][0]/2,0,0]) OpenSans_bottom_letter0x67(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x67(steps);
        }
    }
    if (charcode == "0x68" || charcode == 104 || charcode=="h"){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x68[1][0]/2,0,0]) OpenSans_bottom_letter0x68(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x68(steps);
        }
    }
    if (charcode == "0x69" || charcode == 105 || charcode=="i"){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x69[1][0]/2,0,0]) OpenSans_bottom_letter0x69(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x69(steps);
        }
    }
    if (charcode == "0x6a" || charcode == 106 || charcode=="j"){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x6a[1][0]/2,0,0]) OpenSans_bottom_letter0x6a(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x6a(steps);
        }
    }
    if (charcode == "0x6b" || charcode == 107 || charcode=="k"){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x6b[1][0]/2,0,0]) OpenSans_bottom_letter0x6b(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x6b(steps);
        }
    }
    if (charcode == "0x6c" || charcode == 108 || charcode=="l"){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x6c[1][0]/2,0,0]) OpenSans_bottom_letter0x6c(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x6c(steps);
        }
    }
    if (charcode == "0x6d" || charcode == 109 || charcode=="m"){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x6d[1][0]/2,0,0]) OpenSans_bottom_letter0x6d(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x6d(steps);
        }
    }
    if (charcode == "0x6e" || charcode == 110 || charcode=="n"){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x6e[1][0]/2,0,0]) OpenSans_bottom_letter0x6e(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x6e(steps);
        }
    }
    if (charcode == "0x6f" || charcode == 111 || charcode=="o"){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x6f[1][0]/2,0,0]) OpenSans_bottom_letter0x6f(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x6f(steps);
        }
    }
    if (charcode == "0x70" || charcode == 112 || charcode=="p"){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x70[1][0]/2,0,0]) OpenSans_bottom_letter0x70(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x70(steps);
        }
    }
    if (charcode == "0x71" || charcode == 113 || charcode=="q"){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x71[1][0]/2,0,0]) OpenSans_bottom_letter0x71(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x71(steps);
        }
    }
    if (charcode == "0x72" || charcode == 114 || charcode=="r"){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x72[1][0]/2,0,0]) OpenSans_bottom_letter0x72(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x72(steps);
        }
    }
    if (charcode == "0x73" || charcode == 115 || charcode=="s"){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x73[1][0]/2,0,0]) OpenSans_bottom_letter0x73(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x73(steps);
        }
    }
    if (charcode == "0x74" || charcode == 116 || charcode=="t"){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x74[1][0]/2,0,0]) OpenSans_bottom_letter0x74(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x74(steps);
        }
    }
    if (charcode == "0x75" || charcode == 117 || charcode=="u"){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x75[1][0]/2,0,0]) OpenSans_bottom_letter0x75(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x75(steps);
        }
    }
    if (charcode == "0x76" || charcode == 118 || charcode=="v"){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x76[1][0]/2,0,0]) OpenSans_bottom_letter0x76(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x76(steps);
        }
    }
    if (charcode == "0x77" || charcode == 119 || charcode=="w"){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x77[1][0]/2,0,0]) OpenSans_bottom_letter0x77(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x77(steps);
        }
    }
    if (charcode == "0x78" || charcode == 120 || charcode=="x"){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x78[1][0]/2,0,0]) OpenSans_bottom_letter0x78(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x78(steps);
        }
    }
    if (charcode == "0x79" || charcode == 121 || charcode=="y"){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x79[1][0]/2,0,0]) OpenSans_bottom_letter0x79(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x79(steps);
        }
    }
    if (charcode == "0x7a" || charcode == 122 || charcode=="z"){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x7a[1][0]/2,0,0]) OpenSans_bottom_letter0x7a(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x7a(steps);
        }
    }
    if (charcode == "0x7b" || charcode == 123 || charcode=="{"){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x7b[1][0]/2,0,0]) OpenSans_bottom_letter0x7b(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x7b(steps);
        }
    }
    if (charcode == "0x7c" || charcode == 124 || charcode=="|"){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x7c[1][0]/2,0,0]) OpenSans_bottom_letter0x7c(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x7c(steps);
        }
    }
    if (charcode == "0x7d" || charcode == 125 || charcode=="}"){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x7d[1][0]/2,0,0]) OpenSans_bottom_letter0x7d(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x7d(steps);
        }
    }
    if (charcode == "0x7e" || charcode == 126 || charcode=="~"){
        if(center==true){
            translate([-OpenSans_bottom_bbox0x7e[1][0]/2,0,0]) OpenSans_bottom_letter0x7e(steps);
        }else{
            translate([0,0,3/2]) OpenSans_bottom_letter0x7e(steps);
        }
    }
}
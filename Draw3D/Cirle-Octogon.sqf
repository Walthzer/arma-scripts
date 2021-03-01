onEachFrame {
	center = [(getPos player)#0,(getPos player)#1,1];
	//center = [5125.02,1459.66,1];
	radius = 10;
	sides = 64;
	thickness = 8;

	vector = VectorDir player;
	vector = [1,0,0];
	vector = (vector vectorMultiply radius);
	point0 = center vectorAdd vector;

	for "_i" from 1 to sides step 1 do {
		_angle = (360/sides) * _i;
		_rot = [vector#0 * cos(_angle) - vector#1 * sin(_angle), vector#0 * sin(_angle) + vector#1 * cos(_angle)];
		point1 = center vectorAdd _rot;

		for "_x" from 1 to thickness step 1 do {
			drawLine3D [point0, point1, [1,0,0,1]];
		};
		point0 = point1;
	};
};
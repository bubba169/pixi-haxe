package pixi.math;

@:native("PIXI.Point")
extern class Point implements IPoint {
	/**
	 * Position of the point on the x axis
	 */
	var x:Float;

	 /**
	  * Position of the point on the y axis
	  */
	var y:Float;

	/**
	 * The Point object represents a location in a two-dimensional coordinate system, where x represents
	 * the horizontal axis and y represents the vertical axis.
	 *
	 * @param x position of the point on the x axis
	 * @param y position of the point on the y axis
	 */
	function new(x:Float = 0, y:Float = 0);

	/**
	 * Adds other to this point and outputs into outPoint or a new Point.
	 * 
	 * Note: Only available with @pixi/math-extras.
	 * 
	 * @param other The point to add to this.
	 * @param outPoint A Point-like object in which to store the value, optional (otherwise will create a new Point).
	 * @return The outPoint reference or a new Point, with the result of the addition.
	 */
	function add(other:IPointData, ?outPoint:IPointData):IPointData;

	/**
	 * Creates a clone of this point
	 * @return A clone of this point
	 */
	function clone():Point;

	/**
	 * Copies x and y from the given point
	 *
	 * @param p The point to copy from
	 * @return Returns itself.
	 */
	function copyFrom(p:IPointData):Point;

	/**
	 * Copies x and y into the given point
	 *
	 * @param {Point} p - The point to copy.
	 * @return {Point} Given point with values updated
	 */
	function copyTo(p:IPointData):IPointData;

	/**
	 * Computes the cross product of other with this point. Given two linearly independent R3 vectors a and b, 
	 * the cross product, a × b (read "a cross b"), is a vector that is perpendicular to both a and b, and thus 
	 * normal to the plane containing them. While cross product only exists on 3D space, we can assume the z 
	 * component of 2D to be zero and the result becomes a vector that will only have magnitude on the z axis.
	 * 
	 * This function returns the z component of the cross product of the two points.
	 * 
	 * Note: Only available with @pixi/math-extras.
	 * 
	 * @param other The other point to calculate the cross product with this.
	 * @return The z component of the result of the cross product.
	 */
	function cross(other:IPointData):Float;

	/**
	 * Computes the dot product of other with this point. The dot product is the sum of the products of the 
	 * corresponding components of two vectors.
	 * 
	 * Note: Only available with @pixi/math-extras.
	 * 
	 * @param other The other point to calculate the dot product with this.
	 * @return The result of the dot product. This is an scalar value.
	 */
	function dot(other:IPointData):Float;

	/**
	 * Accepts another point (p) and returns true if the given point is equal to this point
	 *
	 * @param p The point to check
	 * @return Returns true if both x and y are equal
	 */
	function equals(p:IPointData):Bool;

	/**
	 * Computes the magnitude of this point (Euclidean distance from 0, 0).
	 * Defined as the square root of the sum of the squares of each component.
	 * 
	 * Note: Only available with @pixi/math-extras.
	 * 
	 * @return The magnitude (length) of the vector.
	 */
	function magnitude():Float;

	/**
	 * Computes the square magnitude of this point. If you are comparing the lengths of vectors, 
	 * you should compare the length squared instead as it is slightly more efficient to calculate.
	 * 
	 * Defined as the sum of the squares of each component.
	 * 
	 * Note: Only available with @pixi/math-extras.
	 * 
	 * @return The magnitude squared (length squared) of the vector.
	 */
	function magnitudeSquared():Float;

	/**
	 * Multiplies component-wise other and this points and outputs into outPoint or a new Point.
	 * 
	 * Note: Only available with @pixi/math-extras.
	 * 
	 * @param other The point to multiply with this.
	 * @param outPoint A Point-like object in which to store the value, optional (otherwise will create a new Point).
	 * @return The outPoint reference or a new Point, with the component-wise multiplication.
	 */
	function multiply(other:IPointData, ?outPoint:IPointData):IPointData;

	/**
	 * Multiplies each component of this point with the number scalar and outputs into outPoint or a new Point.
	 * 
	 * Note: Only available with @pixi/math-extras.
	 * 
	 * @param scalar The number to multiply both components of this.
	 * @param outPoint A Point-like object in which to store the value, optional (otherwise will create a new Point).
	 * @return The outPoint reference or a new Point, with the multiplication.
	 */
	function multiplyScalar(scalar:Float, ?outPoint:IPointData):IPointData;

	/**
	 * Computes a normalized version of this point. A normalized vector is a vector of magnitude (length) 1
	 * 
	 * Note: Only available with @pixi/math-extras.
	 * 
	 * @param outPoint A Point-like object in which to store the value, optional (otherwise will create a new Point).
	 * @return The normalized point.
	 */
	function normalize(?outPoint:IPointData):IPointData;

	/**
	 * Computes vector projection of this on onto.
	 * 
	 * Imagine a light source, parallel to onto, above this. The light would cast rays perpendicular to onto. 
	 * this.project(onto) is the shadow cast by this on the line defined by onto.
	 * 
	 * Note: Only available with @pixi/math-extras.
	 * 
	 * @param onto A non zero vector describing a line on which to project this.
	 * @param outPoint A Point-like object in which to store the value, optional (otherwise will create a new Point).
	 * @return The this on onto projection.
	 */
	function project(onto:IPointData, ?outPoint:IPointData):IPointData;

	/**
	 * Reflects this vector off of a plane orthogonal to normal. normal is not normalized during this process. 
	 * Consider normalizing your normal before use. 
	 * 
	 * Imagine a light source bouncing onto a mirror. this vector is the light and normal is a vector perpendicular 
	 * to the mirror. this.reflect(normal) is the reflection of this on that mirror.
	 * 
	 * Note: Only available with @pixi/math-extras.
	 * 
	 * @param normal The normal vector of your reflecting plane.
	 * @param outPoint A Point-like object in which to store the value, optional (otherwise will create a new Point).
	 * @return The reflection of this on your reflecting plane.
	 */
	function reflect(normal:IPointData, ?outPoint:IPointData):IPointData;

	/**
	 * Sets the point to a new x and y position. 
	 * If y is omitted, both x and y will be set to x.
	 *
	 * @param x position of the point on the x axis
	 * @param y position of the point on the y axis
	 * @return Returns itself
	 */
	function set(?x:Float, ?y:Float):Point;

	/**
	 * Subtracts other from this point and outputs into outPoint or a new Point.
	 * 
	 * Note: Only available with @pixi/math-extras.
	 * 
	 * @param other The point to subtract to this.
	 * @param outPoint A Point-like object in which to store the value, optional (otherwise will create a new Point).
	 * @return The outPoint reference or a new Point, with the result of the subtraction.
	 */
	function subtract(other:IPointData, ?outPoint:IPointData):IPointData;	
}

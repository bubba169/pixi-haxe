package pixi.math.shapes;

import pixi.Pixi.Shapes;

@:native("PIXI.Rectangle")
extern class Rectangle {

	var x:Float;
	var y:Float;
	var width:Float;
	var height:Float;

	/**
	 * Returns the left edge of the rectangle.
	 */
	var left:Float;
 
	/**
	 * Returns the right edge of the rectangle.
	 */
	var right:Float;

	/**
	 * Returns the top edge of the rectangle.
	 */
	var top:Float;

	/**
	 * Returns the bottom edge of the rectangle.
	 */
	var bottom:Float;

	/**
	 * The type of the object, mainly used to avoid instanceof checks
	 */
	var type(default, null):Shapes;

	/**
	 * Rectangle object is an area defined by its position, as indicated by its top-left corner point (x, y) and by its width and its height.
	 *
	 * @param x The X coord of the upper-left corner of the rectangle
	 * @param y The Y coord of the upper-left corner of the rectangle
	 * @param width The overall width of this rectangle
	 * @param height The overall height of this rectangle
	 */
	function new(x:Float = 0, y:Float = 0, width:Float = 0, height:Float = 0):Void;

	/**
	 * Enlarges rectangle that way its corners lie on grid
	 * 
	 * @param resolution resulution
	 * @param eps precision
	 * @return Returns itself.
	 */
	function ceil(resolution:Float, eps:Float):Rectangle;

	/**
	 * Creates a clone of this Rectangle
	 *
	 * @return a copy of the rectangle
	 */
	function clone():Rectangle;

	/**
	 * Checks whether the x and y coordinates given are contained within this Rectangle
	 *
	 * @param  x The X coordinate of the point to test
	 * @param  y The Y coordinate of the point to test
	 * @return Whether the x and y coordinates are within this Rectangle.
	 */
	function contains(x:Float, y:Float):Bool;

	/**
	 * Determines whether the other Rectangle is contained within this Rectangle object. 
	 * Rectangles that occupy the same space are considered to be containing each other. 
	 * Rectangles without area (width or height equal to zero) can't contain anything, not even other arealess rectangles. 
	 * 
	 * Note: Only available with @pixi/math-extras.
	 * 
	 * @param other The Rectangle to fit inside this.
	 * @return A value of true if this Rectangle contains other; otherwise false.
	 */
	function containsRect(other:Rectangle):Bool;

	/**
	 * Copies another Rectangle to this one.
	 *
	 * @param  rectangle The rectangle to copy from
	 * @return Returns itself.
	 */
	function copyFrom(rectangle:Rectangle):Rectangle;

	/**
	 * Copies this rectangle to another one.
	 * 
	 * @param rectangle The rectangle to copy to.
	 * @return Returns given parameter.
	 */
	function copyTo(rectangle:Rectangle):Rectangle;

	/**
	 * Enlarges this rectangle to include the passed rectangle.
	 *
	 * @param rectangle The rectangle to include.
	 */
	function enlarge(rectangle:Rectangle):Rectangle;

	/**
	 * Accepts other Rectangle and returns true if the given Rectangle is equal to this Rectangle.
	 * 
	 * Note: Only available with @pixi/math-extras.
	 * 
	 * @param rectangle The Rectangle to compare with this
	 * @return Returns true if all x, y, width, and height are equal.
	 */
	function equals(other:Rectange):Bool;

	/**
	 * Fits this rectangle around the passed one.
	 *
	 * @param rectangle The rectangle to fit.
	 * @return Returns itself
	 */
	function fit(rectangle:Rectangle):Rectangle;

	/**
	 * Determines whether the other Rectangle intersects with this Rectangle object.
	 * Returns true only if the area of the intersection is > 0, this means that Rectangles
	 * sharing a side are not overlapping. Another side effect is that an arealess rectangle
	 * (width or height equal to zero) can't intersect any other rectangle.
	 * 
	 * Note: Only available with @pixi/math-extras.
	 * 
	 * @param other The Rectangle to intersect with this.
	 * @return A value of true if the other Rectangle intersects with this; otherwise false.
	 */
	function intersects(other:Rectangle):Bool;

	/**
	 * If the area of the intersection between the Rectangles other and this is not zero, returns the 
	 * area of intersection as a Rectangle object. Otherwise, return an empty Rectangle with its properties 
	 * set to zero. Rectangles without area (width or height equal to zero) can't intersect or be 
	 * intersected and will always return an empty rectangle with its properties set to zero.
	 * 
	 * Note: Only available with @pixi/math-extras.
	 * 
	 * @param other The Rectangle to intersect with this.
	 * @param outRect A Rectangle object in which to store the value, optional (otherwise will create a new Rectangle).
	 * @return The intersection of this and other.
	 */
	function intersection(other:Rectangle, ?outRect:Rectangle):Rectangle;

	/**
	 * Pads the rectangle making it grow in all directions. 
	 * If paddingY is omitted, both paddingX and paddingY will be set to paddingX.
	 *
	 * @param padX The horizontal padding amount.
	 * @param padY The vertical padding amount.
	 */
	function pad(paddingX:Float = 0, ?paddingY:Float):Void;

	/**
	 * Adds this and other Rectangles together to create a new Rectangle object filling
 	 * the horizontal and vertical space between the two rectangles.
	 * 
	 * Note: Only available with @pixi/math-extras.
	 * 
	 * @param other The Rectangle to unite with this.
	 * @param outRect A Rectangle object in which to store the value, optional (otherwise will create a new Rectangle).
	 * @return The union of this and other.
	 */
	 function union(other:Rectangle, ?outRect:Rectangle):Rectangle;
}

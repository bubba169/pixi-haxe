package pixi.math;

import js.lib.Float32Array;

@:native("PIXI.Matrix")
extern class Matrix {
	/**
	 * A default (identity) matrix
	 */
	static var IDENTITY:Matrix;

	/**
	 * A temp matrix
	 */
	static var TEMP_MATRIX:Matrix;

	var a:Float;
	var b:Float;
	var c:Float;
	var d:Float;
	var tx:Float;
	var ty:Float;

	/**
	 * The Matrix class is now an object, which makes it a lot faster,
	 * here is a representation of it :
	 * | a | b | tx|
	 * | c | d | ty|
	 * | 0 | 0 | 1 |
	 *
	 * @param a x scale
	 * @param b y skew
	 * @param c x skew
	 * @param d y scale
	 * @param tx x translation
	 * @param ty translation
	 */
	function new(a:Float = 1, b:Float = 0, c:Float = 0, d:Float = 1, tx:Float = 0, ty:Float = 0);

	/**
	 * Appends the given Matrix to this Matrix.
	 * 
	 * @param matrix The matrix to append.
	 * @return This matrix. Good for chaining method calls.
	 */
	function append(matrix:Matrix):Matrix;

	/**
	 * Get a new position with the current transformation applied.
	 * Can be used to go from a child's coordinate space to the world coordinate space. (e.g. rendering)
	 *
	 * @param pos The origin
	 * @param newPos The point that the new position is assigned to (allowed to be same as input)
	 * @return The new point, transformed through this matrix
	 */
	function apply(pos:IPointData, ?newPos:Point):Point;

	/**
	 * Get a new position with the inverse of the current transformation applied.
	 * Can be used to go from the world coordinate space to a child's coordinate space. (e.g. input)
	 *
	 * @param pos The origin
	 * @param newPos The point that the new position is assigned to (allowed to be same as input)
	 * @return The new point, inverse-transformed through this matrix
	 */
	 function applyInverse(pos:IPointData, ?newPos:Point):Point;

	/**
	 * Creates a Matrix object based on the given array. The Element to Matrix mapping order is as follows:
	 *
	 * a = array[0]
	 * b = array[1]
	 * c = array[3]
	 * d = array[4]
	 * tx = array[2]
	 * ty = array[5]
	 *
	 * @param array The array that the matrix will be populated from.
	 */
	function fromArray(array:Array<Float>):Void;

	/**
	 * Creates a new Matrix object with the same values as this one.
	 * 
	 * @return A copy of this matrix. Good for chaining method calls.
	 */
	function clone():Matrix;

	/**
	 * Changes the values of the matrix to be the same as the ones in given matrix
	 * 
	 * @param matrix The matrix to copy from.
	 * @return Returns itself
	 */
	function copyFrom(matrix:Matrix):Matrix;

	/**
	 * Changes the values of the given matrix to be the same as the ones in this matrix
	 * 
	 * @param matrix The matrix to copy to.
	 * @return The matrix given in parameter with its values updated.
	 */
	function copyTo(matrix:Matrix):Matrix;

	/**
	 * Decomposes the matrix (x, y, scaleX, scaleY, and rotation) and sets the properties on to a transform.
	 * 
	 * @param transform The transform to apply the properties to.
	 * @return The transform with the newly applied properties
	 */
	function decompose(transform:Transform):Transform;

	/**
	 * Creates a Matrix object based on the given array. The Element to Matrix mapping order is as follows:
	 * a = array[0] b = array[1] c = array[3] d = array[4] tx = array[2] ty = array[5]
	 * 
	 * @param array The array that the matrix will be populated from.
	 */
	function fromArray(array:Array<Float>):Void;

	/**
	 * Resets this Matix to an identity (default) matrix.
	 *
	 * @return This matrix. Good for chaining method calls.
	 */
	function identity():Matrix;

	/**
	 * Inverts this matrix
	 * 
	 * @return This matrix. Good for chaining method calls.
	 */
	function invert():Matrix;

	/**
	 * Prepends the given Matrix to this Matrix.
	 * 
	 * @param matrix The matrix to prepend
	 * @return This matrix
	 */
	function prepend(matrix:Matrix):Matrix;

	/**
	 * Applies a rotation to the matrix
	 * 
	 * @param angle The angle in radians
	 * @return This matrix
	 */
	function rotate(angle:Float):Matrix;

	/**
	 * Applies a scale transformation to the matrix.
	 * 
	 * @param x The amount to scale horizontally
	 * @param y The amount to scale vertically
	 * @return This matrix
	 */
	function scale(x:Float, y:Float):Matrix;

	/**
	 * Sets the matrix properties.
	 * @param a Matrix component
	 * @param b Matrix component
	 * @param c Matrix component
	 * @param d Matrix component
	 * @param tx Matrix component
	 * @param ty Matrix component
	 * @return This matrix
	 */
	function set(a:Float, b:Float, c:Float, d:Float, tx:Float, ty:Float):Matrix;

	/**
	 * Sets the matrix based on all the available properties
	 * @param x Position on the x axis
	 * @param y Position on the y axis
	 * @param pivotX Pivot on the x axis
	 * @param pivotY Pivot on the y axis
	 * @param scaleX Scale on the x axis
	 * @param scaleY Scale on the y axis
	 * @param rotation Rotation in radians
	 * @param skewX Skew on the x axis
	 * @param swewY Skew on the y axis
	 * @return This matrix. Good for chaining method calls.
	 */
	function setTransform(x:Float, y:Float, pivotX:Float, pivotY:Float, scaleX:Float, scaleY:Float, rotation:Float, skewX:Float, swewY:Float):Matrix;

	/**
	 * Creates an array from the current Matrix object.
	 * @param transpose Whether we need to transpose the matrix or not
	 * @param out If provided the array will be assigned to out
	 * @return The newly created array which contains the matrix
	 */
	function toArray(transpose:Bool, out:Float32Array):Float32Array;

	/**
	 * Translates the matrix on the x and y
	 * @param x How much to translate x by
	 * @param y How much to translate y by
	 * @return This matrix. Good for chaining method calls.
	 */
	function translate(x:Float, y:Float):Matrix;	
}

package pixi.display;

import pixi.math.IPointData;
import js.lib.Float32Array;
import pixi.math.Matrix;
import pixi.math.Point;
import pixi.math.shapes.Rectangle;

@:native("PIXI.Bounds")
extern class Bounds {

	var maxX:Float;
	var maxY:Float;
	var minX:Float;
	var minY:Float;

	/**
	 * It is updated to _boundsID of corresponding object to keep bounds in sync with content. 
	 * Updated from outside, thus public modifier.
	 */
	var updateID:Int;

	/**
	 * 'Builder' pattern for bounds rectangles.
	 * 
	 * This could be called an Axis-Aligned Bounding Box. It is not an actual shape. It is a mutable thing; 
	 * no 'EMPTY' or those kind of problems.
	 */
	 function new();

	/**
	 * Adds other Bounds
	 * 
	 * @param bounds The Bounds to be added
	 */
	function addBounds(bounds:Bounds):Void;

	/**
	 * Adds other Bounds, masked with Rectangle
	 * 
	 * @param bounds The bounds to be added
	 * @param area The Rectangle mask
	 */
	 function addBoundsArea(bounds:Bounds, area:Rectangle):Void;

	/**
	 * Adds other Bounds, masked with Bounds
	 * 
	 * @param bounds The Bounds to be added.
	 * @param mask The Bounds to use as a mask.
	 */
	function addBoundsMask(bounds:Bounds, mask:Bounds):Void;

	/**
	 * Adds other Bounds, multiplied by matrix. Bounds shouldn't be empty.
	 * 
	 * @param bounds The Bounds to be added.
	 * @param matrix multiplicator.
	 */
	 function addBoundsMatrix(bounds:Bounds, matrix:Matrix):Void;

	/**
	 * Adds sprite frame, transformed.
	 * 
	 * @param transform Transform to apply
	 * @param x0 Left X of frame
	 * @param y0 Top Y of frame
	 * @param x1 Right X of frame
	 * @param y1 Bottom Y of frame
	 */
	function addFrame(transform:Transform, x0:Float, y0:Float, x1:Float, y1:Float):Void;

	/**
	 * Adds sprite frame, multiplied by matrix.
	 * 
	 * @param transform Matrix to apply
	 * @param x0 Left X of frame
	 * @param y0 Top Y of frame
	 * @param x1 Right X of frame
	 * @param y1 Bottom Y of frame
	 */
	function addFrameMatrix(matrix:Matrix, x0:Float, y0:Float, x1:Float, y1:Float):Void;

	/**
	 * Adds padded frame. (x0, y0) should be strictly less than (x1, y1)
	 * @param x0 Left X of frame
	 * @param y0 Top Y of frame
	 * @param x1 Right X of frame
	 * @param y1 Bottom Y of frame 
	 * @param padX Padding X
	 * @param padY Padding Y
	 */
	function addFramePad(x0:Float, y0:Float, x1:Float, y1:Float, padX:Float, padY:Float):Void;

	/**
	 * This function should be inlined when its possible.
	 *
	 * @param point The point to add.
	 */
	function addPoint(point:IPointData):Void;

	/**
	 * Adds a point, after transformed. This should be inlined when its possible.
	 *
	 * @param matrix Transformed by this matrix.
	 * @param point The point to add.
	 */
	function addPointMatrix(matrix:Matrix, point:IPointData):Void;

	 /**
	 * Adds a quad, not transformed
	 *
	 * @param vertices The verts to add.
	 */
	function addQuad(vertices:Float32Array):Void;

	/**
	 * Adds screen vertices from array
	 * 
	 * @param vertexData calculated vertices
	 * @param beginOffset begin offset
	 * @param endOffset end offset, excluded
	 */
	function addVertexData(vertexData:Float32Array, beginOffset:Int, endOffset:Int):Void;

	/**
	 * Add an array of vertices
	 * 
	 * @param transform Mesh transform
	 * @param vertices Mesh coordinates in array
	 * @param beginOffset begin offset
	 * @param endOffset end offset, excluded
	 */
	function addVertices(transform:Transform, vertices:Float32Array, beginOffset:Int, endOffset:Int):Void;

	/**
	 * Add an array of mesh vertices.
	 * 
	 * @param matrix Mesh matrix
	 * @param vertices Mesh coordinates in array
	 * @param beginOffset begin offset
	 * @param endOffset end offset, excluded
	 * @param padX X padding
	 * @param padY Y padding
	 */
	 function addVerticesMatrix(matrix:Matrix, vertices:Float32Array, beginOffset:Int, endOffset:Int, padX:Float = 0, padY:Float = 0):Void;

	 
	/**
	 * Clears the bounds and resets.
	 */
	function clear():Void;

	/**
	 * Can return Rectangle.EMPTY constant, either construct new rectangle, either use your rectangle
	 * It is not guaranteed that it will return tempRect
	 *
	 * @param rect Temporary object will be used if AABB is not empty
	 * @return A rectangle of the bounds
	 */
	function getRectangle(rect:Rectangle):Rectangle;
	  
	/**
	 * Checks if bounds are empty.
	 *
	 * @return True if empty.
	 */
	function isEmpty():Bool;

	/**
	 * Pads bounds object, making it grow in all directions. If paddingY is omitted, both paddingX
	 * and paddingY will be set to paddingX.
	 * 
	 * @param paddingX The horizontal padding amount.
	 * @param paddingY The vertical padding amount.
	 */
	function pad (paddingX:Float = 0, ?paddingY : Float):Void;
}

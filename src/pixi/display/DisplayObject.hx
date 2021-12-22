package pixi.display;

import pixi.Pixi.MSAAQuality;
import pixi.display.Bounds;
import haxe.extern.EitherType;
import pixi.core.graphics.Graphics;
import pixi.math.Matrix;
import pixi.math.Point;
import pixi.math.shapes.Rectangle;
import pixi.core.renderers.webgl.filters.Filter;
import pixi.core.sprites.Sprite;
import pixi.utils.EventEmitter;

/**
 * The base class for all objects that are rendered on the screen.
 * This is an abstract class and can not be used on its own; rather it should be extended.
 */
@:native("PIXI.DisplayObject")
extern class DisplayObject extends EventEmitter {

	/**
	 * Used internally by the AccessibilityManager
	 */
	var _accessibleActive:Bool = false;

	/**
	 * Used internally by the AccessibilityManager
	 */
	var _accessibleDiv:Bool;

	/**
	 * The bounds object, this is used to calculate and store the bounds of the displayObject.
	 */
	var _bounds:Bounds;

	/**
	 * Local bounds object, swapped with _bounds when using getLocalBounds().
	 */
	var _localBounds:Bounds;

	/**
	 * Flag for if the object is accessible. If true AccessibilityManager will overlay a shadow div with attributes set
	 * 
	 * @default false
	 */
	var accessible:Bool = false;

	/**
	 * Setting to false will prevent any children inside this container to be accessible. Defaults to true.
	 */
	var accessibleChildren:Bool = true;

	/**
	 * Sets the aria-label attribute of the shadow div
	 */
	var accessibleHint:String = "";

	/**
	 * Specify the pointer-events the accessible div will use Defaults to auto.
	 */
	var accessiblePointerEvents:String = 'auto';

	/**
	 * Sets the title attribute of the shadow div If accessibleTitle AND accessibleHint has not been this 
	 * will default to 'displayObject [tabIndex]'
	 */
	var accessibleTitle:Null<String> = null;

	/**
	 * Specify the type of div the accessible layer is. Screen readers treat the element differently depending on this type. 
	 * Defaults to button.
	 */
	var accessibleType:String = 'button';

	/**
	 * The opacity of the object.
	 */
	var alpha:Float = 1;

	/**
	 * The angle of the object in degrees. 'rotation' and 'angle' have the same effect on a display object; 
	 * rotation is in radians, angle is in degrees.
	 */
	var angle:Float;

	/**
	 * If enabled, the mouse cursor use the pointer behavior when hovered over the displayObject if it is 
	 * interactive Setting this changes the 'cursor' property to 'pointer'.
	 */
	var buttonMode:Bool;

	/**
	 * Set this to true if you want this display object to be cached as a bitmap. This basically takes a snap 
	 * shot of the display object as it is at that moment. It can provide a performance benefit for complex 
	 * static displayObjects. To remove simply set this property to false
	 * 
	 * IMPORTANT GOTCHA - Make sure that all your textures are preloaded BEFORE setting this property to true 
	 * as it will take a snapshot of what is currently there. If the textures have not loaded then they will 
	 * not appear.
	 */
	var cacheAsBitmap:Bool;

	/**
	 * The number of samples to use for cacheAsBitmap. If set to null, the renderer's sample count is used. 
	 * If cacheAsBitmap is set to true, this will re-render with the new number of samples.
	 */
	var cacheAsBitmapMultisample:MSAAQuality;


	/**
	 * The resolution to use for cacheAsBitmap. By default this will use the renderer's resolution but can be 
	 * overriden for performance. Lower values will reduce memory usage at the expense of render quality. 
	 * A falsey value of null or 0 will default to the renderer's resolution. If cacheAsBitmap is set to true, 
	 * this will re-render with the new resolution.
	 */
	var cacheAsBitmapResolution:Null<Float>;

	/**
	 * This defines what cursor mode is used when the mouse cursor is hovered over the displayObject.
	 */
	var cursor:String;

	/**
	 * Readonly flag for destroyed display objects.
	 */
	var destroyed(default, null):Bool;

	/**
	 * The area the filter is applied to. This is used as more of an optimization rather than figuring out the 
	 * dimensions of the displayObject each frame you can set this rectangle.
	 * 
	 * Also works as an interaction mask.
	 */
	var filterArea:Rectangle;

	var filters:Array<Filter>;

	/**
	 * Retrieves the bounds of the displayObject as a rectangle object
	 *
	 * @param skipUpdate {Matrix} setting to true will stop the transforms of the scene graph from being updated.
	 * This means the calculation returned MAY be out of date BUT will give you a nice performance boost
	 * @param rect {Rectangle} Optional rectangle to store the result of the bounds calculation
	 * @return {Rectangle} the rectangular bounding area
	 */
	function getBounds(?skipUpdate:Bool, ?rect:Rectangle):Rectangle;

	/**
	 * Retrieves the local bounds of the displayObject as a rectangle object
	 *
	 * @param rect {Rectangle} Optional rectangle to store the result of the bounds calculation
	 * @return {Rectangle} the rectangular bounding area
	 */
	function getLocalBounds(?rect:Rectangle):Rectangle;

	/**
	 * Calculates the global position of the display object
	 *
	 * @param position {Point} The world origin to calculate from
	 * @param point {Point} A Point in which to store the value, optional (otherwise a new Point is created)
	 * @param skipUpdate {Bool} Should we skip the update transform
	 * @return {Point} A point object representing the position of this object
	 */
	function toGlobal(position:Point, ?point:Point, ?skipUpdate:Bool):Point;

	/**
	 * Calculates the local position of the display object relative to another point
	 *
	 * @param position {Point} The world origin to calculate from
	 * @param [from] {DisplayObject} The DisplayObject to calculate the global position from
	 * @param [point] {Point} A Point object in which to store the value, optional (otherwise will create a new Point)
	 * @return {Point} A point object representing the position of this object
	 */
	function toLocal(position:Point, ?frm:DisplayObject, ?point:Point):Point;

	/*
	 * Updates the object transform for rendering
	 */
	function updateTransform():Void;
	function displayObjectUpdateTransform():Void;

	/**
	 * Set the parent Container of this DisplayObject
	 *
	 * @param container {Container} The Container to add this DisplayObject to
	 * @return {Container} The Container that this DisplayObject was added to
	 */
	function setParent(container:Container):Container;

	/**
	 * Convenience function to set the postion, scale, skew and pivot at once.
	 *
	 * @param [x=0] {Float} The X position
	 * @param [y=0] {Float} The Y position
	 * @param [scaleX=1] {Float} The X scale value
	 * @param [scaleY=1] {Float} The Y scale value
	 * @param [skewX=0] {Float} The X skew value
	 * @param [skewY=0] {Float} The Y skew value
	 * @param [pivotX=0] {Float} The X pivot value
	 * @param [pivotY=0] {Float} The Y pivot value
	 * @return {DisplayObject}
	 */
	function setTransform(?x:Float, ?y:Float, ?scaleX:Float, ?scaleY:Float, ?rotation:Float, ?skewX:Float, ?skewY:Float, ?pivotX:Float,
		?pivotY:Float):DisplayObject;

	/**
	 * Base destroy method for generic display objects
	 * Removes all internal references and listeners as well as removes children from the display list.
	 *
	 * @param {object|boolean} [options] - Options parameter. A boolean will act as if all options
	 *  have been set to that value
	 * @param {boolean} [options.children=false] - if set to true, all the children will have their destroy
	 *  method called as well. 'options' will be passed on to those calls.
	 * @param {boolean} [options.texture=false] - Only used for child Sprites if options.children is set to true
	 *  Should it destroy the texture of the child sprite
	 * @param {boolean} [options.baseTexture=false] - Only used for child Sprites if options.children is set to true
	 *  Should it destroy the base texture of the child sprite
	 */
	function destroy(?options:EitherType<Bool, DestroyOptions>):Void;
}

typedef DestroyOptions = {
	/**
	 * {boolean} [options.children=false] - if set to true, all the children will have their destroy
	 *  method called as well. 'options' will be passed on to those calls.
	 */
	@:optional var children:Bool;

	/**
	 * {boolean} [options.texture=false] - Only used for child Sprites if options.children is set to true
	 * Should it destroy the texture of the child sprite
	 */
	@:optional var texture:Bool;

	/**
	 * {boolean} [options.baseTexture=false] - Only used for child Sprites if options.children is set to true
	 * Should it destroy the base texture of the child sprite
	 */
	@:optional var baseTexture:Bool;
}

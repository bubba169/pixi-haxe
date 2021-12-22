package pixi.core.accessibility;

import js.html.HtmlElement;
import pixi.core.math.shapes.Rectangle;
import pixi.core.renderers.AbstractRenderer;

@:native("PIXI.AccessibilityManager")
extern class AccessibilityManager {
	/**
	 * The Accessibility manager recreates the ability to tab and have content read by screen readers. This is very 
	 * important as it can possibly help people with disabilities access PixiJS content.
	 * 
	 * A DisplayObject can be made accessible just like it can be made interactive. This manager will map the events as
	 * if the mouse was being used, minimizing the effort required to implement.
	 * 
	 * An instance of this class is automatically created by default, and can be found at renderer.plugins.accessibility
	 */
	function new(renderer:AbstractRenderer);

	/**
	 * Setting this to true will visually show the divs
	 */
	var debug:Bool;

	/**
	 * Value of true if accessibility is currently active and accessibility layers are showing.
	 */
	var isActive(default, null):Bool;

	/**
	 * Value of true if accessibility is enabled for touch devices.
	 */
	var isMobileAccessibility(default, null):Bool;

	/**
	 * The renderer this accessibility manager works for.
	 */
	var renderer:AbstractRenderer;

	/**
	 * Adjust the hit area based on the bounds of a display object
	 * @param	hitArea Bounds of the child
	 */
	function capHitArea(hitArea:Rectangle):Void;

	/**
	 * Destroys the accessibility manager
	 */
	function destroy():Void;

	/**
	 * Private function that will visually add the information to the accessibility div
	 * @param div
	 */
	function updateDebugHTML(div:HtmlElement): Void;
}

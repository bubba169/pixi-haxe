package pixi.core.batch;

import pixi.core.display.DisplayObject;
import pixi.core.Renderer;
import pixi.core.renderers.webgl.managers.WebGLManager;

@:native('PIXI.ObjectRenderer')
extern class ObjectRenderer implements ISystem {

	/**
	 * The renderer this manager works for
	 */
	private var renderer:Renderer;

	/**
	 * Base for a common object renderer that can be used as a system renderer plugin.
	 *
	 * @param renderer The renderer this object renderer works for.
	 */
	function new(renderer:Renderer);

	/**
	 * Generic destruction method that frees all resources. This should be called by subclasses.
	 */
	function destroy():Void;

	/**
	 * Stub method that should be used to empty the current batch by rendering objects now.
	 */
	function flush():Void;

	/**
	 * Keeps the object to render. It doesn't have to be rendered immediately.
	 *
	 * @param object The object to render.
	 */
	 function render(object:DisplayObject):Void;

	/**
	 * Stub method that initializes any state required before rendering starts. 
	 * It is different from the prerender signal, which occurs every frame, in 
	 * that it is called whenever an object requests this renderer specifically.
	 */
	function start():Void;

	/**
	 * Stops the renderer. It should free up any state and become dormant.
	 */
	function stop():Void;
}

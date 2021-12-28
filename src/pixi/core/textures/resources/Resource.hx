package pixi.core.textures.resources;

import js.lib.Promise;
import pixi.core.Renderer;
import pixi.core.textures.BaseTexture;

@:native("PIXI.Resource")
extern class Resource {
	/**
	 * If resource has been destroyed
	 */
	var destroyed(default, null):Bool;

	/**
	 * The height of the resource.
	 */
	var height(default, null):Float;

	/**
	 * true if resource is created by BaseTexture useful for doing cleanup with BaseTexture destroy and 
	 * not cleaning up resources that were created externally.
	 */
	var internal:Bool;

	/**
	 * Has been validated
	 */
	var valid(default, null):Bool;

	/**
	 * The width of the resource.
	 */
	var width(default, null):Float;

	/**
	 * Internal height of the resource
	 */
	private var _height:Float;

	/**
	 * Internal width of the resource
	 */
	private var _width:Float;

	/**
	 * Abstract, used to auto-detect resource type.
	 * 
	 * @param source The source object
	 * @param extension The extension of source, if set
	 */
	static function test(source:Dynamic, ?extension:String):Bool;

	/**
	 * Base resource class for textures that manages validation and uploading, depending on its type.
	 * 
	 * Uploading of a base texture to the GPU is required.
	 * 
	 * @param width Width of the resource
	 * @param height Height of the resource
	 */
	function new(width:Float = 0, height:Float = 0);

	/**
	 * Bind to a parent BaseTexture
	 * 
	 * @param baseTexture Parent texture
	 */
	function bind(baseTexture:BaseTexture):Void;

	/**
	 * Call when destroying resource, unbind any BaseTexture object before calling this method, 
	 * as reference counts are maintained internally.
	 */
	function destroy():Void;

	/**
	 * Clean up anything, this happens when destroying is ready.
	 */
	function dispose():Void;

	/**
	 * Trigger a resize event
	 * 
	 * @param width X dimension
	 * @param height Y dimension
	 */
	function resize(width:Float, height:Float):Void;

	/**
	 * Set the style, optional to override
	 * @param renderer yeah, renderer!
	 * @param baseTexture the texture
	 * @param glTexture texture instance for this webgl context
	 * @return true is success
	 */
	function style(renderer:Renderer, baseTexture:BaseTexture, glTexture:GLTexture):Bool;

	/**
	 * Unbind to a parent BaseTexture
	 * @param	baseTexture
	 */
	function unbind(baseTexture:BaseTexture):Void;

	/**
	 * Has been updated trigger event
	 */
	function update():Void;

	/**
	 * Uploads the texture or returns false if it cant for some reason. Override this.
	 * @param	renderer yeah, renderer!
	 * @param	baseTexture the texture
	 * @param	glTexture texture instance for this webgl context
	 * @return true is success
	 */
	function upload(renderer:Renderer, baseTexture:BaseTexture, glTexture:GLTexture):Bool;

	/**
	 * This can be overridden to start preloading a resource or do any other prepare step.
	 * 
	 * @return Handle the validate event
	 */
	private function load():Promise<Resource>;
}

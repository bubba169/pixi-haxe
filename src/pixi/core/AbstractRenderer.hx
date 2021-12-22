package pixi.core;

import js.html.CanvasElement;
import pixi.Pixi.RendererType;
import pixi.Pixi.ScaleModes;
import pixi.core.Renderer.RendererOptions;
import pixi.core.display.DisplayObject;
import pixi.math.shapes.Rectangle;
import pixi.core.textures.RenderTexture;
import pixi.core.renderers.webgl.utils.RenderTarget;
import pixi.utils.EventEmitter;
import pixi.math.Matrix;

typedef AbstractRendererOptions = {
	/**
	 * The width of the renderers view.
	 * 
	 * @default 800
	 */
	@:optional var width:Int;

	/**
	 * The height of the renderers view. 
	 * 
	 * @default 600
	 */
	@:optional var height:Int;

	/**
	 * The canvas to use as a view, optional.
	 * 
	 * @default undefined
	 */
	@:optional var view:CanvasElement;

	/**
	 * Pass-through value for canvas' context alpha property. If you want to set transparency, 
	 * please use backgroundAlpha. This option is for cases where the canvas needs to be opaque, 
	 * possibly for performance reasons on some older devices.
	 * 
	 * @default false
	 */
	 @:optional var useContextAlpha:Bool;

	/**
 	 * Resizes renderer view in CSS pixels to allow for resolutions other than 1.
	 * 
	 * @default false
 	 */
	@:optional var autoDensity:Bool;

	/**
	 * Sets antialias. If not available natively then FXAA antialiasing is used.
	 * 
	 * @default false
	 */
	@:optional var antialias:Bool;
	
	/**
	 * The resolution / device pixel ratio of the renderer.
	 * 
	 * @default PIXI.settings.RESOLUTION
	 */
	@:optional var resolution:Float;
	
	/**
	 * Enables drawing buffer preservation, enable this if you need to call toDataUrl on the WebGL context.
	 * 
	 * @default false
	 */
	@:optional var preserveDrawingBuffer:Bool;

	/**
	 * This sets if the renderer will clear the canvas or not before the new render pass. 
	 * If you wish to set this to false, you must set preserveDrawingBuffer to true.
	 * 
	 * @default true
	 */
	@:optional var clearBeforeRender:Bool;

	/**
	 * The background color of the rendered area (shown if not transparent).
	 * 
	 * @default 0x000000
	 */
	@:optional var backgroundColor:Int;

	/**
	 * Value from 0 (fully transparent) to 1 (fully opaque).
	 * 
	 * @default 1
	 */
	@:optional var backgroundAlpha:Float;

	/**
	 * Parameter passed to WebGL context, set to "high-performance" for devices with dual graphics card.
	 * 
	 * @default undefined
	 */
	@:optional var powerPreference:String;
}

@:native("PIXI.AbstractRenderer")
extern class AbstractRenderer extends EventEmitter {
	/**
	 * The AbstractRenderer is the base for a PixiJS Renderer. It is extended by the PIXI.CanvasRenderer and PIXI.Renderer which can be used for rendering a PixiJS scene.
	 * @param	system The name of the system this renderer is for.
	 * @param	options The optional renderer parameters.
	 */
	public function new(system:String, ?options:RendererOptions);

	/**
	 * Whether CSS dimensions of canvas view should be resized to screen dimensions automatically.
	 */
	var autoDensity:Bool;

	/**
	 * The background color alpha. Setting this to 0 will make the canvas transparent.
	 */
	var backgroundAlpha:Float;

	/**
	 * The background color to fill if not transparent
	 */
	var backgroundColor:Int;

	/**
	 * This sets if the CanvasRenderer will clear the canvas or not before the new render pass.
	 * If the scene is NOT transparent PixiJS will use a canvas sized fillRect operation every
	 * frame to set the canvas background color. If the scene is transparent PixiJS will use
	 * clearRect to clear the canvas every frame. Disable this by setting this to false. For
	 * example, if your game has a canvas filling background image you often don't need this set.
	 */
	var clearBeforeRender:Bool;

	/**
	 * Same as view.height, actual number of pixels in the canvas by vertical.
	 */
	var height(default, null):Float;

	/**
	 * The supplied constructor options.
	 */
	var options(default, null):AbstractRendererOptions;

	/**
	 * Collection of plugins.
	 */
	var plugins(default, null):Dynamic;

	/**
	 * The value of the preserveDrawingBuffer flag affects whether or not the contents of the stencil buffer is retained after rendering.
	 */
	var preserveDrawingBuffer:Bool;

	/**
	 * The resolution / device pixel ratio of the renderer.
	 */
	var resolution:Float;

	/**
	 * Measurements of the screen. (0, 0, screenWidth, screenHeight).
	 * Its safe to use as filterArea or hitArea for the whole stage.
	 */
	var screen:Rectangle;

	/**
	 * The type of the renderer.
	 */
	var type:RendererType;

	/**
	 * Pass-thru setting for the the canvas' context alpha property. This is typically 
	 * not something you need to fiddle with. If you want transparency, use backgroundAlpha.
	 */
	var useContextAlpha:Bool;

	/**
	 * The canvas element that everything is drawn to.
	 */
	var view:CanvasElement;

	/**
	 * Same as view.width, actual number of pixels in the canvas by horizontal.
	 */
	var width(default, null):Float;

	/**
	 * The background color as a number.
	 */
	private var _backgroundColor:Int;

	 /**
	  * The background color as an [R, G, B, A] array.
	  */
	private var _backgroundColorRgba:Array<Int>;
 
	 /**
	  * The background color as a string.
	  */
	private var _backgroundColorString:String;
 
	 /**
	  * The last root object that the renderer tried to render.
	  */
	private var _lastObjectRendered:DisplayObject;
 
	/**
	 * Removes everything from the renderer and optionally removes the Canvas DOM element.
	 * @param	removeView Removes the Canvas element from the DOM.
	 */
	function destroy(?removeView:Bool = false):Void;

	/**
	 * Useful function that returns a texture of the display object that can then be used to create sprites This can be quite useful if your displayObject is complicated and needs to be reused multiple times.
	 * @param	displayObject The displayObject the object will be generated from.
	 * @param	scaleMode Should be one of the scaleMode consts.
	 * @param	resolution The resolution / device pixel ratio of the texture being generated.
	 * @param	region The region of the displayObject, that shall be rendered, if no region is specified, defaults to the local bounds of the displayObject.
	 * @return A texture of the graphics object.
	 */
	function generateTexture(displayObject:DisplayObject, scaleMode:ScaleModes, resolution:Float, ?region:Rectangle):RenderTexture;

	/**
	 * Initialize the plugins.
	 * @param	staticMap The dictionary of statically saved plugins.
	 */
	private function initPlugins(staticMap:Dynamic):Void;

	/**
	 * Resizes the screen and canvas to the specified width and height. Canvas dimensions are multiplied by resolution.
	 * @param	screenWidth The new width of the screen.
	 * @param	screenHeight The new height of the screen.
	 */
	function resize(screenWidth:Float, screenHeight:Float):Void;

	/**
	 * Renders the object to its WebGL or Canvas view
	 * @param	displayObject The object to be rendered.
	 * @param	renderTexture The render texture to render to.
	 * @param	clear Should the canvas be cleared before the new render.
	 * @param	transform A transform to apply to the render texture before rendering.
	 * @param	skipUpdateTransform Should we skip the update transform pass?
	 */
	function render(displayObject:DisplayObject, ?renderTexture:RenderTarget, ?clear:Bool = true, ?transform:Matrix, skipUpdateTransform:Bool = false):Void;
}

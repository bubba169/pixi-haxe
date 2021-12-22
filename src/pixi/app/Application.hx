package pixi.app;

import pixi.core.Renderer.RendererOptions;
import haxe.extern.EitherType;
import js.html.HtmlElement;
import js.html.Window;
import pixi.core.math.shapes.Rectangle;
import js.html.CanvasElement;
import pixi.core.AbstractRenderer;
import pixi.core.ticker.Ticker;
import pixi.core.display.Container;
import pixi.loaders.Loader;

typedef ApplicationOptions = {
	> RendererOptions,

	/**
	 * Automatically starts the rendering after the construction. 
	 * 
	 * Note: Setting this parameter to false does NOT stop the shared ticker even if you set options.sharedTicker 
	 * to true in case that it is already started. Stop it by your own.
	 * 
	 * @default true
	 */
	@:optional var autoStart:Bool;

	/**
	 * true to use PIXI.Ticker.shared, false to create new ticker. If set to false, you cannot register a 
	 * handler to occur before anything that runs on the shared ticker. The system ticker will always run 
	 * before both the shared ticker and the app ticker.
	 * 
	 * @default false
	 */
	@:optional var sharedTicker:Bool;

	/**
	 * true to use PIXI.Loader.shared, false to create new Loader.
	 * 
	 * @default false
	 */
	@:optional var sharedLoader:Bool;

	/**
	 * Element to automatically resize stage to.
	 * 
	 * @default undefined
	 */
	@:optional var resizeTo:EitherType<HtmlElement, Window>;
}

typedef StageDestroyOptions = {
    /**
     * If set to true, all the children will have their destroy method called as well. 'stageOptions' will be passed on to those calls.
     * 
     * @default false
     */
    @:optional var children : Bool;

    /**
     * Only used for child Sprites if stageOptions.children is set to true. Should it destroy the texture of the child sprite.
     * 
     * @default false
     */
    @:optional var texture : Bool;

    /**
     * Only used for child Sprites if stageOptions.children is set to true. Should it destroy the base texture of the child sprite
     * 
     * @default false
     */
    @:optional var baseTexture : Bool;
}

@:native("PIXI.Application")
extern class Application {
	/**
	 * Loader instance to help with asset loading.
	 */
	var loader(default, null):Loader;

	/**
	 * WebGL renderer if available, otherwise CanvasRenderer.
	 */
	var renderer:AbstractRenderer;

	/**
	 * The HTML element or window to automatically resize the renderer's view element to match width and height.
	 */
	var resizeTo:EitherType<HtmlElement, Window>;

	/**
	 * Reference to the renderer's screen rectangle. Its safe to use as filterArea or hitArea for the whole screen.
	 */
	 var screen(default, null):Rectangle;

	/**
	 * The root display container that's rendered.
	 */
	var stage:Container;

	/**
	 * Ticker for doing render updates.
	 * 
	 * @default PIXI.Ticker.shared
	 */
	var ticker:Ticker;

	/**
	 * Reference to the renderer's canvas element.
	 */
	var view(default, null):CanvasElement;

	/**
	 * Convenience class to create a new PIXI application.
	 * This class automatically creates the renderer, ticker
	 * and root container.
	 * 
	 * @param options The optional renderer parameters
	 */
	function new(?options:ApplicationOptions);

	static function registerPlugin(plugin:IApplicationPlugin):Void;

	/**
	 * Destroy and don't use after this.
	 * 
	 * @param removeView Automatically remove canvas from DOM.
	 * @param stageOptions Options parameter. A boolean will act as if all options have been set to that value
	 */
	function destroy(removeView:Bool = false, ?stageOptions:EitherType<StageDestroyOptions,Bool>):Void;

	/**
	 * Render the current stage.
	 */
	function render():Void;

	/**
	 * Execute an immediate resize on the renderer, this is not throttled and can be expensive to call many 
	 * times in a row. Will resize only if resizeTo property is set.
	 */
	function resize():Void;

	/**
	 * Convenience method for stopping the render.
	 */
	function stop():Void;

	/**
	 * Convenience method for starting the render.
	 */
	function start():Void;
}

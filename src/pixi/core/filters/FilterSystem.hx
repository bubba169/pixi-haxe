package pixi.core.renderers.systems;

import pixi.display.DisplayObject;
import pixi.math.Matrix;
import pixi.math.shapes.Rectangle;
import pixi.core.Renderer;
import pixi.renderers.webgl.UniformGroup;
import pixi.core.filters.Filter;
import pixi.core.sprites.Sprite;
import pixi.core.textures.RenderTexture;
import pixi.core.renderers.systems.System;

@:native("PIXI.FilterSystem")
extern class FilterSystem implements ISystem {
	/**
	 * List of filters for the FilterSystem
	 */
	var defaultFilterStack(default, null):Array<Dynamic>;
	
	/**
	 * Whether to clear output renderTexture in AUTO/BLIT mode. See PIXI.CLEAR_MODES.
	 */
	var forceClear:Bool;

	/**
	 * a pool for storing filter states, save us creating new ones each tick
	 */
	var statePool:Array<FilterState>;

	/**
	 * stores a bunch of PO2 textures used for filtering
	 */
	var texturePool:RenderTexturePool;

	/**
	 * A very simple geometry used when drawing a filter effect to the screen
	 */
	var quad:Quad;

	/**
	 * Quad UVs
	 */
	var quadUvs:QuadUv;

	/**
	 * Temporary rect for maths
	 */
	var tempRect:Rectangle;

	

	/**
	 * Active state
	 */
	private var activeState:Dynamic;

	/**
	 * This uniform group is attached to filter uniforms when used
	 */
	private var globalUniforms:UniformGroup;

	/**
	 * System plugin to the renderer to manage the filters.
	 *
	 * @param renderer The renderer this manager works for
	 */
	function new(renderer:Renderer);

	/**
	 * Draws a filter.
	 * @param	filter The filter to draw.
	 * @param	input The input render target.
	 * @param	output The target to output to.
	 * @param	clear Should the output be cleared before rendering to it
	 */
	function applyFilter(filter:Filter, input:RenderTexture, output:RenderTexture, clear:Bool):Void;

	/**
	 * Multiply input normalized coordinates to this matrix to get sprite texture normalized coordinates.
	 * @param	outputMatrix The matrix to output to.
	 * @param	sprite The sprite to map to.
	 * @return The mapped matrix.
	 */
	function calculateSpriteMatrix(outputMatrix:Matrix, sprite:Sprite):Matrix;

	/**
	 * Empties the texture pool.
	 */
	function emptyPool():Void;

	/**
	 * Gets extra render texture to use inside current filter To be compliant with older filters, you can use params in any order
	 * @param	input renderTexture from which size and resolution will be copied
	 * @param	resolution override resolution of the renderTexture
	 * @return
	 */
	function getFilterTexture(?input:RenderTexture, ?resolution:Float):RenderTexture;

	/**
	 * Gets a Power-of-Two render texture or fullScreen texture
	 * @param	minWidth The minimum width of the render texture in real pixels.
	 * @param	minHeight The minimum height of the render texture in real pixels.
	 * @param	resolution The resolution of the render texture.
	 * @return The new render texture.
	 */
	function getOptimalFilterTexture(minWidth:Float, minHeight:Float, ?resolution:Float):RenderTexture;

	/**
	 * Pops off the filter and applies it.
	 */
	function pop():Void;

	/**
	 * Adds a new filter to the System.
	 * @param	target The target of the filter to render.
	 * @param	filters The filters to apply.
	 */
	function push(targets:DisplayObject, filters:Array<Filter>):Void;

	/**
	 * calls texturePool.resize(), affects fullScreen renderTextures
	 */
	function resize():Void;

	/**
	 * Frees a render texture back into the pool.
	 * @param	renderTexture The renderTarget to free
	 */
	function returnFilterTexture(renderTexture:RenderTexture):Void;
}

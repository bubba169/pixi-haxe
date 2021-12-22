package pixi.core.renderers.webgl.filters;

import pixi.Pixi.MSAAQuality;
import pixi.Pixi.BlendModes;
import haxe.DynamicAccess;
import pixi.core.shader.Shader;

@:native("PIXI.Filter")
extern class Filter extends Shader {
	/**
	 * The default fragment shader source
	 */
	 static var defaultFragmentSrc:String;

	/**
	 * The default vertex shader source
	 */
	static var defaultVertexSrc:String;

	/**
	 * Used for caching shader IDs.
	 */
	static var SOURCE_KEY_MAP:DynamicAccess<String>;

	/**
	 * If enabled, PixiJS will fit the filter area into boundaries for better performance. 
	 * Switch it off if it does not work for specific shader.
	 */
	var autoFit:Bool = true;

	/**
	 * Sets the blend mode of the filter. Default is Normal.
	 */
	var blendMode:BlendModes;

	/**
	 * If enabled is true the filter is applied, if false it will not.
	 */
	var enabled:Bool;

	/**
	 * Legacy filters use position and uvs from attributes (set by filter system)
	 */
	var legacy(default, null):Bool;

	/**
	 * The samples of the filter.
	 */
	var multisample:MSAAQuality;

	/**
	 * The padding of the filter. Some filters require extra space to breath such as a blur. 
	 * Increasing this will add extra width and height to the bounds of the object that the filter is applied to.
	 */
	var padding:Float;

	/**
	 * The resolution of the filter. Setting this to be lower will lower the quality but increase the performance of the filter.
	 */
	var resolution:Float;

	/**
	 * The WebGL state the filter requires to render.
	 */
	var state:State;


	/**
	 * A filter is a special shader that applies post-processing effects to an input texture and writes into an output render-target.
	 * 
	 * @param vertexSrc The source of the vertex shader.
	 * @param fragmentSrc The source of the fragment shader.
	 * @param uniforms Custom uniforms to use to augment the built-in ones.
	 */
	function new(?vertexSrc:String, ?fragmentSrc:String, ?uniforms:DynamicAccess<Any>);

	/*
	 * Applies the filter
	 * @param filterManager {FilterSystem}
	 * @param input {RenderTexture}
	 * @param output {RenderTexture}
	 * @param clear {Bool} Whether or not we want to clear the outputTarget
	 * @param {object} [currentState] - It's current state of filter.
	 *        There are some useful properties in the currentState :
	 *        target, filters, sourceFrame, destinationFrame, renderTarget, resolution
	 */
	function apply(filterManager:FilterSystem, input:RenderTexture, output:RenderTexture, ?clear:Bool, ?currentState:FilterState):Void;
}


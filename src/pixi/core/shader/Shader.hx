package pixi.core.shader;

import haxe.DynamicAccess;

@:native("PIXI.Shader")
extern class Shader {
	/**
	 * Program that the shader uses.
	 */
	var program : Program;

	/**
	 * Program that the shader uses.
	 */
	var uniforms(default, null) : DynamicAccess<Any>;

	/**
	 * A helper class for shaders.
	 * 
	 * @param vertexSrc The source of the vertex shader.
	 * @param fragmentSrc The source of the fragment shader.
	 * @param uniforms Custom uniforms to use to augment the built-in ones.
	 * @return A shiny new PixiJS shader!
	 */
	static function from(?vertexSrc:String, ?fragmentSrc:String, ?uniforms:DynamicAccess<Any>):Shader;

	/**
	 * A helper class for shaders.
	 * 
	 * @param program The program the shader will use.
	 * @param uniforms Custom uniforms to use to augment the built-in ones.
	 */
	 function new(program: Program, ?uniforms:DynamicAccess<Any>);
}

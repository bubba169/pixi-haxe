package pixi.core.shader;

import haxe.DynamicAccess;
import js.lib.Object;
import haxe.ds.StringMap;
import haxe.extern.EitherType;
import js.lib.Float32Array;

typedef AttributeData = {
	type: String,
	size: Float,
	location: Float,
	name: String
};

typedef UniformData = {
	index: Int,
	type: String,
	size: Float,
	isArray: Bool,
	value: Any,
	name: String
};

@:native("PIXI.Program")
extern class Program {
	/**
	 * The default fragment shader source.
	 */
	static var defaultFragmentSrc:String;

	/**
	 * The default vertex shader source.
	 */
	static var defaultVertexSrc:String;

	/**
	 * Assigned when a program is first bound to the shader system.
	 */
	var attributeData:DynamicAccess<AttributeData>;

	/**
	 * Source code for the fragment shader.
	 */
	var fragmentSrc:String;

	/**
	 * Assigned when a program is first bound to the shader system.
	 */
	var uniformData:DynamicAccess<UniformData>;

	/**
	 * Source code for the vertex shader.
	 */
	var vertexSrc:String;

	/**
	 * A short hand function to create a program based of a vertex and fragment shader this method will also check to see if there is a cached program.
	 * @param vertexSrc The source of the vertex shader.
	 * @param fragmentSrc The source of the fragment shader.
	 * @param name Name for shader.
	 * @return A shiny new Pixi shader program!
	 */
	static function from(?vertexSrc:String, ?fragmentSrc:String, ?name:String):Program;

	/**
	 * Helper class to create a shader program.
	 * 
	 * @param vertextSrc The source of the vertex shader.
	 * @param fragmentSrc The source of the fragment shader.
	 * @param name Name for shader
	 */
	 function new(?vertextSrc:String, ?fragmentSrc:String, name:String = 'pixi-shader');
}

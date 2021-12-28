package pixi.core.renderTexture;

import pixi.Pixi.ScaleModes;
import pixi.core.textures.BaseTexture.BaseTextureOptions;

typedef TextureOptions = {
    > BaseTextureOptions,
    ?scaleMode:ScaleModes,
}

@:native('PIXI,RenderTexturePool')
extern class RenderTexturePool
{
    /**
     * Key that is used to store fullscreen renderTextures in a pool
     */
    static var SCREEN_KEY:Int;

    /**
     * Texture pool, used by FilterSystem and plugins.
     * 
     * Stores collection of temporary pow2 or screen-sized renderTextures
     * 
     * If you use custom RenderTexturePool for your filters, you can use methods 
     * getFilterTexture and returnFilterTexture
     * 
     * @param textureOptions options that will be passed to BaseRenderTexture constructor
     */
    function new(?textureOptions:TextureOptions);
}
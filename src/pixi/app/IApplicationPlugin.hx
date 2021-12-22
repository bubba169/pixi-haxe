package pixi.app;

import pixi.app.Application.ApplicationOptions;

@:native('PIXI.IApplicationPlugin')
extern interface IApplicationPlugin {
    /**
     * Called when destroying Application, scoped to Application instance.
     */
    function destroy():Void;

    /**
     * Called when Application is constructed, scoped to Application instance. 
     * 
     * @param options Passes in options as the only argument, which are Application constructor options.
     */
    function init(options:ApplicationOptions):Void;
}
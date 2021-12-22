package pixi.core;

@:native('PIXI.ISystem')
extern interface ISystem {
    /**
     * Generic destroy methods to be overridden by the subclass
     */
    function destroy():Void;
}
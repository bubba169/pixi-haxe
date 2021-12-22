package pixi.math;

@:native('PIXI.IPoint')
extern interface IPoint extends IPointData {
    /**
     * Copies x and y from the given point
     * @param p The point to copy from
     * @return Returns itself
     */
    function copyFrom(p:IPointData):IPoint;

    /**
     * Copies x and y into the given point
     * @param p The point to copy.
     * @return Given point with values updated
     */
    function copyTo(p:IPointData):IPointData;

    /**
     * Returns true if the given point is equal to this point
     * @param p The point to check
     * @return Whether the given point equal to this point
     */
    function equals(p:IPointData):Bool;

    /**
     * Sets the point to a new x and y position. If y is omitted, both x and y will be set to x.
     * @param x position of the point on the x axis
     * @param y position of the point on the y axis
     */
    function set(x:Float = 0, ?y:Float):Void;
}
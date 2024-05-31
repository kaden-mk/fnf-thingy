package funkin;

import funkin.save.Save;

class CustomizeUi
{
    /**
   * cust
   * @default `true`
   */
   public static var cust(get, set):Bool;

   static function get_cust():Bool
   {
     return Save?.instance?.options?.cust;
   }
 
   static function set_cust(value:Bool):Bool
   {
     var save:Save = Save.instance;
     save.options.cust = value;
     save.flush();
     return value;
   }

  /**
   * Loads the user's preferences from the save data and apply them.
   */
  public static function init():Void
  {
    // what the fuck do i do here
  }
}

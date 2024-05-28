package funkin;

import funkin.save.Save;

/**
 * Copy of Preferences, just used for the DisableUiMenu instead.
 * Not sure why I did this
 */
class DisableUi
{
  /**
   * Disables the health bar
   * @default `true`
   */
  public static var healthbar(get, set):Bool;

  static function get_healthbar():Bool
  {
    return Save?.instance?.options?.healthbar;
  }

  static function set_healthbar(value:Bool):Bool
  {
    var save:Save = Save.instance;
    save.options.healthbar = value;
    save.flush();
    return value;
  }

  /**
   * Disables the icons on the health bar
   * @default `true`
   */
  public static var icons(get, set):Bool;

  static function get_icons():Bool
  {
    return Save?.instance?.options?.icons;
  }

  static function set_icons(value:Bool):Bool
  {
    var save:Save = Save.instance;
    save.options.icons = value;
    save.flush();
    return value;
  }

  /**
   * Disables the score under the health bar
   * @default `true`
   */
  public static var score(get, set):Bool;

  static function get_score():Bool
  {
    return Save?.instance?.options?.score;
  }

  static function set_score(value:Bool):Bool
  {
    var save:Save = Save.instance;
    save.options.score = value;
    save.flush();
    return value;
  }

  /**
   * Disables the combo number (like the number when u get a combo n shit and it tells you that YOU KNOW WHAT I FUCKING MEAN)
   * @default `true`
   */
  public static var comboNumber(get, set):Bool;

  static function get_comboNumber():Bool
  {
    return Save?.instance?.options?.comboNumber;
  }

  static function set_comboNumber(value:Bool):Bool
  {
    var save:Save = Save.instance;
    save.options.comboNumber = value;
    save.flush();
    return value;
  }

  /**
   * Disables the rating from hitting a note
   * @default `true`
   */
  public static var rating(get, set):Bool;

  static function get_rating():Bool
  {
    return Save?.instance?.options?.rating;
  }

  static function set_rating(value:Bool):Bool
  {
    var save:Save = Save.instance;
    save.options.rating = value;
    save.flush();
    return value;
  }

  /**
   * Disables the notes from the opponent
   * @default `true`
   */
  public static var oppNotes(get, set):Bool;

  static function get_oppNotes():Bool
  {
    return Save?.instance?.options?.oppNotes;
  }

  static function set_oppNotes(value:Bool):Bool
  {
    var save:Save = Save.instance;
    save.options.oppNotes = value;
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

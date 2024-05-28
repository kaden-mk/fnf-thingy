package funkin.ui.options;

import flixel.FlxCamera;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.group.FlxSpriteGroup.FlxTypedSpriteGroup;
import funkin.ui.AtlasText.AtlasFont;
import funkin.ui.options.OptionsState.Page;
import funkin.graphics.FunkinCamera;
import funkin.ui.TextMenuList.TextMenuItem;
import funkin.ui.options.PreferencesMenu.CheckboxPreferenceItem;

/**
 * Since this is an entirely new Menu I'll explain what it does, it's basically like preferences but you can disable elements of ui.
 * Examples are like, the icons on the healthbar, the healthbar itself, score text, etc.
 */
class DisableUiMenu extends Page
{
  var items:TextMenuList;
  var uiItems:FlxTypedSpriteGroup<FlxSprite>;

  var menuCamera:FlxCamera;
  var camFollow:FlxObject;

  public function new()
  {
    super();

    menuCamera = new FunkinCamera('prefMenu');
    FlxG.cameras.add(menuCamera, false);
    menuCamera.bgColor = 0x0;
    camera = menuCamera;

    add(items = new TextMenuList());
    add(uiItems = new FlxTypedSpriteGroup<FlxSprite>());

    createUiItems();

    camFollow = new FlxObject(FlxG.width / 2, 0, 140, 70);
    if (items != null) camFollow.y = items.selectedItem.y;

    menuCamera.follow(camFollow, null, 0.06);
    var margin = 160;
    menuCamera.deadzone.set(0, margin, menuCamera.width, 40);
    menuCamera.minScrollY = 0;

    items.onChange.add(function(selected) {
      camFollow.y = selected.y;
    });
  }

  /**
   * This is for creating each button in the menu. (no shit sherlock)
   */
  function createUiItems():Void
  {
    createUiItemCheckbox('Health bar', 'Toggle the health bar.', function(value:Bool):Void {
      DisableUi.healthbar = value;
    }, DisableUi.healthbar);

    createUiItemCheckbox('Icons', 'Toggle the Icons on the health bar.', function(value:Bool):Void {
      DisableUi.icons = value;
    }, DisableUi.icons);

    createUiItemCheckbox('Score Info', 'Toggle the score information under the health bar.', function(value:Bool):Void {
      DisableUi.score = value;
    }, DisableUi.score);

    createUiItemCheckbox('Combo Number', 'Toggle the combo number.', function(value:Bool):Void {
      DisableUi.comboNumber = value;
    }, DisableUi.comboNumber);

    createUiItemCheckbox('Rating', 'Toggle the rating from hitting a note.', function(value:Bool):Void {
      DisableUi.rating = value;
    }, DisableUi.rating);

    createUiItemCheckbox('Opponent Notes', 'Toggle the opponent notes.', function(value:Bool):Void {
      DisableUi.oppNotes = value;
    }, DisableUi.oppNotes);
  }

  function createUiItemCheckbox(prefName:String, prefDesc:String, onChange:Bool->Void, defaultValue:Bool):Void
  {
    var checkbox:CheckboxPreferenceItem = new CheckboxPreferenceItem(0, 120 * (items.length - 1 + 1), defaultValue);

    items.createItem(120, (120 * items.length) + 30, prefName, AtlasFont.BOLD, function() {
      var value = !checkbox.currentValue;
      onChange(value);
      checkbox.currentValue = value;
    });

    uiItems.add(checkbox);
  }

  override function update(elapsed:Float)
  {
    super.update(elapsed);

    // Indent the selected item.
    // TODO: Only do this on menu change?
    items.forEach(function(daItem:TextMenuItem) {
      if (items.selectedItem == daItem) daItem.x = 150;
      else
        daItem.x = 120;
    });
  }
}

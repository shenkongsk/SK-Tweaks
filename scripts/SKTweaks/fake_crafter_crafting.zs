#loader crafttweaker reloadable
#priority 1
import mods.modularmachinery.Sync;
import mods.modularmachinery.MMEvents;
import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.MachineController;
import mods.modularmachinery.IMachineController;
import mods.modularmachinery.RecipeCheckEvent;
import mods.modularmachinery.IngredientArrayBuilder;
import mods.modularmachinery.ControllerGUIRenderEvent;

import crafttweaker.data.IData;
import crafttweaker.item.IItemStack;

/*
    脚本来源于新星工程DLC：NPE
    作者：梦瑞云/Evelia_Fate
*/

for item in loadedMods["modularmachinery"].items{
    val id = item.definition.id;
    if(id.endsWith("_controller")){
        <ore:SK_controller>.add(item);
    }
}
// 暂时用一下神话装配室
RecipeBuilder.newBuilder("transcriber", "me_mythic_assembler", 5)
    .addInput(<ore:SK_controller>).setChance(0)
    .setNBTChecker(function(ctrl as IMachineController, item as IItemStack) {
        var displayname = item.displayName;
        if (displayname.endsWith("集成控制器")) {
            displayname = displayname.replace("集成控制器", "套装");
        } else if (displayname.endsWith("控制器")) {
            displayname = displayname.replace("控制器", "套装");
        } else if (displayname.endsWith("终端")) {
            displayname = displayname + "套装";
        }
        var currentData = ctrl.customData;
        if (isNull(currentData)) {
            currentData = {} as IData;
        }
        val newEntry = {displayname: displayname} as IData;
        val newData = currentData + newEntry;
        ctrl.customData = newData;
        return true;
    })
    .addInput(<minecraft:paper>)
    .addOutput(<minecraft:paper>)
    .addItemModifier(function(ctrl as IMachineController, oldItem as IItemStack) as IItemStack {
        val data = ctrl.customData;
        if (isNull(data)) return <minecraft:paper>;
        val map = data.asMap();
        val nameIData = map["displayname"];
        if (isNull(nameIData)) return <minecraft:paper>;
        var displayname = nameIData.asString();
        if (displayname.startsWith("\"") && displayname.endsWith("\"")) {
            displayname = displayname.substring(1, displayname.length - 1);
        }
        return <minecraft:paper>.withTag({display: {Name: displayname}});
    })
    .addRecipeTooltip("输入xxx控制器/集成控制器和纸,","输出名字为xxx套装的纸","控制器不会被消耗","几乎支持所有模块化机器的控制器")
    .build();
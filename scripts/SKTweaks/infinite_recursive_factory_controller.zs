#loader crafttweaker reloadable
import mods.modularmachinery.RecipeBuilder;
val Eternal_Glory = <minecraft:written_book>.withTag({author: "Sainagh", pages: ["{\"text\":\"恭喜！你成功了！\\n这一切值得吗？这由你来决定……\\n毫无疑问，这必定是段疯狂的旅程，期间有胜有负。那么，让我们以胜利收场吧！\\n \"}", "{\"text\":\"能看到这段话，意味着你已在宇宙众神殿中赢得了永恒荣耀！\\n你留下的印记，你对这个宇宙的贡献，将永世长存！\"}", "{\"text\":\"若你愿意，在完成相应任务后，你将以工具提示信息的形式被铭刻在某件特殊结局物品上，获得不朽纪念。\\n \"}", "{\"text\":\"请注意此操作仅限一次，一旦有了自己的提示信息，将无法再次申请。\\n \"}", "{\"text\":\"在获得你选择的结局物品后，请通过Discord向我发送完成证明（建议附上基地截图）。主菜单有链接！\"}", "{\"text\":\"以下是永恒荣耀物品清单！\\n-寰宇平衡\\n-寰宇支配之剑\\n-星辉真解\\n-黑暗之门生鱼片\\n-洁净肉桂苹果\\n-黑洞汁\\n-塔迪斯珊瑚\"}"], resolved: 1 as byte, title: "永恒荣耀"});
scripts.SKTweaks.lib.aaa_function.Recipe_Builder_SK_Chance(
    "infinite_recursive_factory_controller_make",
    "creation_altar",
    // inputs
    [
        Eternal_Glory*7,
        <contenttweaker:recursion_of_notbeinganoob>*1,
        <contenttweaker:recursion_of_worthiness>*1,
        <contenttweaker:ingot_of_infinite_wishes>*64,
        <contenttweaker:plate_clump_fractal>*32,
        <contenttweaker:infinite_processor>*16,
        <contenttweaker:cosmic_string_conduit>*8,
        <projectex:final_star_shard>*2048,
        <contenttweaker:galactic_power_unit>*1
    ],
    [0.0],
    // fluid inputs
    [
        <liquid:whisper_of_starvald_demelain>*1000,
        <liquid:galactic_plasma>*1000000
    ],
    [],
    // outputs
    [<modularmachinery:infinite_recursive_factory_factory_controller>],
    [],
    // fluid outputs
    [],
    [],
    // time, energy input, energy output
    40000, //
    40960000,
    0
);

import mods.modularmachinery.MachineModifier;

MachineModifier.setMachinePrefix("advanced_liquid_conversion_machine", "§6§kp§dNE§6§kp§r");
MachineModifier.setMachinePrefix("dream_energy_core", "§6§kp§dNE§6§kp§r");
val MachineName = [
    "meatballium_crucible",
    "magic_vat",
    "infernal_multi_furnace",
    "large_scale_chicken_farm",
    "alfheim_portal",
    "auto_altar",
    "auto_thaumatorium",
    "blood_abyss_altar",
    "small_blood_abyss_altar",
    "carpet_duplicator_1000",
    "catalyzation_multi_chamber",
    "definer_three_sk",
    "dimension_drill",
    "draconic_mythical_infusion",
    "small_draconic_mythical_infusion",
    "fluix_reactor",
    "infinite_recursive_factory",
    "large_scale_essentia_crystallizer",
    "large_scale_hypergrowth_insolator",
    "machine_daisy",
    "machine_mana_pool",
    "deep_void_excavator",
    "mythic_processor_crystallizer",
    "mythic_processor_fluid_enricher",
    "mythical_generator_first_order",
    "mythical_generator_second_order",
    "quantum_catalytic_reactor_array",
    "solar_array"
];
for item in MachineName {
    MachineModifier.setMachinePrefix(item, "§6§kp§eSKT§6§kp§r");
}


OUTPUT_FORMAT("elf64-x86-64")
OUTPUT_ARCH(i386:x86-64)
ENTRY(phys_startup_64)
jiffies = jiffies_64;
PHDRS {
 text PT_LOAD FLAGS(5);
 data PT_LOAD FLAGS(6);
 percpu PT_LOAD FLAGS(6);
 init PT_LOAD FLAGS(7);
 note PT_NOTE FLAGS(0);
}
SECTIONS
{
 . = (0xffffffff80000000 + ALIGN(0x1000000, 0x200000));
 phys_startup_64 = ABSOLUTE(startup_64 - 0xffffffff80000000);
 .text : AT(ADDR(.text) - 0xffffffff80000000) {
  _text = .;
  _stext = .;
  KEEP(*(.head.text))
  . = ALIGN(16); *(.text.hot .text.hot.*) *(.text .text.fixup) *(.text.unlikely .text.unlikely.*) *(.text.unknown .text.unknown.*) . = ALIGN(16); __noinstr_text_start = .; *(.noinstr.text) __cpuidle_text_start = .; *(.cpuidle.text) __cpuidle_text_end = .; __noinstr_text_end = .; *(.ref.text) *(.text.asan.* .text.tsan.*)
  . = ALIGN(16); __sched_text_start = .; *(.sched.text) __sched_text_end = .;
  . = ALIGN(16); __lock_text_start = .; *(.spinlock.text) __lock_text_end = .;
  . = ALIGN(16); __kprobes_text_start = .; *(.kprobes.text) __kprobes_text_end = .;
  . = ALIGN(16); __softirqentry_text_start = .; *(.softirqentry.text) __softirqentry_text_end = .;
  *(.text..__x86.indirect_thunk)
  *(.text..__x86.return_thunk)
  . = ALIGN(16); __static_call_text_start = .; *(.static_call.text) __static_call_text_end = .;
  . = ALIGN((1 << 21));
  *(.text..__x86.rethunk_untrain)
  . = ALIGN(16); __entry_text_start = .; *(.entry.text) __entry_text_end = .;
  . = ALIGN((1 << 21));
  *(.gnu.warning)
 } :text = 0xcccccccc
 _etext = .;
 . = ALIGN((1 << 12));
 . = ALIGN((1 << 21));
 . = ALIGN(((1 << 12))); .rodata : AT(ADDR(.rodata) - 0xffffffff80000000) { __start_rodata = .; *(.rodata) *(.rodata.*) . = ALIGN(32); __sched_class_highest = .; *(__stop_sched_class) *(__dl_sched_class) *(__rt_sched_class) *(__fair_sched_class) *(__idle_sched_class) __sched_class_lowest = .; . = ALIGN(8); __start_ro_after_init = .; *(.data..ro_after_init) . = ALIGN(8); __start___jump_table = .; KEEP(*(__jump_table)) __stop___jump_table = .; . = ALIGN(8); __start_static_call_sites = .; KEEP(*(.static_call_sites)) __stop_static_call_sites = .; __start_static_call_tramp_key = .; KEEP(*(.static_call_tramp_key)) __stop_static_call_tramp_key = .; __end_ro_after_init = .; . = ALIGN(8); __start___tracepoints_ptrs = .; KEEP(*(__tracepoints_ptrs)) __stop___tracepoints_ptrs = .; *(__tracepoints_strings) } .rodata1 : AT(ADDR(.rodata1) - 0xffffffff80000000) { *(.rodata1) } .pci_fixup : AT(ADDR(.pci_fixup) - 0xffffffff80000000) { __start_pci_fixups_early = .; KEEP(*(.pci_fixup_early)) __end_pci_fixups_early = .; __start_pci_fixups_header = .; KEEP(*(.pci_fixup_header)) __end_pci_fixups_header = .; __start_pci_fixups_final = .; KEEP(*(.pci_fixup_final)) __end_pci_fixups_final = .; __start_pci_fixups_enable = .; KEEP(*(.pci_fixup_enable)) __end_pci_fixups_enable = .; __start_pci_fixups_resume = .; KEEP(*(.pci_fixup_resume)) __end_pci_fixups_resume = .; __start_pci_fixups_suspend = .; KEEP(*(.pci_fixup_suspend)) __end_pci_fixups_suspend = .; __start_pci_fixups_resume_early = .; KEEP(*(.pci_fixup_resume_early)) __end_pci_fixups_resume_early = .; __start_pci_fixups_suspend_late = .; KEEP(*(.pci_fixup_suspend_late)) __end_pci_fixups_suspend_late = .; } .builtin_fw : AT(ADDR(.builtin_fw) - 0xffffffff80000000) ALIGN(8) { __start_builtin_fw = .; KEEP(*(.builtin_fw)) __end_builtin_fw = .; } . = ALIGN(4); .tracedata : AT(ADDR(.tracedata) - 0xffffffff80000000) { __tracedata_start = .; KEEP(*(.tracedata)) __tracedata_end = .; } __ksymtab : AT(ADDR(__ksymtab) - 0xffffffff80000000) { __start___ksymtab = .; KEEP(*(SORT(___ksymtab+*))) __stop___ksymtab = .; } __ksymtab_gpl : AT(ADDR(__ksymtab_gpl) - 0xffffffff80000000) { __start___ksymtab_gpl = .; KEEP(*(SORT(___ksymtab_gpl+*))) __stop___ksymtab_gpl = .; } __kcrctab : AT(ADDR(__kcrctab) - 0xffffffff80000000) { __start___kcrctab = .; KEEP(*(SORT(___kcrctab+*))) __stop___kcrctab = .; } __kcrctab_gpl : AT(ADDR(__kcrctab_gpl) - 0xffffffff80000000) { __start___kcrctab_gpl = .; KEEP(*(SORT(___kcrctab_gpl+*))) __stop___kcrctab_gpl = .; } __ksymtab_strings : AT(ADDR(__ksymtab_strings) - 0xffffffff80000000) { *(__ksymtab_strings) } __init_rodata : AT(ADDR(__init_rodata) - 0xffffffff80000000) { *(.ref.rodata) } __param : AT(ADDR(__param) - 0xffffffff80000000) { __start___param = .; KEEP(*(__param)) __stop___param = .; } __modver : AT(ADDR(__modver) - 0xffffffff80000000) { __start___modver = .; KEEP(*(__modver)) __stop___modver = .; } . = ALIGN(16); __ex_table : AT(ADDR(__ex_table) - 0xffffffff80000000) { __start___ex_table = .; KEEP(*(__ex_table)) __stop___ex_table = .; } /DISCARD/ : { *(.note.GNU-stack) *(.note.gnu.property) } .notes : AT(ADDR(.notes) - 0xffffffff80000000) { __start_notes = .; KEEP(*(.note.*)) __stop_notes = .; } :text :note __restore_ph : { *(.__restore_ph) } :text . = ALIGN(((1 << 12))); __end_rodata = .;
 . = ALIGN((1 << 21)); __end_rodata_hpage_align = .; __end_rodata_aligned = .;
 .data : AT(ADDR(.data) - 0xffffffff80000000) {
  _sdata = .;
  . = ALIGN(((1 << 12) << (2 + 0))); __start_init_task = .; init_thread_union = .; init_stack = .; KEEP(*(.data..init_task)) KEEP(*(.data..init_thread_info)) . = __start_init_task + ((1 << 12) << (2 + 0)); __end_init_task = .;
  . = ALIGN((1 << 12)); *(.data..page_aligned) . = ALIGN((1 << 12));
  . = ALIGN((1 << (6))); *(.data..cacheline_aligned)
  *(.xiptext) *(.data) *(.data..decrypted) *(.ref.data) *(.data..shared_aligned) *(.data.unlikely) __start_once = .; *(.data.once) __end_once = .; . = ALIGN(32); *(__tracepoints) . = ALIGN(8); __start___dyndbg_classes = .; KEEP(*(__dyndbg_classes)) __stop___dyndbg_classes = .; __start___dyndbg = .; KEEP(*(__dyndbg)) __stop___dyndbg = .; __start___trace_bprintk_fmt = .; KEEP(*(__trace_printk_fmt)) __stop___trace_bprintk_fmt = .; __start___tracepoint_str = .; KEEP(*(__tracepoint_str)) __stop___tracepoint_str = .; . = ALIGN(8); __kunit_suites_start = .; KEEP(*(.kunit_test_suites)) __kunit_suites_end = .;
  CONSTRUCTORS
  . = ALIGN((1 << 6)); *(.data..read_mostly) . = ALIGN((1 << 6));
  _edata = .;
 } :data
 . = ALIGN(8); __bug_table : AT(ADDR(__bug_table) - 0xffffffff80000000) { __start___bug_table = .; KEEP(*(__bug_table)) __stop___bug_table = .; }
 .orc_header : AT(ADDR(.orc_header) - 0xffffffff80000000) { __start_orc_header = .; KEEP(*(.orc_header)) __stop_orc_header = .; } . = ALIGN(4); .orc_unwind_ip : AT(ADDR(.orc_unwind_ip) - 0xffffffff80000000) { __start_orc_unwind_ip = .; KEEP(*(.orc_unwind_ip)) __stop_orc_unwind_ip = .; } . = ALIGN(2); .orc_unwind : AT(ADDR(.orc_unwind) - 0xffffffff80000000) { __start_orc_unwind = .; KEEP(*(.orc_unwind)) __stop_orc_unwind = .; } text_size = _etext - _stext; . = ALIGN(4); .orc_lookup : AT(ADDR(.orc_lookup) - 0xffffffff80000000) { orc_lookup = .; . += (((text_size + (1 << 8) - 1) / (1 << 8)) + 1) * 4; orc_lookup_end = .; }
 . = ALIGN((1 << 12));
 __vvar_page = .;
 .vvar : AT(ADDR(.vvar) - 0xffffffff80000000) {
  __vvar_beginning_hack = .;
. = __vvar_beginning_hack + 128; *(.vvar__vdso_data)
 . = __vvar_beginning_hack + (1 << 12);
 } :data
 . = ALIGN(__vvar_page + (1 << 12), (1 << 12));
 . = ALIGN((1 << 12));
 .init.begin : AT(ADDR(.init.begin) - 0xffffffff80000000) {
  __init_begin = .;
 }
 __per_cpu_load = .; .data..percpu 0 : AT(__per_cpu_load - 0xffffffff80000000) { __per_cpu_start = .; *(.data..percpu..first) . = ALIGN((1 << 12)); *(.data..percpu..page_aligned) . = ALIGN((1 << 6)); *(.data..percpu..read_mostly) . = ALIGN((1 << 6)); *(.data..percpu) *(.data..percpu..shared_aligned) __per_cpu_end = .; } :percpu . = __per_cpu_load + SIZEOF(.data..percpu);
 ASSERT(SIZEOF(.data..percpu) < 0x1000000,
        "per-CPU data too large - increase CONFIG_PHYSICAL_START")
 . = ALIGN((1 << 12)); .init.text : AT(ADDR(.init.text) - 0xffffffff80000000) { _sinittext = .; *(.init.text .init.text.*) *(.text.startup) *(.meminit.text*) _einittext = .; }
 :init
 .altinstr_aux : AT(ADDR(.altinstr_aux) - 0xffffffff80000000) {
  *(.altinstr_aux)
 }
 .init.data : AT(ADDR(.init.data) - 0xffffffff80000000) { KEEP(*(SORT(___kentry+*))) *(.init.data .init.data.*) *(.meminit.data*) *(.init.rodata .init.rodata.*) . = ALIGN(8); __start_ftrace_events = .; KEEP(*(_ftrace_events)) __stop_ftrace_events = .; __start_ftrace_eval_maps = .; KEEP(*(_ftrace_eval_map)) __stop_ftrace_eval_maps = .; . = ALIGN(8); __start_kprobe_blacklist = .; KEEP(*(_kprobe_blacklist)) __stop_kprobe_blacklist = .; *(.meminit.rodata) . = ALIGN(8); __cpu_method_of_table = .; KEEP(*(__cpu_method_of_table)) KEEP(*(__cpu_method_of_table_end)) . = ALIGN(8); __cpuidle_method_of_table = .; KEEP(*(__cpuidle_method_of_table)) KEEP(*(__cpuidle_method_of_table_end)) . = ALIGN(32); __dtb_start = .; KEEP(*(.dtb.init.rodata)) __dtb_end = .; . = ALIGN(8); __irqchip_acpi_probe_table = .; KEEP(*(__irqchip_acpi_probe_table)) __irqchip_acpi_probe_table_end = .; . = ALIGN(8); __timer_acpi_probe_table = .; KEEP(*(__timer_acpi_probe_table)) __timer_acpi_probe_table_end = .; . = ALIGN(8); __governor_thermal_table = .; KEEP(*(__governor_thermal_table)) __governor_thermal_table_end = .; . = ALIGN(8); __earlycon_table = .; KEEP(*(__earlycon_table)) __earlycon_table_end = .; . = ALIGN(8); __start_lsm_info = .; KEEP(*(.lsm_info.init)) __end_lsm_info = .; . = ALIGN(8); __start_early_lsm_info = .; KEEP(*(.early_lsm_info.init)) __end_early_lsm_info = .; . = ALIGN(8); __kunit_init_suites_start = .; KEEP(*(.kunit_init_test_suites)) __kunit_init_suites_end = .; . = ALIGN(16); __setup_start = .; KEEP(*(.init.setup)) __setup_end = .; __initcall_start = .; KEEP(*(.initcallearly.init)) __initcall0_start = .; KEEP(*(.initcall0.init)) KEEP(*(.initcall0s.init)) __initcall1_start = .; KEEP(*(.initcall1.init)) KEEP(*(.initcall1s.init)) __initcall2_start = .; KEEP(*(.initcall2.init)) KEEP(*(.initcall2s.init)) __initcall3_start = .; KEEP(*(.initcall3.init)) KEEP(*(.initcall3s.init)) __initcall4_start = .; KEEP(*(.initcall4.init)) KEEP(*(.initcall4s.init)) __initcall5_start = .; KEEP(*(.initcall5.init)) KEEP(*(.initcall5s.init)) __initcallrootfs_start = .; KEEP(*(.initcallrootfs.init)) KEEP(*(.initcallrootfss.init)) __initcall6_start = .; KEEP(*(.initcall6.init)) KEEP(*(.initcall6s.init)) __initcall7_start = .; KEEP(*(.initcall7.init)) KEEP(*(.initcall7s.init)) __initcall_end = .; __con_initcall_start = .; KEEP(*(.con_initcall.init)) __con_initcall_end = .; . = ALIGN(4); __initramfs_start = .; KEEP(*(.init.ramfs)) . = ALIGN(8); KEEP(*(.init.ramfs.info)) }
 .x86_cpu_dev.init : AT(ADDR(.x86_cpu_dev.init) - 0xffffffff80000000) {
  __x86_cpu_dev_start = .;
  *(.x86_cpu_dev.init)
  __x86_cpu_dev_end = .;
 }
 . = ALIGN(8);
 .retpoline_sites : AT(ADDR(.retpoline_sites) - 0xffffffff80000000) {
  __retpoline_sites = .;
  *(.retpoline_sites)
  __retpoline_sites_end = .;
 }
 . = ALIGN(8);
 .return_sites : AT(ADDR(.return_sites) - 0xffffffff80000000) {
  __return_sites = .;
  *(.return_sites)
  __return_sites_end = .;
 }
 . = ALIGN(8);
 .call_sites : AT(ADDR(.call_sites) - 0xffffffff80000000) {
  __call_sites = .;
  *(.call_sites)
  __call_sites_end = .;
 }
 . = ALIGN(8);
 .ibt_endbr_seal : AT(ADDR(.ibt_endbr_seal) - 0xffffffff80000000) {
  __ibt_endbr_seal = .;
  *(.ibt_endbr_seal)
  __ibt_endbr_seal_end = .;
 }
 . = ALIGN(8);
 .altinstructions : AT(ADDR(.altinstructions) - 0xffffffff80000000) {
  __alt_instructions = .;
  *(.altinstructions)
  __alt_instructions_end = .;
 }
 .altinstr_replacement : AT(ADDR(.altinstr_replacement) - 0xffffffff80000000) {
  *(.altinstr_replacement)
 }
 . = ALIGN(8);
 .apicdrivers : AT(ADDR(.apicdrivers) - 0xffffffff80000000) {
  __apicdrivers = .;
  *(.apicdrivers);
  __apicdrivers_end = .;
 }
 . = ALIGN(8);
 .exit.text : AT(ADDR(.exit.text) - 0xffffffff80000000) {
  *(.exit.text) *(.text.exit)
 }
 .exit.data : AT(ADDR(.exit.data) - 0xffffffff80000000) {
  *(.exit.data .exit.data.*) *(.fini_array .fini_array.*) *(.dtors .dtors.*)
 }
 . = ALIGN((1 << 12));
 .init.end : AT(ADDR(.init.end) - 0xffffffff80000000) {
  __init_end = .;
 }
 . = ALIGN((1 << 12));
 .smp_locks : AT(ADDR(.smp_locks) - 0xffffffff80000000) {
  __smp_locks = .;
  *(.smp_locks)
  . = ALIGN((1 << 12));
  __smp_locks_end = .;
 }
 .data_nosave : AT(ADDR(.data_nosave) - 0xffffffff80000000) {
  . = ALIGN((1 << 12)); __nosave_begin = .; *(.data..nosave) . = ALIGN((1 << 12)); __nosave_end = .;
 }
 . = ALIGN((1 << 12));
 .bss : AT(ADDR(.bss) - 0xffffffff80000000) {
  __bss_start = .;
  *(.bss..page_aligned)
  . = ALIGN((1 << 12));
  *(.bss)
  . = ALIGN((1 << 21)); __start_bss_decrypted = .; *(.bss..decrypted); . = ALIGN((1 << 12)); __start_bss_decrypted_unused = .; . = ALIGN((1 << 21)); __end_bss_decrypted = .;
  . = ALIGN((1 << 12));
  __bss_stop = .;
 }
 __end_of_kernel_reserve = .;
 . = ALIGN((1 << 12));
 .brk : AT(ADDR(.brk) - 0xffffffff80000000) {
  __brk_base = .;
  . += 64 * 1024;
  *(.bss..brk)
  __brk_limit = .;
 }
 . = ALIGN((1 << 12));
 _end = .;
 .stab 0 : { *(.stab) } .stabstr 0 : { *(.stabstr) } .stab.excl 0 : { *(.stab.excl) } .stab.exclstr 0 : { *(.stab.exclstr) } .stab.index 0 : { *(.stab.index) } .stab.indexstr 0 : { *(.stab.indexstr) }
 .debug 0 : { *(.debug) } .line 0 : { *(.line) } .debug_srcinfo 0 : { *(.debug_srcinfo) } .debug_sfnames 0 : { *(.debug_sfnames) } .debug_aranges 0 : { *(.debug_aranges) } .debug_pubnames 0 : { *(.debug_pubnames) } .debug_info 0 : { *(.debug_info .gnu.linkonce.wi.*) } .debug_abbrev 0 : { *(.debug_abbrev) } .debug_line 0 : { *(.debug_line) } .debug_frame 0 : { *(.debug_frame) } .debug_str 0 : { *(.debug_str) } .debug_loc 0 : { *(.debug_loc) } .debug_macinfo 0 : { *(.debug_macinfo) } .debug_pubtypes 0 : { *(.debug_pubtypes) } .debug_ranges 0 : { *(.debug_ranges) } .debug_weaknames 0 : { *(.debug_weaknames) } .debug_funcnames 0 : { *(.debug_funcnames) } .debug_typenames 0 : { *(.debug_typenames) } .debug_varnames 0 : { *(.debug_varnames) } .debug_gnu_pubnames 0 : { *(.debug_gnu_pubnames) } .debug_gnu_pubtypes 0 : { *(.debug_gnu_pubtypes) } .debug_types 0 : { *(.debug_types) } .debug_addr 0 : { *(.debug_addr) } .debug_line_str 0 : { *(.debug_line_str) } .debug_loclists 0 : { *(.debug_loclists) } .debug_macro 0 : { *(.debug_macro) } .debug_names 0 : { *(.debug_names) } .debug_rnglists 0 : { *(.debug_rnglists) } .debug_str_offsets 0 : { *(.debug_str_offsets) }
 .comment 0 : { *(.comment) } .symtab 0 : { *(.symtab) } .strtab 0 : { *(.strtab) } .shstrtab 0 : { *(.shstrtab) }
 /DISCARD/ : { *(.exitcall.exit) *(__patchable_function_entries) *(.discard) *(.discard.*) *(.export_symbol) *(.modinfo) *(.gnu.version*) }
 .got.plt (INFO) : { *(.got.plt) }
 ASSERT(SIZEOF(.got.plt) == 0 ||
        SIZEOF(.got.plt) == 0x18,
        "Unexpected GOT/PLT entries detected!")
 .got : {
  *(.got) *(.igot.*)
 }
 ASSERT(SIZEOF(.got) == 0, "Unexpected GOT entries detected!")
 .plt : {
  *(.plt) *(.plt.*) *(.iplt)
 }
 ASSERT(SIZEOF(.plt) == 0, "Unexpected run-time procedure linkages detected!")
 .rel.dyn : {
  *(.rel.*) *(.rel_*)
 }
 ASSERT(SIZEOF(.rel.dyn) == 0, "Unexpected run-time relocations (.rel) detected!")
 .rela.dyn : {
  *(.rela.*) *(.rela_*)
 }
 ASSERT(SIZEOF(.rela.dyn) == 0, "Unexpected run-time relocations (.rela) detected!")
}
. = ASSERT((_end - 0xffffffff80000000 <= (1024 * 1024 * 1024)),
    "kernel image bigger than KERNEL_IMAGE_SIZE");
init_per_cpu__gdt_page = ABSOLUTE(gdt_page) + __per_cpu_load;
init_per_cpu__fixed_percpu_data = ABSOLUTE(fixed_percpu_data) + __per_cpu_load;
init_per_cpu__irq_stack_backing_store = ABSOLUTE(irq_stack_backing_store) + __per_cpu_load;
. = ASSERT((fixed_percpu_data == 0),
           "fixed_percpu_data is not at start of per-cpu area");

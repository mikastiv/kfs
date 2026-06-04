pub const magic = 0x1badb002;

pub const Header = extern struct {
    magic: u32,
    flags: Flags,
    checksum: u32,
    addr: extern struct {
        header: u32,
        load: u32,
        load_end: u32,
        bss_end: u32,
        entry: u32,
    },
    video: extern struct {
        mode_type: enum(u32) { linear = 0, ega_text = 1, _ },
        width: u32,
        height: u32,
        depth: u32,
    },

    pub const Flags = packed struct(u32) {
        module_align: bool,
        mem_info: bool,
        video_mode: bool,
        padding: u29 = 0,
    };

    pub fn calculateChecksum(flags: Flags) u32 {
        const f: u32 = @bitCast(flags);
        return ~(magic +% f) +% 1;
    }
};

pub const AoutSymbolTable = extern struct {
    tabsize: u32,
    strsize: u32,
    addr: u32,
    reserved: u32,
};

pub const ElfSectionHeaderTable = extern struct {
    num: u32,
    size: u32,
    addr: u32,
    shndx: u32,
};

// https://www.gnu.org/software/grub/manual/multiboot/multiboot.html#Example-OS-code
pub const Info = extern struct {
    flags: packed struct(u32) {
        mem: bool,
        boot_device: bool,
        cmdline: bool,
        mods: bool,
        aout_symbol: bool,
        elf_section: bool,
        mmap: bool,
        drives: bool,
        config_table: bool,
        boot_loader_name: bool,
        apm_table: bool,
        vbe: bool,
        framebuffer: bool,
        padding: u19,
    },

    mem_lower: u32,
    mem_upper: u32,

    boot_device: u32,

    cmdline: u32,

    mods_count: u32,
    mods_addr: u32,

    u: extern union {
        aout_sym: AoutSymbolTable,
        elf_sec: ElfSectionHeaderTable,
    },

    mmap_length: u32,
    mmap_addr: u32,

    drives_length: u32,
    drives_addr: u32,

    config_table: u32,

    boot_loader_name: u32,

    apm_table: u32,

    vbe: extern struct {
        control_info: u32,
        mode_info: u32,
        mode: u16,
        interface_seg: u16,
        interface_off: u16,
        interface_len: u16,
    },

    framebuffer: extern struct {
        addr: u64,
        pitch: u32,
        width: u32,
        height: u32,
        bpp: u8,
        type: enum(u8) { indexed = 0, rgb = 1, ega_text = 2, _ },
        mode: extern union {
            palette: extern struct {
                palette_addr: u32,
                palette_num_colors: u16,
            },
            rgb: extern struct {
                red_field_position: u8,
                red_mask_size: u8,
                green_field_position: u8,
                green_mask_size: u8,
                blue_field_position: u8,
                blue_mask_size: u8,
            },
        },
    },
};

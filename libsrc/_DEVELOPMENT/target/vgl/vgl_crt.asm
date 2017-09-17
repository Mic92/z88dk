
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; SELECT CRT0 FROM -STARTUP=N COMMANDLINE OPTION ;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


IF !DEFINED_startup
	defc	DEFINED_startup = 1
	defc startup = 1
	IFNDEF startup
	ENDIF
ENDIF






IFNDEF startup

   ; startup undefined so select a default
	
   defc startup = 1

ENDIF


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; user supplied crt ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ram model ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; rom model ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


   ; generic embedded system
   ; no files, no fds

   IFNDEF __CRTCFG
   
      defc __CRTCFG = 1
   
   ENDIF
   
   IFNDEF __MMAP
   
      defc __MMAP = 0
   
   ENDIF

   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                 V-Tech Genius Leader target               ;;
;;    generated from target/vgl/startup/vgl_crt_0.asm.m4     ;;
;;                                                           ;;
;;                 ?flat 64k address space                   ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; GLOBAL SYMBOLS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

include "config_vgl_public.inc"	; This will be a file containing all the defined constants from the config directory.  When the library is built, the file will be generated.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; CRT AND CLIB CONFIGURATION ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

include "../crt_defaults.inc"
include "crt_config.inc"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; crt rules ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


   IFDEF CRT_ORG_CODE
      
      defc __crt_org_code = CRT_ORG_CODE
      
   ELSE
      
      IFDEF TAR__crt_org_code
         
         defc __crt_org_code = TAR__crt_org_code
         
      ELSE
         
         defc __crt_org_code = DEF__crt_org_code
         
      ENDIF
      
   ENDIF

   IFDEF REGISTER_SP
   
      defc __register_sp = REGISTER_SP
   
   ELSE
   
      IFDEF STACKPTR
      
         defc __register_sp = STACKPTR
      
      ELSE
      
         IFDEF TAR__register_sp
         
            defc __register_sp = TAR__register_sp
         
         ELSE
         
            defc __register_sp = DEF__register_sp
         
         ENDIF
         
      ENDIF
   
   ENDIF
   
   
   IFDEF CRT_STACK_SIZE
   
      defc __crt_stack_size = CRT_STACK_SIZE
   
   ELSE
   
      IFDEF TAR__crt_stack_size
      
         defc __crt_stack_size = TAR__crt_stack_size
      
      ELSE
      
         defc __crt_stack_size = DEF__crt_stack_size
      
      ENDIF
   
   ENDIF
   
      
   IFDEF CRT_ORG_DATA
   
      defc __crt_org_data = CRT_ORG_DATA
   
   ELSE
   
      IFDEF TAR__crt_org_data
      
         defc __crt_org_data = TAR__crt_org_data
      
      ELSE
      
         defc __crt_org_data = DEF__crt_org_data
      
      ENDIF
   
   ENDIF
   
   
   IFDEF CRT_ORG_BSS
   
      defc __crt_org_bss = CRT_ORG_BSS
   
   ELSE
   
      IFDEF TAR__crt_org_bss
      
         defc __crt_org_bss = TAR__crt_org_bss
      
      ELSE
      
         defc __crt_org_bss = DEF__crt_org_bss
      
      ENDIF
   
   ENDIF
   
   
   IFDEF CRT_MODEL
   
      defc __crt_model = CRT_MODEL
   
   ELSE
   
      IFDEF TAR__crt_model
      
         defc __crt_model = TAR__crt_model
      
      ELSE
      
         defc __crt_model = DEF__crt_model
      
      ENDIF
   
   ENDIF
   
   IFDEF CRT_INITIALIZE_BSS
   
      defc __crt_initialize_bss = CRT_INITIALIZE_BSS
   
   ELSE
   
      IFDEF TAR__crt_initialize_bss
      
         defc __crt_initialize_bss = TAR__crt_initialize_bss
      
      ELSE
      
         defc __crt_initialize_bss = DEF__crt_initialize_bss
      
      ENDIF
   
   ENDIF
   
   
   IFDEF CRT_INCLUDE_PREAMBLE
   
      defc __crt_include_preamble = CRT_INCLUDE_PREAMBLE
   
   ELSE
   
      IFDEF TAR__crt_include_preamble
      
         defc __crt_include_preamble = TAR__crt_include_preamble
      
      ELSE
      
         defc __crt_include_preamble = DEF__crt_include_preamble
      
      ENDIF
      
   ENDIF

   IFDEF CRT_ORG_VECTOR_TABLE
   
      defc __crt_org_vector_table = CRT_ORG_VECTOR_TABLE
   
   ELSE
   
      IFDEF TAR__crt_org_vector_table
      
         defc __crt_org_vector_table = TAR__crt_org_vector_table
      
      ELSE
      
         defc __crt_org_vector_table = DEF__crt_org_vector_table
      
      ENDIF
      
   ENDIF

IF __Z180

   IFDEF CRT_IO_VECTOR_BASE
   
      defc __crt_io_vector_base = CRT_IO_VECTOR_BASE
   
   ELSE
   
      IFDEF TAR__crt_io_vector_base
      
         defc __crt_io_vector_base = TAR__crt_io_vector_base
      
      ELSE
      
         defc __crt_io_vector_base = DEF__crt_io_vector_base
      
      ENDIF
      
   ENDIF

ENDIF

   IFDEF CRT_INTERRUPT_MODE
   
      defc __crt_interrupt_mode = CRT_INTERRUPT_MODE
   
   ELSE
   
      IFDEF TAR__crt_interrupt_mode
      
         defc __crt_interrupt_mode = TAR__crt_interrupt_mode
      
      ELSE
      
         defc __crt_interrupt_mode = DEF__crt_interrupt_mode
      
      ENDIF
      
   ENDIF

   
   IFDEF CRT_ENABLE_COMMANDLINE
   
      defc __crt_enable_commandline = CRT_ENABLE_COMMANDLINE
   
   ELSE
   
      IFDEF TAR__crt_enable_commandline
      
         defc __crt_enable_commandline = TAR__crt_enable_commandline
      
      ELSE
      
         defc __crt_enable_commandline = DEF__crt_enable_commandline
      
      ENDIF
   
   ENDIF
   
   
   IFDEF CRT_ENABLE_RESTART
   
      defc __crt_enable_restart = CRT_ENABLE_RESTART
   
   ELSE
   
      IFDEF TAR__crt_enable_restart
      
         defc __crt_enable_restart = TAR__crt_enable_restart
      
      ELSE
      
         defc __crt_enable_restart = DEF__crt_enable_restart
      
      ENDIF
   
   ENDIF
   
   
   IFDEF CRT_ENABLE_CLOSE
   
      defc __crt_enable_close = CRT_ENABLE_CLOSE
   
   ELSE
   
      IFDEF TAR__crt_enable_close
      
         defc __crt_enable_close = TAR__crt_enable_close
      
      ELSE
      
         defc __crt_enable_close = DEF__crt_enable_close
      
      ENDIF
   
   ENDIF
   
   
   IFDEF CRT_ENABLE_EIDI
   
      defc __crt_enable_eidi = CRT_ENABLE_EIDI
      
   ELSE
   
      IFDEF TAR__crt_enable_eidi
      
         defc __crt_enable_eidi = TAR__crt_enable_eidi
      
      ELSE
      
         defc __crt_enable_eidi = DEF__crt_enable_eidi
         
      ENDIF
      
   ENDIF
   
   
   IF __crt_enable_restart
   
      defc __crt_on_exit = 0x10008
   
   ELSE
   
      IFDEF CRT_ON_EXIT
      
         defc __crt_on_exit = CRT_ON_EXIT
      
      ELSE
      
         IFDEF TAR__crt_on_exit
         
            defc __crt_on_exit = TAR__crt_on_exit
            
         ELSE
         
            defc __crt_on_exit = DEF__crt_on_exit
         
         ENDIF
      
      ENDIF
   
   ENDIF
   
   
   IFDEF CLIB_EXIT_STACK_SIZE
   
      defc __clib_exit_stack_size = CLIB_EXIT_STACK_SIZE
   
   ELSE
   
      IFDEF TAR__clib_exit_stack_size
      
         defc __clib_exit_stack_size = TAR__clib_exit_stack_size
      
      ELSE
      
         defc __clib_exit_stack_size = DEF__clib_exit_stack_size
      
      ENDIF
   
   ENDIF
   
   
   IFDEF CLIB_QUICKEXIT_STACK_SIZE
   
      defc __clib_quickexit_stack_size = CLIB_QUICKEXIT_STACK_SIZE

   ELSE
   
      IFDEF TAR__clib_quickexit_stack_size
      
         defc __clib_quickexit_stack_size = TAR__clib_quickexit_stack_size
      
      ELSE
      
         defc __clib_quickexit_stack_size = DEF__clib_quickexit_stack_size
      
      ENDIF
      
   ENDIF
   
   
   IFDEF CLIB_MALLOC_HEAP_SIZE
   
      defc __clib_malloc_heap_size = CLIB_MALLOC_HEAP_SIZE
   
   ELSE
   
      IFDEF TAR__clib_malloc_heap_size
      
         defc __clib_malloc_heap_size = TAR__clib_malloc_heap_size
      
      ELSE
      
         defc __clib_malloc_heap_size = DEF__clib_malloc_heap_size
      
      ENDIF

   ENDIF

   
   IFDEF CLIB_STDIO_HEAP_SIZE
   
      defc __clib_stdio_heap_size = CLIB_STDIO_HEAP_SIZE
   
   ELSE
   
      IFDEF TAR__clib_stdio_heap_size
      
         defc __clib_stdio_heap_size = TAR__clib_stdio_heap_size
      
      ELSE
      
         defc __clib_stdio_heap_size = DEF__clib_stdio_heap_size
   
      ENDIF
   
   ENDIF
   
   
   IFDEF CLIB_BALLOC_TABLE_SIZE
   
      defc __clib_balloc_table_size = CLIB_BALLOC_TABLE_SIZE
   
   ELSE
   
      IFDEF TAR__clib_balloc_table_size
      
         defc __clib_balloc_table_size = TAR__clib_balloc_table_size
      
      ELSE
      
         defc __clib_balloc_table_size = DEF__clib_balloc_table_size
      
      ENDIF
   
   ENDIF
   
   
   IFDEF CLIB_FOPEN_MAX
   
      defc __clib_fopen_max = CLIB_FOPEN_MAX
   
   ELSE
   
      IFDEF TAR__clib_fopen_max
      
         defc __clib_fopen_max = TAR__clib_fopen_max
      
      ELSE
      
         defc __clib_fopen_max = DEF__clib_fopen_max
      
      ENDIF
   
   ENDIF
   
   
   IFDEF CLIB_OPEN_MAX
   
      defc __clib_open_max = CLIB_OPEN_MAX

   ELSE
   
      IFDEF TAR__clib_open_max
      
         defc __clib_open_max = TAR__clib_open_max
      
      ELSE
      
         defc __clib_open_max = DEF__clib_open_max
      
      ENDIF
      
   ENDIF


   IFDEF CRT_ENABLE_RST
   
      defc __crt_enable_rst = CRT_ENABLE_RST
   
   ELSE
   
      IFDEF TAR__crt_enable_rst
      
         defc __crt_enable_rst = TAR__crt_enable_rst
      
      ELSE
      
         defc __crt_enable_rst = DEF__crt_enable_rst
      
      ENDIF
   
   ENDIF
   
   
   IFDEF CRT_ENABLE_NMI
   
      defc __crt_enable_nmi = CRT_ENABLE_NMI
   
   ELSE
   
      IFDEF TAR__crt_enable_nmi
      
         defc __crt_enable_nmi = TAR__crt_enable_nmi
      
      ELSE
      
         defc __crt_enable_nmi = DEF__crt_enable_nmi
      
      ENDIF
      
   ENDIF
   
   IFDEF CRT_ENABLE_TRAP
   
      defc __crt_enable_trap = CRT_ENABLE_TRAP
   
   ELSE
   
      IFDEF TAR__crt_enable_trap
      
         defc __crt_enable_trap = TAR__crt_enable_trap
      
      ELSE
      
         defc __crt_enable_trap = DEF__crt_enable_trap
      
      ENDIF
      
   ENDIF

   ;; rules that must be processed by m4
   
   

   IFNDEF __crt_include_driver_instantiation
      defc __crt_include_driver_instantiation = 0
   ENDIF

   ;; public definitions

   PUBLIC __clib_fopen_max
   PUBLIC __clib_open_max
   
   PUBLIC __exit_stack_size
   PUBLIC __quickexit_stack_size
   
   defc __exit_stack_size = __clib_exit_stack_size
   defc __quickexit_stack_size = __clib_quickexit_stack_size

   IF __Z180
   
      PUBLIC __IO_VECTOR_BASE
      
      IF __crt_io_vector_base < 0
      
         IF (__crt_org_vector_table < 0)
         
            IF (-__crt_org_vector_table) & 0x1f
            
               "Cannot place __IO_VECTOR_BASE at start of interrupt vector table"
            
            ELSE
            
               defc __IO_VECTOR_BASE = (-__crt_org_vector_table) & 0xe0
               
            ENDIF
         
         ELSE
         
            IF __crt_org_vector_table & 0x1f
            
               "Cannot place __IO_VECTOR_BASE at start of interrupt vector table"
            
            ELSE
            
               defc __IO_VECTOR_BASE = __crt_org_vector_table & 0xe0

            ENDIF
            
         ENDIF
      
      ELSE
      
         IF __crt_io_vector_base & 0x1f
         
            "Illegal __IO_VECTOR_BASE"
         
         ELSE

            defc __IO_VECTOR_BASE = __crt_io_vector_base & 0xe0
         
         ENDIF
      
      ENDIF
   
   ENDIF

;; end crt rules ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; crt rules for V-Tech Genius Leader ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   ; Define Memory Banks
;   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;   IFNDEF CRT_ORG_DTX
;      defc CRT_ORG_DTX     = 0x8000
;   ENDIF
;
;   IFNDEF CRT_ORG_BANK_00
;      defc CRT_ORG_BANK_00 = 0xc000
;   ENDIF
;
;   IFNDEF CRT_ORG_BANK_01
;      defc CRT_ORG_BANK_01 = 0xc000
;   ENDIF
;
;   IFNDEF CRT_ORG_BANK_02
;      defc CRT_ORG_BANK_02 = 0xc000
;   ENDIF
;
;   IFNDEF CRT_ORG_BANK_03
;      defc CRT_ORG_BANK_03 = 0xc000
;   ENDIF
;
;   IFNDEF CRT_ORG_BANK_04
;      defc CRT_ORG_BANK_04 = 0xc000
;   ENDIF
;
;   IFNDEF CRT_ORG_BANK_05
;      defc CRT_ORG_BANK_05 = 0xc000
;   ENDIF
;
;   IFNDEF CRT_ORG_BANK_06
;      defc CRT_ORG_BANK_06 = 0xc000
;   ENDIF
;
;   IFNDEF CRT_ORG_BANK_07
;      defc CRT_ORG_BANK_07 = 0xc000
;   ENDIF

   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ; Input Terminal Settings
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

   IFNDEF CRT_ITERM_TERMINAL_FLAGS
      defc CRT_ITERM_TERMINAL_FLAGS = 0x03b0
   ENDIF

   ; buffer size must be available to m4 (requires special case in zcc)
   
   

   IFNDEF CRT_ITERM_EDIT_BUFFER_SIZE
      defc CRT_ITERM_EDIT_BUFFER_SIZE = 64
   ENDIF

;   ;
;   ; LASTK Input Terminal Only
;   ;
;
;   IFNDEF CRT_ITERM_LASTK_ADDRESS
;      defc CRT_ITERM_LASTK_ADDRESS = 23560
;   ENDIF
;
;   ;
;   ; INKEY Input Terminal Only (used by supplied CRTs)
;   ;
;
;   IFNDEF CRT_ITERM_INKEY_DEBOUNCE
;      defc CRT_ITERM_INKEY_DEBOUNCE = 1
;   ENDIF
;
;   IFNDEF CRT_ITERM_INKEY_REPEAT_START
;      defc CRT_ITERM_INKEY_REPEAT_START = 500
;   ENDIF
;
;   IFNDEF CRT_ITERM_INKEY_REPEAT_RATE
;      defc CRT_ITERM_INKEY_REPEAT_RATE = 15
;   ENDIF

   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ; Output Terminal Settings
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

   IFNDEF CRT_OTERM_TERMINAL_FLAGS
      defc CRT_OTERM_TERMINAL_FLAGS = 0x2370
   ENDIF

   ;
   ; Terminal Window Dimensions in Characters
   ;

   IFNDEF CRT_OTERM_WINDOW_X
      defc CRT_OTERM_WINDOW_X = 0           ; ZX: multiplied by two in 64 col terminals
   ENDIF
   
   IFNDEF CRT_OTERM_WINDOW_WIDTH
      defc CRT_OTERM_WINDOW_WIDTH = 20      ; ZX: multiplied by two in 64 col terminals
   ENDIF
   
   IFNDEF CRT_OTERM_WINDOW_Y
      defc CRT_OTERM_WINDOW_Y = 0
   ENDIF
   
   IFNDEF CRT_OTERM_WINDOW_HEIGHT
      defc CRT_OTERM_WINDOW_HEIGHT = 4
   ENDIF

;   ;
;   ; Terminal Text Colour
;   ;
;
;   IFNDEF CRT_OTERM_TEXT_COLOR
;      defc CRT_OTERM_TEXT_COLOR = 0x38
;   ENDIF
;   
;   IFNDEF CRT_OTERM_TEXT_COLOR_MASK
;      defc CRT_OTERM_TEXT_COLOR_MASK = 0x00
;   ENDIF
;
;   IFNDEF CRT_OTERM_BACKGROUND_COLOR
;      defc CRT_OTERM_BACKGROUND_COLOR = 0x38
;   ENDIF
;
;   ;  
;   ; FZX Proportional Font Output Terminals
;   ;
;
;   ; The terminal window contains the paper into
;   ; which fzx characters are drawn
;
;   IFNDEF CRT_OTERM_FZX_PAPER_X
;      defc CRT_OTERM_FZX_PAPER_X = 0
;   ENDIF
;
;   IFNDEF CRT_OTERM_FZX_PAPER_WIDTH
;      defc CRT_OTERM_FZX_PAPER_WIDTH = 256
;   ENDIF
;
;   IFNDEF CRT_OTERM_FZX_PAPER_Y
;      defc CRT_OTERM_FZX_PAPER_Y = 0
;   ENDIF
;
;   IFNDEF CRT_OTERM_FZX_PAPER_HEIGHT
;      defc CRT_OTERM_FZX_PAPER_HEIGHT = 192
;   ENDIF
;
;   ; draw mode must be available to m4 (requires special case in zcc)
;   ; 0 = OR, 1 = XOR, 2 = CLEAR
;
;   
;
;   IFNDEF CRT_OTERM_FZX_DRAW_MODE
;      defc CRT_OTERM_FZX_DRAW_MODE = 1
;   ENDIF
;
;   ; 0 = single, 1 = 1.5, 2 = double
;
;   IFNDEF CRT_OTERM_FZX_LINE_SPACING
;      defc CRT_OTERM_FZX_LINE_SPACING = 0
;   ENDIF
;
;   ; left margin in pixels to allow kerning
;
;   IFNDEF CRT_OTERM_FZX_LEFT_MARGIN
;      defc CRT_OTERM_FZX_LEFT_MARGIN = 3
;   ENDIF
;
;   ; space character width expansion in pixels
;
;   IFNDEF CRT_OTERM_FZX_SPACE_EXPAND
;      defc CRT_OTERM_FZX_SPACE_EXPAND = 0
;   ENDIF
;
;   ;
;   ; FONT SELECTION
;   ; use pragam redirect to change font
;   ;
;   ; #pragam redirect CRT_OTERM_FONT_8X8 = _font_8x8_rom        ; 32-col font definition in rom
;   ; #pragma redirect CRT_OTERM_FONT_8X8 = _font_8x8_zx_system  ; 32-col font
;   ; #pragma redirect CRT_OTERM_FONT_4X8 = _font_4x8_default    ; 64-col font
;   ; #pragma redirect CRT_OTERM_FONT_FZX = _ff_ind_Termino      ; fzx proportional font
;
;; end crt rules ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	; This file will process target-specific pragmas, of which you will initially have none.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; SET UP MEMORY MAP ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

include "crt_memory_map.inc"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; INSTANTIATE DRIVERS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


; @FIXME: Needs to be implemented for V-Tech: This target has no device drivers so it cannot instantiate FILEs.



; When FILEs and FDSTRUCTs are instantiated labels are assigned
; to point at created structures.
;
; The label formats are:
;
; __i_stdio_file_n     = address of static FILE structure #n (0..__I_STDIO_NUM_FILE-1)
; __i_fcntl_fdstruct_n = address of static FDSTRUCT #n (0..__I_FCNTL_NUM_FD-1)
; __i_fcntl_heap_n     = address of allocation #n on heap (0..__I_FCNTL_NUM_HEAP-1)






   
   
   
   
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ; FILE  : _stdout
   ;
   ; driver: vgl_output_char
   ; fd    : 0
   ; mode  : write only
   ; type  : 002 = output terminal
   ;
   ; ioctl_flags   : CRT_OTERM_TERMINAL_FLAGS
   ; cursor coord  : (0,0)
   ; window        : (CRT_OTERM_WINDOW_X,CRT_OTERM_WINDOW_WIDTH,CRT_OTERM_WINDOW_Y,CRT_OTERM_WINDOW_HEIGHT)
   ; scroll limit  : 0
   ; font address  : 0
   ; text colour   : 0
   ; text mask     : 0
   ; background    : 0
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   
      
   SECTION data_clib
   SECTION data_stdio
   
   ; FILE *
      
   PUBLIC _stdout
      
   _stdout:  defw __i_stdio_file_0 + 2
   
   ; FILE structure
   
   __i_stdio_file_0:
   
      ; open files link
      
      defw 0
      
      ; jump to underlying fd
      
      defb 195
      defw __i_fcntl_fdstruct_0

      ; state_flags_0
      ; state_flags_1
      ; conversion flags
      ; ungetc

      defb 0x80         ; write + normal file type
      defb 0            ; last operation was write
      defb 0
      defb 0
      
      ; mtx_recursive
      
      defb 0         ; thread owner = none
      defb 0x02      ; mtx_recursive
      defb 0         ; lock count = 0
      defb 0xfe      ; atomic spinlock
      defw 0         ; list of blocked threads
    
         
   ; fd table entry
   
   SECTION data_fcntl_fdtable_body
   defw __i_fcntl_fdstruct_0

   ; FDSTRUCT structure
   
   SECTION data_fcntl_stdio_heap_body
   
   EXTERN console_01_output_terminal_fdriver
   EXTERN vgl_output_char
   
   __i_fcntl_heap_0:
   
      ; heap header
      
      defw __i_fcntl_heap_1
      defw 35
      defw 0

   __i_fcntl_fdstruct_0:
   
      ; FDSTRUCT structure
      
      ; call to first entry to driver
      
      defb 205
      defw console_01_output_terminal_fdriver
      
      ; jump to driver
      
      defb 195
      defw vgl_output_char
      
      ; flags
      ; reference_count
      ; mode_byte
      
      defb 0x02      ; type = output terminal
      defb 2
      defb 0x02      ; write only
      
      ; ioctl_flags
      
      defw CRT_OTERM_TERMINAL_FLAGS
      
      ; mtx_plain
      
      defb 0         ; thread owner = none
      defb 0x01      ; mtx_plain
      defb 0         ; lock count = 0
      defb 0xfe      ; atomic spinlock
      defw 0         ; list of blocked threads

      ; cursor coordinate
      ; window rectangle
      ; scroll limit

      defb 0, 0
      defb CRT_OTERM_WINDOW_X, CRT_OTERM_WINDOW_WIDTH, CRT_OTERM_WINDOW_Y, CRT_OTERM_WINDOW_HEIGHT
      defb 0
      
;      ; font address
;      ; text colour
;      ; text mask
;      ; background colour
;      
;      EXTERN 0
;      
;      defw 0 - 256
;      defb 0
;      defb 0
;      defb 0

         
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;; create open and closed FILE lists
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

   ; __clib_fopen_max   = max number of open FILEs specified by user
   ; 1 = number of static FILEs instantiated in crt
   ; __i_stdio_file_n   = address of static FILE structure #n (0..I_STDIO_FILE_NUM-1)

	PUBLIC __MAX_FOPEN
	
   SECTION data_clib
   SECTION data_stdio

   IF (__clib_fopen_max > 0) || (1 > 0)

      ; number of FILEs > 0

      ; construct list of open files

      IF 1 > 0
   
         ; number of FILEs statically generated > 0
      
         SECTION data_clib
         SECTION data_stdio
      
         PUBLIC __stdio_open_file_list
      
         __stdio_open_file_list:  defw __i_stdio_file_0
   
      ELSE
   
         ; number of FILEs statically generated = 0
   
         SECTION bss_clib
         SECTION bss_stdio
      
         PUBLIC __stdio_open_file_list
      
         __stdio_open_file_list:  defw 0

      ENDIF
   
      ; construct list of closed / available FILEs
   
      SECTION data_clib
      SECTION data_stdio
  
      PUBLIC __stdio_closed_file_list
   
      __stdio_closed_file_list:   defw 0, __stdio_closed_file_list
   
      IF __clib_fopen_max > 1

		   defc __MAX_FOPEN = __clib_fopen_max
		
         ; create extra FILE structures
     
         SECTION bss_clib
         SECTION bss_stdio
      
         __stdio_file_extra:      defs (__clib_fopen_max - 1) * 15
      
         SECTION code_crt_init
      
            ld bc,__stdio_closed_file_list
            ld de,__stdio_file_extra
            ld l,__clib_fopen_max - 1
     
         loop:
      
            push hl
         
            EXTERN asm_p_forward_list_alt_push_front
            call asm_p_forward_list_alt_push_front
         
            ld de,15
            add hl,de
            ex de,hl
         
            pop hl
         
            dec l
            jr nz, loop
				
      ELSE

         defc __MAX_FOPEN = 1
				
      ENDIF   

   ENDIF

   IF (__clib_fopen_max = 0) && (1 = 0)
   
      defc __MAX_FOPEN = 0
	
      ; create empty file lists
      
      SECTION bss_clib
      SECTION bss_stdio
      
      PUBLIC __stdio_open_file_list
      __stdio_open_file_list:  defw 0
      
      SECTION data_clib
      SECTION data_stdio
      
      PUBLIC __stdio_closed_file_list
      __stdio_closed_file_list:   defw 0, __stdio_closed_file_list

   ENDIF

   IF (__clib_fopen_max < 0) && (1 = 0)

      defc __MAX_FOPEN = 0

   ENDIF

   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;; create fd table
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   
   ; __clib_open_max  = max number of open fds specified by user
   ; 1 = number of static file descriptors created
	
   PUBLIC __fcntl_fdtbl
   PUBLIC __fcntl_fdtbl_size
   
   IF 1 > 0
   
      ; create rest of fd table in data segment
      
      SECTION data_fcntl_fdtable_body
      
      EXTERN __data_fcntl_fdtable_body_head
      
      defc __fcntl_fdtbl = __data_fcntl_fdtable_body_head
      
      IF __clib_open_max > 1
      
         SECTION data_fcntl_fdtable_body
         
         defs (__clib_open_max - 1) * 2
         defc __fcntl_fdtbl_size = __clib_open_max
      
      ELSE
      
         defc __fcntl_fdtbl_size = 1
      
      ENDIF
   
   ELSE

      IF __clib_open_max > 0
   
         ; create fd table in bss segment

         SECTION bss_clib
         SECTION bss_fcntl
         
         __fcntl_fdtbl:        defs __clib_open_max * 2
      
      ELSE
      
         ; no fd table at all
         
         defc __fcntl_fdtbl = 0
      
      ENDIF
   
      defc __fcntl_fdtbl_size = __clib_open_max
   
   ENDIF
   
	PUBLIC __MAX_OPEN
	defc   __MAX_OPEN = __fcntl_fdtbl_size
	
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;; finalize stdio heap
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   
   ; __clib_stdio_heap_size  = desired stdio heap size in bytes
   ; 35  = byte size of static FDSTRUCTs
   ; 1   = number of heap allocations
   ; __i_fcntl_heap_n     = address of allocation #n on heap (0..__I_FCNTL_NUM_HEAP-1)

   IF 35 > 0
   
      ; static FDSTRUCTs have been allocated in the heap
      
      SECTION data_clib
      SECTION data_fcntl

      PUBLIC __stdio_heap
      
      __stdio_heap:            defw __stdio_block

      SECTION data_fcntl_stdio_heap_head
      
      __stdio_block:
      
         defb 0                ; no owner
         defb 0x01             ; mtx_plain
         defb 0                ; number of lock acquisitions
         defb 0xfe             ; spinlock (unlocked)
         defw 0                ; list of threads blocked on mutex
      
      IF __clib_stdio_heap_size > (35 + 14)
      
         ; expand stdio heap to desired size
         
         SECTION data_fcntl_stdio_heap_body
         
         __i_fcntl_heap_1:
          
            defw __i_fcntl_heap_2
            defw 0
            defw __i_fcntl_heap_0
            defs __clib_stdio_heap_size - 35 - 14
         
         ; terminate stdio heap
         
         SECTION data_fcntl_stdio_heap_tail
         
         __i_fcntl_heap_2:   defw 0
      
      ELSE
      
         ; terminate stdio heap
      
         SECTION data_fcntl_stdio_heap_tail
      
         __i_fcntl_heap_1:   defw 0
      
      ENDIF
      
   ELSE
   
      ; no FDSTRUCTs statically created
      
      IF __clib_stdio_heap_size > 14
      
         SECTION data_clib
         SECTION data_fcntl
         
         PUBLIC __stdio_heap
         
         __stdio_heap:         defw __stdio_block
         
         SECTION bss_clib
         SECTION bss_fcntl
         
         PUBLIC __stdio_block
         
         __stdio_block:         defs __clib_stdio_heap_size
         
         SECTION code_crt_init
         
         ld hl,__stdio_block
         ld bc,__clib_stdio_heap_size
         
         EXTERN asm_heap_init
         call asm_heap_init
      
      ENDIF

   ENDIF


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; STARTUP ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

SECTION CODE

PUBLIC __Start, __Exit

EXTERN _main




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ROM SIGNATURES ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; These bytes indicate what kind of cartridge we have.
; They must be the very first bytes in the ROM
; They could also be moved to the "create-app" part, but this provides easier debugging possibilities for now

IF (startup=1)
	
	IF (TAR__crt_autostart=1)
	
		include "startup/vgl_signature_autostart.inc"
	
	ELSE
	
		include "startup/vgl_signature_default.inc"
	
	ENDIF
	
ELSE

	IF (startup=100)
		include "startup/vgl_signature_quiz.inc"
	ENDIF

	IF (startup=101)
		include "startup/vgl_signature_sram.inc"
	ENDIF

ENDIF


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; USER PREAMBLE ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

IF __crt_include_preamble

   include "crt_preamble.asm"
   SECTION CODE

ENDIF

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PAGE ZERO ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

IF (ASMPC = 0) && (__crt_org_code = 0)

   include "../crt_page_zero_z80.inc"

ENDIF

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; CRT INIT ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;@FIXME: This is just for bare bone debugging. Provides some essential debug tools
include "startup/vgl_debug.inc"


__Start:

   include "../crt_start_di.inc"
   include "../crt_save_sp.inc"

__Restart:

;   include "../crt_init_sp.inc"
   
   ; command line
   
   IF (__crt_enable_commandline = 1) || (__crt_enable_commandline >= 3)
   
      include "../crt_cmdline_empty.inc"
   
   ENDIF

__Restart_2:

   IF __crt_enable_commandline >= 1

      push hl                  ; argv
      push bc                  ; argc

   ENDIF

   ; initialize data section

   include "../clib_init_data.inc"

   ; initialize bss section

   include "../clib_init_bss.inc"

   ; interrupt mode
   
   include "../crt_set_interrupt_mode.inc"

SECTION code_crt_init          ; user and library initialization
SECTION code_crt_main

   include "../crt_start_ei.inc"

   ; call user program
   
   call _main                  ; hl = return status

   ; run exit stack

   IF __clib_exit_stack_size > 0
   
      EXTERN asm_exit
      jp asm_exit              ; exit function jumps to __Exit
   
   ENDIF

__Exit:

   IF !((__crt_on_exit & 0x10000) && (__crt_on_exit & 0x8))
   
      ; not restarting
      
      push hl                  ; save return status
   
   ENDIF

SECTION code_crt_exit          ; user and library cleanup
SECTION code_crt_return

   ; close files
   
   include "../clib_close.inc"

   ; terminate
   
   include "../crt_exit_eidi.inc"
   include "../crt_restore_sp.inc"
   include "../crt_program_exit.inc"      

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; RUNTIME VARS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

include "../crt_jump_vectors_z80.inc"

IF (__crt_on_exit & 0x10000) && ((__crt_on_exit & 0x6) || ((__crt_on_exit & 0x8) && (__register_sp = -1)))

   SECTION BSS_UNINITIALIZED
   __sp_or_ret:  defw 0

ENDIF

include "../clib_variables.inc"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; CLIB STUBS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

include "../clib_stubs.inc"



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; compressed rom model ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



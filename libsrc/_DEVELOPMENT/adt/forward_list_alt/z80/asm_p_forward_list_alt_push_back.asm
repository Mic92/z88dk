
; ===============================================================
; Dec 2013
; ===============================================================
; 
; void p_forward_list_alt_push_back(p_forward_list_alt_t *list, void *item)
;
; Add item to the end of the list.
;
; ===============================================================

XLIB asm_p_forward_list_alt_push_back
XDEF asm_p_queue_push

LIB asm_p_forward_list_alt_insert_after

asm_p_forward_list_alt_push_back:
asm_p_queue_push:

   ; enter : bc = p_forward_list_alt_t *list
   ;         de = void *item
   ;
   ; exit  : bc = p_forward_list_alt_t *list
   ;         hl = void *item
   ;
   ; uses  : af, de, hl
   
   inc bc
   inc bc
   
   ld a,(bc)
   ld l,a
   inc bc
   ld a,(bc)
   ld h,a                      ; hl = list->tail
   
   dec bc
   dec bc
   dec bc                      ; bc = list
   
   jp asm_p_forward_list_alt_insert_after

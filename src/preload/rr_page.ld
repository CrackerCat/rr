PHDRS
{
  header PT_LOAD FILEHDR PHDRS;
  text PT_LOAD ;
  dynamic PT_DYNAMIC ;
  note PT_NOTE ;
  eh_frame 0x6474e550 ;
  replay PT_NULL;
}
SECTIONS
{
  . = SIZEOF_HEADERS;
  .eh_frame_hdr   : { *(.eh_frame_hdr) *(.eh_frame_entry .eh_frame_entry.*) } :header :eh_frame
  .eh_frame       : { KEEP (*(.eh_frame)) *(.eh_frame.*) } :header :eh_frame
  .note.gnu.build-id  : { *(.note.gnu.build-id) } :header :note
  .hash           : { *(.hash) } :header
  .gnu.hash       : { *(.gnu.hash) } :header
  .dynsym         : { *(.dynsym) } :header
  .dynstr         : { *(.dynstr) } :header
  .dynamic        : { *(.dynamic) } :header :dynamic
  .gnu.version    : { *(.gnu.version) } :header
  .gnu.version_d  : { *(.gnu.version_d) } :header
  .gnu.version_r  : { *(.gnu.version_r) } :header
  . = 0x1000;
  .text : { *(.text) } :text
  . = 0x2000;
  .replay.text : { *(.replay.text) } :replay
  /DISCARD/ : { *(.debug_* ) }
}

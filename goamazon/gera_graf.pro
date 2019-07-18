close, /all

openw, unit_tr, 'data_norio.txt',/get_lun
openw, unit_ntr, 'data_antesdorio.txt',/get_lun

openr, unitl, 'lista_fams.txt',/get_lun

row=file_lines('lista_fams.txt')


for i=0L,row-1L do begin

  arq=''
  readf, unitl, arq
  print, arq
  year=float(strmid(arq,39,4))
  month=float(strmid(arq,43,2))
  day=float(strmid(arq,45,2))
  hour=float(strmid(arq,47,2))
  minut=float(strmid(arq,49,2))
  print, year,month,day,hour,minut
 
  openr,unitf, arq,/get_lun
  row_arq=file_lines(arq)-1
  var_all_arq=fltarr(21,row_arq)
  
  lx=''
  readf, unitf, lx
  flag=0
  for j=0, row_arq-1 do begin
      
      tmp=''
      readf, unitf, tmp
      var_vec=float(strsplit(tmp,/extract))
      var_all_arq(*,j)=var_vec
      
      class=var_vec(1)
      tt_lin_pos=var_vec(7)
      tt_lin_neg=var_vec(8)
      tt_lin=tt_lin_pos+tt_lin_neg
      river=var_vec(12)
      
      ;if tt_lin gt 0 and class le 1 then begin  ;tem que ter raios ao longo do ciclo de vida
      if class le 1 then begin ;pode ter ou nao raios ao longo do ciclo de vida
       if river gt 0 then begin
        if flag eq 0 then begin ;primeira vez que entrou no rio
	   pos_tr=j ;linha que ele entrou no rio
	   flag=1
	endif
	printf, unit_tr, format='(f10.2)',tt_lin
       endif else begin
         if flag gt 0 then begin
	    goto, caifora
	 endif
       endelse
      endif else begin
        goto, caifora
      endelse
  
  endfor
  
  caifora:
  close, unitf
  free_lun, unitf
  
  if flag ne 0 then begin
     for j=pos_tr-1,0,-1 do begin
      class=var_all_arq(1,j)
      tt_lin_pos=var_all_arq(7,j)
      tt_lin_neg=var_all_arq(8,j)
      tt_lin=tt_lin_pos+tt_lin_neg
      
      ;if tt_lin gt 0 and class le 1 then begin
      if class le 1 then begin
         printf, unit_ntr, format='(f10.2)',tt_lin
      endif
     endfor
  endif

endfor


close, unitl
free_lun, unitl
close, unit_tr
free_lun, unit_tr
close, unit_ntr
free_lun, unit_ntr

end

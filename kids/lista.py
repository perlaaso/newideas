namn = input("Vaad heter du?")
for x in range(0,2):
   if x==0:
     print("Hej 0")
   if x==1:
     print(', %s.  vad gillar du att   ' % namn)
   print("ny anvendare  %s  gammal anvendare" % x)
   if x==0:
     svar=input("vad heter Elis?")
   if svar=="Elis":
     print('rätt%s ' % svar)
   
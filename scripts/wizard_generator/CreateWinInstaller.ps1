﻿< # 
 
 . S Y N O P S I S 
 
 I n s t a l l e r   g e n e r a t o r . 
 
 . D E S C R I P T I O N 
 
 T h i s   w i l l   o n l y   w o r k   w h e n   i n v o k e d   f r o m   r o o t   r e p o   d i r 
 
 B u i l d s   a l l   s u b p r o j e c t   d o c u m e n t a t i o n ,   c l e a n s   u p   b u i l d   d i r s ,   c r e a t e s   t h e   
 
 M i l o   D B   i n s t a l l e r 
 
 . P A R A M E T E R   o u t p u t I n s t a l l e r N a m e 
 
 O u t p u t   n a m e   o f   t h e   g e n e r a t e d   i n s t a l l e r . 
 
 . P A R A M E T E R   q t I f w P a t h 
 
 F u l l   p a t h   t o   Q t   I n s t a l l e r   F r a m e w o r k   e x e c u t a b l e 
 
 . E X A M P L E 
 
 C r e a t e W i n I n s t a l l e r   i n s t a l l e r . e x e   " C : \ Q t I F 3 . 0 \ b i n \ b i n a r y c r e a t o r . e x e " 
 
 . L I N K 
 
 h t t p s : / / w w w . m i l o s o l u t i o n s . c o m / 
 
 # > 
 
 
 
 #   f i r s t ,   l e t s   d e f i n e   p a r a m e t e r s 
 
 p a r a m ( 
 
   [ P a r a m e t e r ( M a n d a t o r y = $ t r u e ,   V a l u e F r o m P i p e l i n e = $ t r u e ) ] 
 
   [ s t r i n g ] $ o u t p u t I n s t a l l e r N a m e , 
 
   
 
   [ P a r a m e t e r ( M a n d a t o r y = $ t r u e ,   V a l u e F r o m P i p e l i n e = $ t r u e ) ] 
 
   [ s t r i n g ] $ q t I f w P a t h 
 
 ) 
 
 
 
 $ T e m p D i r = " . \ _ _ t e m p M i l o W i z a r d " 
 
 i f   ( T e s t - P a t h   $ T e m p D i r )   { 
 
         W r i t e - H o s t   " R e m o v i n g   f i l e s   f r o m   p r e v i o u s   r u n " 
 
         #   F o r c e   w i l l   a l s o   d e l e t e   h i d d e n   o r   r e a d - o n l y   f i l e s   a n d   d i r e c t o r i e s 
 
         R e m o v e - I t e m   - p a t h   $ T e m p D i r   - R e c u r s e   - F o r c e 
 
 } 
 
 
 
 $ C o n t e n t D i r = " $ T e m p D i r \ p a c k a g e s \ c o m . m i l o s o l u t i o n s " 
 
 
 
 #   c r e a t e   d i r e c t o r y   s t r u c t u r e   i n   t e m p o r a r y   f o l d e r .   P i p i n g   r e s u l t s   t o   
 
 #   O u t - N u l l   h i d e s   o u t p u t   o f   N e w - I t e m   c o m m a n d . 
 
 W r i t e - H o s t   " C r e a t i n g   d i r e c t o r y   s t r u c t u r e   i n   $ T e m p D i r " 
 
 N e w - I t e m   - p a t h   " $ C o n t e n t D i r \ d a t a \ p a c k a g e s "   - t y p e   d i r e c t o r y     |   O u t - N u l l 
 
 N e w - I t e m   - p a t h   " $ C o n t e n t D i r \ m e t a "   - t y p e   d i r e c t o r y     |   O u t - N u l l 
 
 N e w - I t e m   - p a t h   " $ T e m p D i r \ c o n f i g "   - t y p e   d i r e c t o r y     |   O u t - N u l l 
 
 
 
 #   - C o n t a i n e r   p r e s e r v e s   d i r e c t o r y   s t r u c t u r e 
 
 W r i t e - H o s t   " C o p y i n g   f i l e s   i n t o   $ T e m p D i r " 
 
 G e t - C h i l d I t e m   - P a t h   " . \ s c r i p t s \ w i z a r d _ g e n e r a t o r \ c o n f i g "   |   ` 
 
         C o p y - I t e m   - D e s t i n a t i o n   " $ T e m p D i r \ c o n f i g "   - R e c u r s e   - C o n t a i n e r 
 
 G e t - C h i l d I t e m   - P a t h   " . \ p a c k a g e s "   |   ` 
 
         C o p y - I t e m   - D e s t i n a t i o n   " $ C o n t e n t D i r \ d a t a \ p a c k a g e s "   - R e c u r s e   - C o n t a i n e r 
 
 G e t - C h i l d I t e m   - P a t h   " . \ s c r i p t s \ w i z a r d _ g e n e r a t o r \ m e t a "   |   ` 
 
         C o p y - I t e m   - D e s t i n a t i o n   " $ C o n t e n t D i r \ m e t a "   - R e c u r s e   - C o n t a i n e r 
 
 C o p y - I t e m   " w i z a r d . j s o n "   - D e s t i n a t i o n   " $ C o n t e n t D i r \ d a t a \ w i z a r d . j s o n " 
 
 C o p y - I t e m   " . \ i c o n . p n g "   - D e s t i n a t i o n   " $ C o n t e n t D i r \ d a t a \ i c o n . p n g " 
 
 #   c o p i e s   r e i n s t a l l   s c r i p t 
 
 #   r e i n s t a l l   m e t h o d   d e s c r i b e d   h e r e :   
 
 #   h t t p s : / / s t a c k o v e r f l o w . c o m / q u e s t i o n s / 4 6 4 5 5 3 6 0 / w o r k a r o u n d - f o r - q t - i n s t a l l e r - f r a m e w o r k - n o t - o v e r w r i t i n g - e x i s t i n g - i n s t a l l a t i o n / 4 6 6 1 4 1 0 7 # 4 6 6 1 4 1 0 7 
 
 C o p y - I t e m   " . \ s c r i p t s \ w i z a r d _ g e n e r a t o r \ a u t o _ u n i n s t a l l . q s "   ` 
 
         - D e s t i n a t i o n   " $ C o n t e n t D i r \ \ d a t a \ a u t o _ u n i n s t a l l . q s " 
 
 
 
 W r i t e - H o s t   " G e n e r a t i n g   i n s t a l l e r " 
 
 &   $ q t I f w P a t h   - v   - c   " $ T e m p D i r \ c o n f i g \ c o n f i g . w i n d o w s . x m l "   - p   " $ T e m p D i r \ p a c k a g e s "   $ o u t p u t I n s t a l l e r N a m e     
 
  W r i t e - H o s t   "Signing  i n s t a l l e r " 

#& "C:\Program Files (x86)\Windows Kits\10\App Certification Kit\signtool.exe" sign /t "http://timestamp.digicert.com" /p $certPassword /f %SCRIPT_PATH%\miniPCR_Windows_certificate.pfx "%SETUP_PATH%"
 
 R e m o v e - I t e m   - p a t h   $ T e m p D i r   - R e c u r s e   - F o r c e 
 
 W r i t e - H o s t   " D o n e .   I n s t a l l e r   c r e a t e d   h e r e :   $ o u t p u t I n s t a l l e r N a m e . " 
 
 

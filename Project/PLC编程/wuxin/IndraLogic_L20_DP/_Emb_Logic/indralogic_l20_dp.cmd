replace query 
file open "C:\Users\wuxin\IndraLogic_L20_DP\_Emb_Logic\IndraLogic_L20_DP.pro"
query off ok
gateway local
device name "Tcp/Ip (Level 2 Route)"
device parameter 1001 192.168.1.20
device parameter 1000 1200
device parameter 100 No
device parameter 1020 0
device instance Local_
query off ok
query on

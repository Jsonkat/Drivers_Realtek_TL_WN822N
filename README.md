

# [+]  Found This Driver By Random Googling Hope It Helps  [+]



# [+]  Tested On Kali And Ubuntu ; Model <:> TP-LINK TL - WN822N (V5)




# Installation...

```shell
$ git clone https://github.com/Jsonkat/Drivers_Realtek_TL_WN822N.git
```
```shell
$ cd Drivers_Realtek_TL_WN822N
```
```shell
$ chmod +x install_driver_wn822n.sh
```
```shell
$ ./install_driver_wn822n.sh
```




# Original Repo

https://github.com/Mange/rtl8192eu-linux-driver






# If Auto Install Fails Install It Manually...

1.-------------------------------------------------------------------
```shell
$ sudo apt-get install git linux-headers-generic build-essential dkms;
```  

2. ------------------------------------------------------------------
```shell
$ git clone https://github.com/Mange/rtl8192eu-linux-driver;
```

3.-------------------------------------------------------------------
```shell
$ cd rtl8192eu-linux-driver; 
```

4.-------------------------------------------------------------------     
```shell
$ sudo dkms add .;
``` 

5.-------------------------------------------------------------------
```shell
$ sudo dkms install rtl8192eu/1.0;
```

6.-------------------------------------------------------------------
```shell
$ echo "blacklist rtl8xxxu" | sudo tee /etc/modprobe.d/rtl8xxxu.conf;
```

7.-------------------------------------------------------------------
```shell
$ echo -e "8192eu\n\nloop" | sudo tee /etc/modules;
```

8.-------------------------------------------------------------------------------------------     
```shell
$ echo "options 8192eu rtw_power_mgnt=0 rtw_enusbss=0" | sudo tee /etc/modprobe.d/8192eu.conf;
```

9.--------------------------------------------------
```shell
$ sudo update-grub; sudo update-initramfs -u;
```

10.-------------------------------------------------
```shell
$ systemctl reboot -i;
```
   Finally reboot the system...


11.-------------------------------------------------
```shell
$ sudo lshw -c network;
```
       You should see the line ```driver=8192eu```
    
    
  x---------------------------------------------------x 
    

# Uninstall...

If you wish to uninstall the driver at a later point, use
 
 ```shell
 $ sudo dkms uninstall rtl8192eu/1.0_.
 ```

To completely remove the driver from DKMS use
 
 ```shell
 $ sudo dkms remove rtl8192eu/1.0 --all_.
 ```




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

     ```shell
1.   $ sudo apt-get install git linux-headers-generic build-essential dkms;
     ```
     
     ```shell
2.   $ git clone https://github.com/Mange/rtl8192eu-linux-driver;
     ```
     
     ```shell
      $ cd rtl8192eu-linux-driver; 
      ```shell
      
     ```shell
3.   $ sudo dkms add .;
     ``` 
 
     ```shell
4.   $ sudo dkms install rtl8192eu/1.0;
     ```

     ```shell
5.   $ echo "blacklist rtl8xxxu" | sudo tee /etc/modprobe.d/rtl8xxxu.conf;
     ```
    
     ```shell
6.   $ echo -e "8192eu\n\nloop" | sudo tee /etc/modules;
     ```
     
     ```shell
7.   $ echo "options 8192eu rtw_power_mgnt=0 rtw_enusbss=0" | sudo tee /etc/modprobe.d/8192eu.conf;
     ```
     
     ```shell
8.   $ sudo update-grub; sudo update-initramfs -u;
     ```

     ```shell
9.   $ systemctl reboot -i;
     ```
      ```reboot the system```

     ```shell
10.  $ sudo lshw -c network;
     ```
       You should see the line ```driver=8192eu```
    
    
    
    

# Uninstall...

If you wish to uninstall the driver at a later point, use
 
 ```shell
 $ sudo dkms uninstall rtl8192eu/1.0_.
 ```

To completely remove the driver from DKMS use
 
 ```shell
 $ sudo dkms remove rtl8192eu/1.0 --all_.
 ```


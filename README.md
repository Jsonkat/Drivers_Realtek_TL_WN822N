

# [+]  I Found This Driver By Random Googling Hope It Helps  [+]



# [+]  Tested On Kali And Ubuntu ; Model <:> TP-LINK TL - WN822N (V5)




# Installation...

git clone https://github.com/Jsonkat/Drivers_Realtek_WN822N.git

chmod +x install_driver_wn822n.sh

./install_driver_wn822n.sh





# Original Repo

https://github.com/Mange/rtl8192eu-linux-driver






# If Auto Install Fails Install It Manually...

1. Install DKMS and other required tools

    * for normal Linux systems

    ```shell
    $ sudo apt-get install git linux-headers-generic build-essential dkms;
    ```

2. Clone this repository and change your directory to cloned path.

    ```shell
    $ git clone https://github.com/Mange/rtl8192eu-linux-driver;
    ```
    ```shell
    $ cd rtl8192eu-linux-driver;
    ```

3. Add the driver to DKMS. This will copy the source to a system directory so
that it can used to rebuild the module on kernel upgrades.

    ```shell
    $ sudo dkms add .;
    ```

4. Build and install the driver.

    ```shell
    $ sudo dkms install rtl8192eu/1.0;
    ```

5. Distributions based on Debian & Ubuntu have RTL8XXXU driver present & running in kernelspace. To use our RTL8192EU driver, we need to blacklist RTL8XXXU.

    ```shell
    $ echo "blacklist rtl8xxxu" | sudo tee /etc/modprobe.d/rtl8xxxu.conf;
    ```

6. Force RTL8192EU Driver to be active from boot.
    ```shell
    $ echo -e "8192eu\n\nloop" | sudo tee /etc/modules;
    ```

7. Newer versions of Ubuntu has weird plugging/replugging issue (Check #94). This includes weird idling issues, To fix this:

    ```shell
    $ echo "options 8192eu rtw_power_mgnt=0 rtw_enusbss=0" | sudo tee /etc/modprobe.d/8192eu.conf;
    ```

8. Update changes to Grub & initramfs

    ```shell
    $ sudo update-grub; sudo update-initramfs -u;
    ```

9. Reboot system to load new changes from newly generated initramfs.

    ```shell
    $ systemctl reboot -i;
    ```

10. Check that your kernel has loaded the right module:
 
    ```shell
    $ sudo lshw -c network;
    ```
     
    You should see the line ```driver=8192eu```
    
    
    
    

# Uninstall...

If you wish to uninstall the driver at a later point, use
 $ sudo dkms uninstall rtl8192eu/1.0_.

To completely remove the driver from DKMS use
 $ sudo dkms remove rtl8192eu/1.0 --all_.



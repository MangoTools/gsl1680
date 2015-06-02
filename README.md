gsl1680
=======

An user-space driver for Silead's GSL1680 capacitive touch screen driver chip.

This is a fork from https://github.com/rastersoft/gsl1680

It was made in order to use this screen on an Odroid-C1:

http://www.buydisplay.com/default/5-inch-multi-touch-screen-panel-with-controller-gsl1680

For more information on the driver itself, please use the original deposit.

After running "make" and "sudo make install"

## How to use the driver ##

This is a little program that runs in user space, but makes use of the UFILE driver to link itself to the INPUT subsystem, allowing it to work like any other input driver. So it is mandatory to have a kernel with UFILE support (Device Drivers -> Input devices support -> Miscellaneous devices -> User level driver support).

Also, since the GSL1680 needs a firmware code to be uploaded before being able to detect touchs, the driver needs it in a file.

firmware for the '5 inch Multi Touch Screen Panel with Controller GSL1680' is provided as the text file named 'touchscreen.fw'

To launch the driver, just use:

	./driver [-res XxY] [-gpio PATH] [-invert_x] [-invert_y] [-new_scroll] DEVICE touchscreen.fw

DEVICE is the I2C bus where the driver chip is installed (in the case of the Odroid-C1, it is /dev/i2c-1 or /dev/i2c-2).

**-res** allows to specify the screen resolution. For this touch screen, res can be '480x272' or '800x480' depending on the model.

**-gpio** allows to specify the path to the GPIO device that enables or disables the chip. On Odroid-C1, if pin 11 is used, use -gpio /sys/class/gpio/gpio88/value. 
Pin must be exported as output. You must do this before: 'sudo gpio export 88 output'

**-invert_x** and **-invert_y** allows to invert the horizontal or vertical coordinates, in case that, when you touch the left part of the screen, the cursor moves to the right, and so on.

**-new_scroll** allows to use a single finger to do scrolling.

Full command line I put in my /etc/rc.local file in order to have the driver lunched at startup

gpio export 88 output

/bin/gslx680 -res 480x272 -gpio /sys/class/gpio/gpio88/value /dev/ic2-1 /etc/gslx680/touchscreen.fw

## More info about this chip ##

There's a page with technical info about this chip at http://linux-sunxi.org/GSL1680

## Contacting the author ##

Adrien Bosc
Mango Tools
http://mango.tools
adrien@mango.tools

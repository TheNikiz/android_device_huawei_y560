#! /system/bin/sh
LOG_TAG="factory"
LOG_NAME="${0}:"
logi ()
{
  /system/bin/log -t $LOG_TAG -p i "$LOG_NAME $@"
}
logi "open factory"
factoryop=`getprop sys.config.factoryop`
logi "getprop"
logi "$factoryop" 
#open main mic
case "$factoryop" in
    "omainmic")
	    logi "open main mic"
        tinymix 'LOOPBACK Mode' 'ENABLE'
        tinymix 'MICBIAS CAPLESS Switch' '1'
        tinymix 'DEC1 MUX' 'ADC1'
        tinymix 'IIR1 INP1 MUX' 'DEC1'
        tinymix 'RX1 MIX1 INP1' 'IIR1'
        tinymix 'RX2 MIX1 INP1' 'IIR1'
        tinymix 'RDAC2 MUX' 'RX2'
        tinymix 'HPHL' 'Switch'
        tinymix 'HPHR' 'Switch'
        tinymix 'Loopback MCLK' 'ENABLE'
        tinymix 'IIR1 INP1 Volume' '90' 
    ;;
    "cmainmic")
		logi "close main mic"
		tinymix 'MICBIAS CAPLESS Switch' '0'
        tinymix 'DEC1 MUX' 'ZERO'
        tinymix 'IIR1 INP1 MUX' 'ZERO'
        tinymix 'RX1 MIX1 INP1' 'ZERO'
        tinymix 'RX2 MIX1 INP1' 'ZERO'
        tinymix 'RDAC2 MUX' 'ZERO'
        tinymix 'HPHL' 'ZERO'
        tinymix 'HPHR' 'ZERO'
        tinymix 'Loopback MCLK' 'DISABLE'
		tinymix 'LOOPBACK Mode' 'DISABLE'
        tinymix 'IIR1 INP1 Volume' '84'
    ;;
	"oassmic")
	    logi "open assist MIC"
	    tinymix 'LOOPBACK Mode' 'ENABLE'
		tinymix 'MICBIAS CAPLESS Switch' '1'
        tinymix 'DEC1 MUX' 'ADC2'
        tinymix 'ADC2 MUX' 'INP3'
        tinymix 'IIR1 INP1 MUX' 'DEC1'
        tinymix 'RX1 MIX1 INP1' 'IIR1'
        tinymix 'RX2 MIX1 INP1' 'IIR1'
        tinymix 'RDAC2 MUX' 'RX2'
        tinymix 'HPHL' 'Switch'
        tinymix 'HPHR' 'Switch'
        tinymix 'Loopback MCLK' 'ENABLE'
        tinymix 'IIR1 INP1 Volume' '90'
	;;
	"cassmic")
	    logi "Close assist MIC"
	    tinymix 'MICBIAS CAPLESS Switch' '0'
        tinymix 'DEC1 MUX' 'ZERO'
        tinymix 'ADC2 MUX' 'ZERO'
        tinymix 'IIR1 INP1 MUX' 'ZERO'
        tinymix 'RX1 MIX1 INP1' 'ZERO'
        tinymix 'RX2 MIX1 INP1' 'ZERO'
        tinymix 'RDAC2 MUX' 'ZERO'
        tinymix 'HPHL' 'ZERO'
        tinymix 'HPHR' 'ZERO'
        tinymix 'Loopback MCLK' 'DISABLE'	
		tinymix 'LOOPBACK Mode' 'DISABLE'
        tinymix 'IIR1 INP1 Volume' '84' 
	;;
	"oearmic")
	    logi "open HEADSET MIC"
		tinymix 'LOOPBACK Mode' 'ENABLE'
        tinymix 'MICBIAS CAPLESS Switch' '1'
        tinymix 'DEC1 MUX' 'ADC2'
        tinymix 'ADC2 MUX' 'INP2'
        tinymix 'IIR1 INP1 MUX' 'DEC1'
        tinymix 'RX1 MIX1 INP1' 'IIR1'
        tinymix 'RX2 MIX1 INP1' 'IIR1'
        tinymix 'RDAC2 MUX' 'RX2'
        tinymix 'HPHL' 'Switch'
        tinymix 'HPHR' 'Switch'
        tinymix 'Loopback MCLK' 'ENABLE'
        tinymix 'IIR1 INP1 Volume' '100'
	;;
	"cearmic")
	    logi "close HEADSET MIC"
		tinymix 'MICBIAS CAPLESS Switch' '0'
        tinymix 'DEC1 MUX' 'ZERO'
        tinymix 'ADC2 MUX' 'ZERO'
        tinymix 'IIR1 INP1 MUX' 'ZERO'
        tinymix 'RX1 MIX1 INP1' 'ZERO'
        tinymix 'RX2 MIX1 INP1' 'ZERO'
        tinymix 'RDAC2 MUX' 'ZERO'
        tinymix 'HPHL' 'ZERO'
        tinymix 'HPHR' 'ZERO'
        tinymix 'Loopback MCLK' 'DISABLE'
		tinymix 'LOOPBACK Mode' 'DISABLE'
        tinymix 'IIR1 INP1 Volume' '84'
	;;
	"openredled")
	    logi "open red led"
		echo 255 > /sys/class/leds/red/brightness
		echo 0 > /sys/class/leds/green/brightness
		echo 0 > /sys/class/leds/blue/brightness
		
	;;
	"opengreenled")
		logi "open green led"
		echo 0 > /sys/class/leds/red/brightness
		echo 255 > /sys/class/leds/green/brightness
		echo 0 > /sys/class/leds/blue/brightness
	;;
	"openblueled")
		logi "open blue led"
		echo 0 > /sys/class/leds/red/brightness
		echo 0 > /sys/class/leds/green/brightness
		echo 255 > /sys/class/leds/blue/brightness
	;;
esac

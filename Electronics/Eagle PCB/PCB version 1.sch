<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="9.6.2">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="2" name="Route2" color="16" fill="3" visible="no" active="no"/>
<layer number="3" name="Route3" color="17" fill="3" visible="no" active="no"/>
<layer number="4" name="Route4" color="18" fill="4" visible="no" active="no"/>
<layer number="5" name="Route5" color="19" fill="4" visible="no" active="no"/>
<layer number="6" name="Route6" color="25" fill="8" visible="no" active="no"/>
<layer number="7" name="Route7" color="26" fill="8" visible="no" active="no"/>
<layer number="8" name="Route8" color="27" fill="2" visible="no" active="no"/>
<layer number="9" name="Route9" color="28" fill="2" visible="no" active="no"/>
<layer number="10" name="Route10" color="29" fill="7" visible="no" active="no"/>
<layer number="11" name="Route11" color="30" fill="7" visible="no" active="no"/>
<layer number="12" name="Route12" color="20" fill="5" visible="no" active="no"/>
<layer number="13" name="Route13" color="21" fill="5" visible="no" active="no"/>
<layer number="14" name="Route14" color="22" fill="6" visible="no" active="no"/>
<layer number="15" name="Route15" color="23" fill="6" visible="no" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="24" fill="1" visible="no" active="no"/>
<layer number="21" name="tPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="22" name="bPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="23" name="tOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="24" name="bOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="25" name="tNames" color="7" fill="1" visible="no" active="no"/>
<layer number="26" name="bNames" color="7" fill="1" visible="no" active="no"/>
<layer number="27" name="tValues" color="7" fill="1" visible="no" active="no"/>
<layer number="28" name="bValues" color="7" fill="1" visible="no" active="no"/>
<layer number="29" name="tStop" color="7" fill="3" visible="no" active="no"/>
<layer number="30" name="bStop" color="7" fill="6" visible="no" active="no"/>
<layer number="31" name="tCream" color="7" fill="4" visible="no" active="no"/>
<layer number="32" name="bCream" color="7" fill="5" visible="no" active="no"/>
<layer number="33" name="tFinish" color="6" fill="3" visible="no" active="no"/>
<layer number="34" name="bFinish" color="6" fill="6" visible="no" active="no"/>
<layer number="35" name="tGlue" color="7" fill="4" visible="no" active="no"/>
<layer number="36" name="bGlue" color="7" fill="5" visible="no" active="no"/>
<layer number="37" name="tTest" color="7" fill="1" visible="no" active="no"/>
<layer number="38" name="bTest" color="7" fill="1" visible="no" active="no"/>
<layer number="39" name="tKeepout" color="4" fill="11" visible="no" active="no"/>
<layer number="40" name="bKeepout" color="1" fill="11" visible="no" active="no"/>
<layer number="41" name="tRestrict" color="4" fill="10" visible="no" active="no"/>
<layer number="42" name="bRestrict" color="1" fill="10" visible="no" active="no"/>
<layer number="43" name="vRestrict" color="2" fill="10" visible="no" active="no"/>
<layer number="44" name="Drills" color="7" fill="1" visible="no" active="no"/>
<layer number="45" name="Holes" color="7" fill="1" visible="no" active="no"/>
<layer number="46" name="Milling" color="3" fill="1" visible="no" active="no"/>
<layer number="47" name="Measures" color="7" fill="1" visible="no" active="no"/>
<layer number="48" name="Document" color="7" fill="1" visible="no" active="no"/>
<layer number="49" name="Reference" color="7" fill="1" visible="no" active="no"/>
<layer number="51" name="tDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="88" name="SimResults" color="9" fill="1" visible="yes" active="yes"/>
<layer number="89" name="SimProbes" color="9" fill="1" visible="yes" active="yes"/>
<layer number="90" name="Modules" color="5" fill="1" visible="yes" active="yes"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="no" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
<layer number="99" name="SpiceOrder" color="7" fill="1" visible="yes" active="yes"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="RHT03_DHT-22_AM2302">
<description>&lt;h1&gt;RHT03 / DHT-22 / AM2302 library&lt;/h1&gt;
&lt;p&gt;
Library with devices (schematic symbol and packages) for the RHT03 / DHT-22 / AM2302 digital relative humidity and tempearture sensor.&lt;br /&gt;
Warning: Package does not include tKeepout areas so that the part may optionally be placed on a riser with components underneath.  Please keep the package outline and bent-pin space in mind.
&lt;/p&gt;</description>
<packages>
<package name="RHT03_DHT-22">
<description>&lt;h1&gt;RHT03 / DHT-22&lt;/h1&gt;
&lt;p&gt;
Package for the RHT03 / DHT-22 relative humidity and temperature sensor.
&lt;/p&gt;</description>
<pad name="VDD" x="-3.81" y="0" drill="0.8" shape="octagon"/>
<pad name="DATA" x="-1.27" y="0" drill="0.8"/>
<pad name="NULL" x="1.27" y="0" drill="0.8"/>
<pad name="GND" x="3.81" y="0" drill="0.8"/>
<wire x1="-7.55" y1="2.5" x2="7.55" y2="2.5" width="0.127" layer="21"/>
<wire x1="-7.55" y1="-5.2" x2="7.55" y2="-5.2" width="0.127" layer="21"/>
<wire x1="-7.55" y1="2.5" x2="-7.55" y2="0.8" width="0.127" layer="21"/>
<wire x1="-7.55" y1="0.8" x2="-7.55" y2="-5.2" width="0.127" layer="21"/>
<wire x1="7.55" y1="2.5" x2="7.55" y2="0.8" width="0.127" layer="21"/>
<wire x1="7.55" y1="0.8" x2="7.55" y2="-5.2" width="0.127" layer="21"/>
<wire x1="-7.55" y1="0.8" x2="7.55" y2="0.8" width="0.127" layer="21"/>
<text x="-6" y="-4.5" size="1.27" layer="21" font="vector">&gt;NAME</text>
<text x="-6" y="-2.5" size="1.27" layer="21" font="vector">&gt;VALUE</text>
</package>
<package name="AM2302">
<description>&lt;h1&gt;AM2302&lt;/h1&gt;
&lt;p&gt;
Package for the AM2302 wired variant of the RHT03/DHT-22 relative humidity and temperature sensor.
&lt;/p&gt;</description>
<pad name="VDD" x="-3.81" y="0" drill="0.8" shape="octagon"/>
<pad name="DATA" x="-1.27" y="0" drill="0.8"/>
<pad name="NULL" x="1.27" y="0" drill="0.8"/>
<pad name="GND" x="3.81" y="0" drill="0.8"/>
<text x="-5.08" y="-2.667" size="1.27" layer="21" font="vector">&gt;NAME</text>
<wire x1="-5.08" y1="-0.635" x2="-4.445" y2="-1.27" width="0.127" layer="21"/>
<wire x1="-4.445" y1="-1.27" x2="5.08" y2="-1.27" width="0.127" layer="21"/>
<wire x1="5.08" y1="-1.27" x2="5.08" y2="1.27" width="0.127" layer="21"/>
<wire x1="5.08" y1="1.27" x2="-5.08" y2="1.27" width="0.127" layer="21"/>
<wire x1="-5.08" y1="1.27" x2="-5.08" y2="-0.635" width="0.127" layer="21"/>
<text x="-5.08" y="1.397" size="1.27" layer="21">&gt;VALUE</text>
</package>
<package name="RHT03_DHT-22/RA">
<description>&lt;h1&gt;RHT03 / DHT-22 - RIGHT ANGLE&lt;/h1&gt;
&lt;p&gt;
Right angle package for the RHT03 / DHT-22 relative humidity and temperature sensor.
&lt;/p&gt;</description>
<pad name="VDD" x="-3.81" y="0" drill="0.8" shape="octagon"/>
<pad name="DATA" x="-1.27" y="0" drill="0.8"/>
<pad name="NULL" x="1.27" y="0" drill="0.8"/>
<pad name="GND" x="3.81" y="0" drill="0.8"/>
<wire x1="-7.55" y1="2.5" x2="7.55" y2="2.5" width="0.127" layer="21"/>
<text x="-5.08" y="5.08" size="1.27" layer="21" font="vector" rot="R90">&gt;NAME</text>
<wire x1="-7.55" y1="2.5" x2="-7.55" y2="22.5" width="0.127" layer="21"/>
<wire x1="7.55" y1="2.5" x2="7.55" y2="22.5" width="0.127" layer="21"/>
<wire x1="-7.55" y1="22.5" x2="7.55" y2="22.5" width="0.127" layer="21"/>
<wire x1="-5.25" y1="27.1" x2="5.25" y2="27.1" width="0.127" layer="21"/>
<wire x1="7.55" y1="22.5" x2="5.25" y2="27.1" width="0.127" layer="21"/>
<wire x1="-7.55" y1="22.5" x2="-5.25" y2="27.1" width="0.127" layer="21"/>
<hole x="0" y="24.5" drill="3.25"/>
<wire x1="-3.81" y1="1.27" x2="-3.81" y2="2.54" width="0.127" layer="21"/>
<wire x1="-1.27" y1="1.27" x2="-1.27" y2="2.54" width="0.127" layer="21"/>
<wire x1="1.27" y1="1.27" x2="1.27" y2="2.54" width="0.127" layer="21"/>
<wire x1="3.81" y1="1.27" x2="3.81" y2="2.54" width="0.127" layer="21"/>
<text x="0" y="12.5" size="1.27" layer="21" font="vector" rot="R90" align="center">&gt;VALUE</text>
</package>
</packages>
<symbols>
<symbol name="RHT03">
<description>&lt;h1&gt;RHT03 / DHT-22 / AM2302&lt;/h1&gt;
&lt;p&gt;
Symbol for the RHT03 / DHT-22 / AM2302 relative humidity and temperature sensor.
&lt;/p&gt;</description>
<wire x1="-5.08" y1="10.16" x2="-5.08" y2="-10.16" width="0.254" layer="94"/>
<wire x1="-5.08" y1="-10.16" x2="5.08" y2="-10.16" width="0.254" layer="94"/>
<wire x1="5.08" y1="-10.16" x2="5.08" y2="10.16" width="0.254" layer="94"/>
<wire x1="5.08" y1="10.16" x2="-5.08" y2="10.16" width="0.254" layer="94"/>
<pin name="VDD" x="-10.16" y="7.62" length="middle" direction="pwr"/>
<pin name="DATA" x="-10.16" y="2.54" length="middle"/>
<pin name="NULL" x="-10.16" y="-2.54" visible="pad" length="middle" direction="nc"/>
<pin name="GND" x="-10.16" y="-7.62" length="middle" direction="pwr"/>
<text x="-5.08" y="11.43" size="1.27" layer="94">&gt;NAME</text>
<text x="-5.08" y="-12.7" size="1.27" layer="94">&gt;VALUE</text>
</symbol>
</symbols>
<devicesets>
<deviceset name="RHT03_DHT-22_AM2302" prefix="U" uservalue="yes">
<description>&lt;h1&gt;RHT03 / DHT-22 / AM2302&lt;/h1&gt;
&lt;p&gt;
Packages and symbol for the RHT03 / DHT-22 relative humidity and temperature sensor.&lt;br /&gt;
Note: The AM2302 is a wired version of the DHT-22 which typically requires less clearance and is thus provided as a separate package.
&lt;/p&gt;</description>
<gates>
<gate name="G$1" symbol="RHT03" x="0" y="0"/>
</gates>
<devices>
<device name="" package="RHT03_DHT-22">
<connects>
<connect gate="G$1" pin="DATA" pad="DATA"/>
<connect gate="G$1" pin="GND" pad="GND"/>
<connect gate="G$1" pin="NULL" pad="NULL"/>
<connect gate="G$1" pin="VDD" pad="VDD"/>
</connects>
<technologies>
<technology name="">
<attribute name="PROD_ID" value="SEN-10167"/>
</technology>
</technologies>
</device>
<device name="WIRED" package="AM2302">
<connects>
<connect gate="G$1" pin="DATA" pad="DATA"/>
<connect gate="G$1" pin="GND" pad="GND"/>
<connect gate="G$1" pin="NULL" pad="NULL"/>
<connect gate="G$1" pin="VDD" pad="VDD"/>
</connects>
<technologies>
<technology name="">
<attribute name="PROD_ID" value="SEN-10167"/>
</technology>
</technologies>
</device>
<device name="RA" package="RHT03_DHT-22/RA">
<connects>
<connect gate="G$1" pin="DATA" pad="DATA"/>
<connect gate="G$1" pin="GND" pad="GND"/>
<connect gate="G$1" pin="NULL" pad="NULL"/>
<connect gate="G$1" pin="VDD" pad="VDD"/>
</connects>
<technologies>
<technology name="">
<attribute name="PROD_ID" value="SEN-10167"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="nodemcu_esp8266">
<packages>
<package name="NODEMCU_ESP8266">
<pad name="VIN" x="11.43" y="19.05" drill="0.8" shape="long"/>
<pad name="GND@4" x="11.43" y="16.51" drill="0.8" shape="long"/>
<pad name="RST" x="11.43" y="13.97" drill="0.8" shape="long"/>
<pad name="EN" x="11.43" y="11.43" drill="0.8" shape="long"/>
<pad name="3V3@3" x="11.43" y="8.89" drill="0.8" shape="long"/>
<pad name="GND@3" x="11.43" y="6.35" drill="0.8" shape="long"/>
<pad name="CLK" x="11.43" y="3.81" drill="0.8" shape="long"/>
<pad name="SDO" x="11.43" y="1.27" drill="0.8" shape="long"/>
<pad name="CMD" x="11.43" y="-1.27" drill="0.8" shape="long"/>
<pad name="SD1" x="11.43" y="-3.81" drill="0.8" shape="long"/>
<pad name="SD2" x="11.43" y="-6.35" drill="0.8" shape="long"/>
<pad name="SD3" x="11.43" y="-8.89" drill="0.8" shape="long"/>
<pad name="RSV1" x="11.43" y="-11.43" drill="0.8" shape="long"/>
<pad name="RSV2" x="11.43" y="-13.97" drill="0.8" shape="long"/>
<pad name="A0" x="11.43" y="-16.51" drill="0.8" shape="long"/>
<pad name="3V3@1" x="-11.43" y="19.05" drill="0.8" shape="long"/>
<pad name="GND@1" x="-11.43" y="16.51" drill="0.8" shape="long"/>
<pad name="TX" x="-11.43" y="13.97" drill="0.8" shape="long"/>
<pad name="RX" x="-11.43" y="11.43" drill="0.8" shape="long"/>
<pad name="D8" x="-11.43" y="8.89" drill="0.8" shape="long"/>
<pad name="D7" x="-11.43" y="6.35" drill="0.8" shape="long"/>
<pad name="D6" x="-11.43" y="3.81" drill="0.8" shape="long"/>
<pad name="D5" x="-11.43" y="1.27" drill="0.8" shape="long"/>
<pad name="GND@2" x="-11.43" y="-1.27" drill="0.8" shape="long"/>
<pad name="3V3@2" x="-11.43" y="-3.81" drill="0.8" shape="long"/>
<pad name="D4" x="-11.43" y="-6.35" drill="0.8" shape="long"/>
<pad name="D3" x="-11.43" y="-8.89" drill="0.8" shape="long"/>
<pad name="D2" x="-11.43" y="-11.43" drill="0.8" shape="long"/>
<pad name="D1" x="-11.43" y="-13.97" drill="0.8" shape="long"/>
<pad name="D0" x="-11.43" y="-16.51" drill="0.8" shape="long"/>
<wire x1="13.97" y1="24.13" x2="13.97" y2="-21.59" width="0.127" layer="21"/>
<wire x1="11.43" y1="-24.13" x2="6.35" y2="-24.13" width="0.127" layer="21"/>
<wire x1="-6.35" y1="-24.13" x2="-11.43" y2="-24.13" width="0.127" layer="21"/>
<wire x1="-13.97" y1="-21.59" x2="-13.97" y2="24.13" width="0.127" layer="21"/>
<wire x1="-11.43" y1="26.67" x2="11.43" y2="26.67" width="0.127" layer="21"/>
<hole x="10.16" y="22.86" drill="3"/>
<hole x="10.16" y="-20.32" drill="3"/>
<hole x="-10.16" y="-20.32" drill="3"/>
<hole x="-10.16" y="22.86" drill="3"/>
<wire x1="11.43" y1="26.67" x2="13.97" y2="24.13" width="0.127" layer="21" curve="-90"/>
<wire x1="13.97" y1="-21.59" x2="11.43" y2="-24.13" width="0.127" layer="21" curve="-90"/>
<wire x1="-11.43" y1="26.67" x2="-13.97" y2="24.13" width="0.127" layer="21" curve="90"/>
<wire x1="-11.43" y1="-24.13" x2="-13.97" y2="-21.59" width="0.127" layer="21" curve="-90"/>
<pad name="P$31" x="10.16" y="22.86" drill="3" rot="R270"/>
<pad name="P$32" x="-10.16" y="22.86" drill="3" rot="R270"/>
<pad name="P$33" x="-10.16" y="-20.32" drill="3" rot="R270"/>
<pad name="P$34" x="10.16" y="-20.32" drill="3" rot="R270"/>
<rectangle x1="7.3025" y1="-7.9375" x2="7.9375" y2="-6.6675" layer="21" rot="R270"/>
<rectangle x1="7.3025" y1="-9.2075" x2="7.9375" y2="-7.9375" layer="21" rot="R270"/>
<rectangle x1="7.3025" y1="-10.4775" x2="7.9375" y2="-9.2075" layer="21" rot="R270"/>
<rectangle x1="7.3025" y1="-11.7475" x2="7.9375" y2="-10.4775" layer="21" rot="R270"/>
<rectangle x1="7.3025" y1="-13.0175" x2="7.9375" y2="-11.7475" layer="21" rot="R270"/>
<rectangle x1="7.3025" y1="-14.2875" x2="7.9375" y2="-13.0175" layer="21" rot="R270"/>
<rectangle x1="7.3025" y1="-15.5575" x2="7.9375" y2="-14.2875" layer="21" rot="R270"/>
<rectangle x1="7.3025" y1="-16.8275" x2="7.9375" y2="-15.5575" layer="21" rot="R270"/>
<rectangle x1="7.3025" y1="-18.0975" x2="7.9375" y2="-16.8275" layer="21" rot="R270"/>
<rectangle x1="5.08" y1="-5.715" x2="5.715" y2="-4.445" layer="21"/>
<rectangle x1="3.81" y1="-5.715" x2="4.445" y2="-4.445" layer="21"/>
<rectangle x1="2.54" y1="-5.715" x2="3.175" y2="-4.445" layer="21"/>
<rectangle x1="1.27" y1="-5.715" x2="1.905" y2="-4.445" layer="21"/>
<rectangle x1="0" y1="-5.715" x2="0.635" y2="-4.445" layer="21"/>
<rectangle x1="-1.27" y1="-5.715" x2="-0.635" y2="-4.445" layer="21"/>
<rectangle x1="-2.54" y1="-5.715" x2="-1.905" y2="-4.445" layer="21"/>
<rectangle x1="-3.81" y1="-5.715" x2="-3.175" y2="-4.445" layer="21"/>
<rectangle x1="-5.08" y1="-5.715" x2="-4.445" y2="-4.445" layer="21"/>
<rectangle x1="-7.9375" y1="-18.0975" x2="-7.3025" y2="-16.8275" layer="21" rot="R90"/>
<rectangle x1="-7.9375" y1="-7.9375" x2="-7.3025" y2="-6.6675" layer="21" rot="R90"/>
<rectangle x1="-7.9375" y1="-9.2075" x2="-7.3025" y2="-7.9375" layer="21" rot="R90"/>
<rectangle x1="-7.9375" y1="-10.4775" x2="-7.3025" y2="-9.2075" layer="21" rot="R90"/>
<rectangle x1="-7.9375" y1="-11.7475" x2="-7.3025" y2="-10.4775" layer="21" rot="R90"/>
<rectangle x1="-7.9375" y1="-13.0175" x2="-7.3025" y2="-11.7475" layer="21" rot="R90"/>
<rectangle x1="-7.9375" y1="-14.2875" x2="-7.3025" y2="-13.0175" layer="21" rot="R90"/>
<rectangle x1="-7.9375" y1="-15.5575" x2="-7.3025" y2="-14.2875" layer="21" rot="R90"/>
<rectangle x1="-7.9375" y1="-16.8275" x2="-7.3025" y2="-15.5575" layer="21" rot="R90"/>
<wire x1="6.35" y1="-6.35" x2="6.35" y2="-19.05" width="0.127" layer="21"/>
<wire x1="6.35" y1="-19.05" x2="-6.35" y2="-19.05" width="0.127" layer="21"/>
<wire x1="-6.35" y1="-19.05" x2="-6.35" y2="-6.35" width="0.127" layer="21"/>
<wire x1="-6.35" y1="-6.35" x2="6.35" y2="-6.35" width="0.127" layer="21"/>
<wire x1="6.35" y1="-19.05" x2="6.35" y2="-24.13" width="0.127" layer="21"/>
<wire x1="6.35" y1="-24.13" x2="-6.35" y2="-24.13" width="0.127" layer="21"/>
<wire x1="-6.35" y1="-24.13" x2="-6.35" y2="-19.05" width="0.127" layer="21"/>
<wire x1="5.08" y1="-17.78" x2="5.08" y2="-22.86" width="0.8128" layer="21"/>
<wire x1="5.08" y1="-22.86" x2="3.81" y2="-22.86" width="0.8128" layer="21"/>
<wire x1="3.81" y1="-22.86" x2="3.81" y2="-20.32" width="0.8128" layer="21"/>
<wire x1="3.81" y1="-20.32" x2="2.54" y2="-20.32" width="0.8128" layer="21"/>
<wire x1="2.54" y1="-20.32" x2="2.54" y2="-22.86" width="0.8128" layer="21"/>
<wire x1="2.54" y1="-22.86" x2="1.27" y2="-22.86" width="0.8128" layer="21"/>
<wire x1="1.27" y1="-22.86" x2="1.27" y2="-20.32" width="0.8128" layer="21"/>
<wire x1="1.27" y1="-20.32" x2="0" y2="-20.32" width="0.8128" layer="21"/>
<wire x1="0" y1="-20.32" x2="0" y2="-22.86" width="0.8128" layer="21"/>
<wire x1="0" y1="-22.86" x2="-1.27" y2="-22.86" width="0.8128" layer="21"/>
<wire x1="-1.27" y1="-22.86" x2="-1.27" y2="-20.32" width="0.8128" layer="21"/>
<wire x1="-1.27" y1="-20.32" x2="-2.54" y2="-20.32" width="0.8128" layer="21"/>
<wire x1="-2.54" y1="-20.32" x2="-2.54" y2="-22.86" width="0.8128" layer="21"/>
<wire x1="-2.54" y1="-22.86" x2="-5.08" y2="-22.86" width="0.8128" layer="21"/>
<text x="-1.27" y="-8.255" size="1.6764" layer="21" rot="R270">ESP8266</text>
<text x="1.27" y="-11.43" size="1.4224" layer="21" rot="R270">wifi</text>
<text x="0" y="15.875" size="1.6764" layer="21" rot="R270">NODEMCU V2</text>
<text x="-11.43" y="27.94" size="1.27" layer="25">&gt;Name</text>
<text x="-11.43" y="-26.67" size="1.27" layer="27">&gt;Value</text>
<text x="-9.525" y="18.415" size="1.27" layer="21">3V3</text>
<text x="-9.525" y="15.875" size="1.27" layer="21">GND</text>
<text x="-9.525" y="13.335" size="1.27" layer="21">TX</text>
<text x="-9.525" y="10.795" size="1.27" layer="21">RX</text>
<text x="-9.525" y="8.255" size="1.27" layer="21">D8</text>
<text x="-9.525" y="5.715" size="1.27" layer="21">D7</text>
<text x="-9.525" y="3.175" size="1.27" layer="21">D6</text>
<text x="-9.525" y="0.635" size="1.27" layer="21">D5</text>
<text x="-9.525" y="-1.905" size="1.27" layer="21">GND</text>
<text x="-9.525" y="-4.445" size="1.27" layer="21">3V3</text>
<text x="-9.525" y="-6.985" size="1.27" layer="21">D4</text>
<text x="-3.81" y="-8.255" size="1.27" layer="21" rot="R180">D3</text>
<text x="-3.81" y="-10.795" size="1.27" layer="21" rot="R180">D2</text>
<text x="-3.81" y="-13.335" size="1.27" layer="21" rot="R180">D1</text>
<text x="-3.81" y="-15.875" size="1.27" layer="21" rot="R180">D0</text>
<text x="8.5575" y="-15.475" size="1.27" layer="21" rot="R270">A0</text>
<text x="7.07" y="18.415" size="1.27" layer="21">VIN</text>
<text x="9.525" y="17.145" size="1.27" layer="21" rot="R180">GND</text>
<text x="9.525" y="14.605" size="1.27" layer="21" rot="R180">RST</text>
<text x="9.525" y="12.065" size="1.27" layer="21" rot="R180">EN</text>
<text x="9.525" y="9.525" size="1.27" layer="21" rot="R180">3V3</text>
<text x="9.525" y="6.985" size="1.27" layer="21" rot="R180">GND</text>
<text x="9.525" y="3.81" size="1.27" layer="21" rot="R180">CLK</text>
</package>
</packages>
<symbols>
<symbol name="NODEMCU_ESP8266">
<pin name="3V3@1" x="-15.24" y="12.7" visible="pin" length="middle" direction="pwr"/>
<pin name="GND@1" x="-15.24" y="10.16" visible="pin" length="middle" direction="pwr"/>
<pin name="TX" x="-15.24" y="7.62" visible="pin" length="middle"/>
<pin name="RX" x="-15.24" y="5.08" visible="pin" length="middle"/>
<pin name="D8" x="-15.24" y="2.54" visible="pin" length="middle"/>
<pin name="D7" x="-15.24" y="0" visible="pin" length="middle"/>
<pin name="D6" x="-15.24" y="-2.54" visible="pin" length="middle"/>
<pin name="D5" x="-15.24" y="-5.08" visible="pin" length="middle"/>
<pin name="GND@2" x="-15.24" y="-7.62" visible="pin" length="middle" direction="pwr"/>
<pin name="3V3@2" x="-15.24" y="-10.16" visible="pin" length="middle" direction="pwr"/>
<pin name="D4" x="-15.24" y="-12.7" visible="pin" length="middle"/>
<pin name="D3" x="-15.24" y="-15.24" visible="pin" length="middle"/>
<pin name="D2" x="-15.24" y="-17.78" visible="pin" length="middle"/>
<pin name="D1" x="-15.24" y="-20.32" visible="pin" length="middle"/>
<pin name="D0" x="-15.24" y="-22.86" visible="pin" length="middle"/>
<pin name="VIN" x="15.24" y="12.7" visible="pin" length="middle" direction="pwr" rot="R180"/>
<pin name="GND@4" x="15.24" y="10.16" visible="pin" length="middle" direction="pwr" rot="R180"/>
<pin name="RST" x="15.24" y="7.62" visible="pin" length="middle" rot="R180"/>
<pin name="EN" x="15.24" y="5.08" visible="pin" length="middle" rot="R180"/>
<pin name="3V3@3" x="15.24" y="2.54" visible="pin" length="middle" direction="pwr" rot="R180"/>
<pin name="GND@3" x="15.24" y="0" visible="pin" length="middle" direction="pwr" rot="R180"/>
<pin name="CLK" x="15.24" y="-2.54" visible="pin" length="middle" rot="R180"/>
<pin name="SD0" x="15.24" y="-5.08" visible="pin" length="middle" rot="R180"/>
<pin name="CMD" x="15.24" y="-7.62" visible="pin" length="middle" rot="R180"/>
<pin name="SD1" x="15.24" y="-10.16" visible="pin" length="middle" rot="R180"/>
<pin name="SD2" x="15.24" y="-12.7" visible="pin" length="middle" rot="R180"/>
<pin name="SD3" x="15.24" y="-15.24" visible="pin" length="middle" rot="R180"/>
<pin name="RSV@2" x="15.24" y="-17.78" visible="pin" length="middle" rot="R180"/>
<pin name="RSV@1" x="15.24" y="-20.32" visible="pin" length="middle" rot="R180"/>
<pin name="A0" x="15.24" y="-22.86" visible="pin" length="middle" rot="R180"/>
<wire x1="-10.16" y1="15.24" x2="-10.16" y2="-25.4" width="0.254" layer="94"/>
<wire x1="-10.16" y1="-25.4" x2="10.16" y2="-25.4" width="0.254" layer="94"/>
<wire x1="10.16" y1="-25.4" x2="10.16" y2="15.24" width="0.254" layer="94"/>
<wire x1="10.16" y1="15.24" x2="-10.16" y2="15.24" width="0.254" layer="94"/>
<text x="-10.16" y="-27.94" size="1.27" layer="96">&gt;value</text>
<text x="-10.16" y="17.78" size="1.27" layer="95">&gt;Name</text>
</symbol>
</symbols>
<devicesets>
<deviceset name="NODEMCU_ESP8266" prefix="NODE">
<description>Node MCU V2 (ESP8266)
Created by Harish</description>
<gates>
<gate name="G$1" symbol="NODEMCU_ESP8266" x="-17.78" y="20.32"/>
</gates>
<devices>
<device name="" package="NODEMCU_ESP8266">
<connects>
<connect gate="G$1" pin="3V3@1" pad="3V3@1"/>
<connect gate="G$1" pin="3V3@2" pad="3V3@2"/>
<connect gate="G$1" pin="3V3@3" pad="3V3@3"/>
<connect gate="G$1" pin="A0" pad="A0"/>
<connect gate="G$1" pin="CLK" pad="CLK"/>
<connect gate="G$1" pin="CMD" pad="CMD"/>
<connect gate="G$1" pin="D0" pad="D0"/>
<connect gate="G$1" pin="D1" pad="D1"/>
<connect gate="G$1" pin="D2" pad="D2"/>
<connect gate="G$1" pin="D3" pad="D3"/>
<connect gate="G$1" pin="D4" pad="D4"/>
<connect gate="G$1" pin="D5" pad="D5"/>
<connect gate="G$1" pin="D6" pad="D6"/>
<connect gate="G$1" pin="D7" pad="D7"/>
<connect gate="G$1" pin="D8" pad="D8"/>
<connect gate="G$1" pin="EN" pad="EN"/>
<connect gate="G$1" pin="GND@1" pad="GND@1"/>
<connect gate="G$1" pin="GND@2" pad="GND@2"/>
<connect gate="G$1" pin="GND@3" pad="GND@3"/>
<connect gate="G$1" pin="GND@4" pad="GND@4"/>
<connect gate="G$1" pin="RST" pad="RST"/>
<connect gate="G$1" pin="RSV@1" pad="RSV1"/>
<connect gate="G$1" pin="RSV@2" pad="RSV2"/>
<connect gate="G$1" pin="RX" pad="RX"/>
<connect gate="G$1" pin="SD0" pad="SDO"/>
<connect gate="G$1" pin="SD1" pad="SD1"/>
<connect gate="G$1" pin="SD2" pad="SD2"/>
<connect gate="G$1" pin="SD3" pad="SD3"/>
<connect gate="G$1" pin="TX" pad="TX"/>
<connect gate="G$1" pin="VIN" pad="VIN"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="Connector" urn="urn:adsk.eagle:library:16378166">
<description>&lt;b&gt;Pin Headers,Terminal blocks, D-Sub, Backplane, FFC/FPC, Socket</description>
<packages>
<package name="1X15" urn="urn:adsk.eagle:footprint:22291/1" library_version="28">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="12.065" y1="1.27" x2="13.335" y2="1.27" width="0.1524" layer="21"/>
<wire x1="13.335" y1="1.27" x2="13.97" y2="0.635" width="0.1524" layer="21"/>
<wire x1="13.97" y1="0.635" x2="13.97" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="13.97" y1="-0.635" x2="13.335" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="13.97" y1="0.635" x2="14.605" y2="1.27" width="0.1524" layer="21"/>
<wire x1="14.605" y1="1.27" x2="15.875" y2="1.27" width="0.1524" layer="21"/>
<wire x1="15.875" y1="1.27" x2="16.51" y2="0.635" width="0.1524" layer="21"/>
<wire x1="16.51" y1="0.635" x2="16.51" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="16.51" y1="-0.635" x2="15.875" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="15.875" y1="-1.27" x2="14.605" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="14.605" y1="-1.27" x2="13.97" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="8.89" y1="0.635" x2="9.525" y2="1.27" width="0.1524" layer="21"/>
<wire x1="9.525" y1="1.27" x2="10.795" y2="1.27" width="0.1524" layer="21"/>
<wire x1="10.795" y1="1.27" x2="11.43" y2="0.635" width="0.1524" layer="21"/>
<wire x1="11.43" y1="0.635" x2="11.43" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="11.43" y1="-0.635" x2="10.795" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="10.795" y1="-1.27" x2="9.525" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="9.525" y1="-1.27" x2="8.89" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="12.065" y1="1.27" x2="11.43" y2="0.635" width="0.1524" layer="21"/>
<wire x1="11.43" y1="-0.635" x2="12.065" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="13.335" y1="-1.27" x2="12.065" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="4.445" y1="1.27" x2="5.715" y2="1.27" width="0.1524" layer="21"/>
<wire x1="5.715" y1="1.27" x2="6.35" y2="0.635" width="0.1524" layer="21"/>
<wire x1="6.35" y1="0.635" x2="6.35" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="6.35" y1="-0.635" x2="5.715" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="6.35" y1="0.635" x2="6.985" y2="1.27" width="0.1524" layer="21"/>
<wire x1="6.985" y1="1.27" x2="8.255" y2="1.27" width="0.1524" layer="21"/>
<wire x1="8.255" y1="1.27" x2="8.89" y2="0.635" width="0.1524" layer="21"/>
<wire x1="8.89" y1="0.635" x2="8.89" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="8.89" y1="-0.635" x2="8.255" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="8.255" y1="-1.27" x2="6.985" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="6.985" y1="-1.27" x2="6.35" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="0.635" x2="1.905" y2="1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="1.27" x2="3.175" y2="1.27" width="0.1524" layer="21"/>
<wire x1="3.175" y1="1.27" x2="3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="3.81" y1="0.635" x2="3.81" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="3.81" y1="-0.635" x2="3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="3.175" y1="-1.27" x2="1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="-1.27" x2="1.27" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="4.445" y1="1.27" x2="3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="3.81" y1="-0.635" x2="4.445" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="5.715" y1="-1.27" x2="4.445" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="1.27" x2="-1.905" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="1.27" x2="-1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="0.635" x2="-1.27" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="-0.635" x2="-1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="0.635" x2="-0.635" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="1.27" x2="0.635" y2="1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="1.27" x2="1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="0.635" x2="1.27" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="-0.635" x2="0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="-1.27" x2="-0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="-1.27" x2="-1.27" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-6.35" y1="0.635" x2="-5.715" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-5.715" y1="1.27" x2="-4.445" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="1.27" x2="-3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="0.635" x2="-3.81" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="-0.635" x2="-4.445" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="-1.27" x2="-5.715" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-5.715" y1="-1.27" x2="-6.35" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="1.27" x2="-3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="-0.635" x2="-3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="-1.27" x2="-3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-10.795" y1="1.27" x2="-9.525" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-9.525" y1="1.27" x2="-8.89" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-8.89" y1="0.635" x2="-8.89" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-8.89" y1="-0.635" x2="-9.525" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-8.89" y1="0.635" x2="-8.255" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-8.255" y1="1.27" x2="-6.985" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-6.985" y1="1.27" x2="-6.35" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-6.35" y1="0.635" x2="-6.35" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-6.35" y1="-0.635" x2="-6.985" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-6.985" y1="-1.27" x2="-8.255" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-8.255" y1="-1.27" x2="-8.89" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-13.97" y1="0.635" x2="-13.335" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-13.335" y1="1.27" x2="-12.065" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-12.065" y1="1.27" x2="-11.43" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-11.43" y1="0.635" x2="-11.43" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-11.43" y1="-0.635" x2="-12.065" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-12.065" y1="-1.27" x2="-13.335" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-13.335" y1="-1.27" x2="-13.97" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-10.795" y1="1.27" x2="-11.43" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-11.43" y1="-0.635" x2="-10.795" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-9.525" y1="-1.27" x2="-10.795" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-18.415" y1="1.27" x2="-17.145" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-17.145" y1="1.27" x2="-16.51" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-16.51" y1="0.635" x2="-16.51" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-16.51" y1="-0.635" x2="-17.145" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-16.51" y1="0.635" x2="-15.875" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-15.875" y1="1.27" x2="-14.605" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-14.605" y1="1.27" x2="-13.97" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-13.97" y1="0.635" x2="-13.97" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-13.97" y1="-0.635" x2="-14.605" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-14.605" y1="-1.27" x2="-15.875" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-15.875" y1="-1.27" x2="-16.51" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-19.05" y1="0.635" x2="-19.05" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-18.415" y1="1.27" x2="-19.05" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-19.05" y1="-0.635" x2="-18.415" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-17.145" y1="-1.27" x2="-18.415" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="16.51" y1="0.635" x2="17.145" y2="1.27" width="0.1524" layer="21"/>
<wire x1="17.145" y1="1.27" x2="18.415" y2="1.27" width="0.1524" layer="21"/>
<wire x1="18.415" y1="1.27" x2="19.05" y2="0.635" width="0.1524" layer="21"/>
<wire x1="19.05" y1="0.635" x2="19.05" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="19.05" y1="-0.635" x2="18.415" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="18.415" y1="-1.27" x2="17.145" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="17.145" y1="-1.27" x2="16.51" y2="-0.635" width="0.1524" layer="21"/>
<pad name="1" x="-17.78" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="-15.24" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="3" x="-12.7" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="4" x="-10.16" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="5" x="-7.62" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="6" x="-5.08" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="7" x="-2.54" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="8" x="0" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="9" x="2.54" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="10" x="5.08" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="11" x="7.62" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="12" x="10.16" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="13" x="12.7" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="14" x="15.24" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="15" x="17.78" y="0" drill="1.016" shape="long" rot="R90"/>
<text x="-19.1262" y="1.8288" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-19.05" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="14.986" y1="-0.254" x2="15.494" y2="0.254" layer="51"/>
<rectangle x1="12.446" y1="-0.254" x2="12.954" y2="0.254" layer="51"/>
<rectangle x1="9.906" y1="-0.254" x2="10.414" y2="0.254" layer="51"/>
<rectangle x1="7.366" y1="-0.254" x2="7.874" y2="0.254" layer="51"/>
<rectangle x1="4.826" y1="-0.254" x2="5.334" y2="0.254" layer="51"/>
<rectangle x1="2.286" y1="-0.254" x2="2.794" y2="0.254" layer="51"/>
<rectangle x1="-0.254" y1="-0.254" x2="0.254" y2="0.254" layer="51"/>
<rectangle x1="-2.794" y1="-0.254" x2="-2.286" y2="0.254" layer="51"/>
<rectangle x1="-5.334" y1="-0.254" x2="-4.826" y2="0.254" layer="51"/>
<rectangle x1="-7.874" y1="-0.254" x2="-7.366" y2="0.254" layer="51"/>
<rectangle x1="-10.414" y1="-0.254" x2="-9.906" y2="0.254" layer="51"/>
<rectangle x1="-12.954" y1="-0.254" x2="-12.446" y2="0.254" layer="51"/>
<rectangle x1="-15.494" y1="-0.254" x2="-14.986" y2="0.254" layer="51"/>
<rectangle x1="-18.034" y1="-0.254" x2="-17.526" y2="0.254" layer="51"/>
<rectangle x1="17.526" y1="-0.254" x2="18.034" y2="0.254" layer="51"/>
</package>
<package name="1X15/90" urn="urn:adsk.eagle:footprint:22292/1" library_version="28">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="-19.05" y1="-1.905" x2="-16.51" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-16.51" y1="-1.905" x2="-16.51" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-16.51" y1="0.635" x2="-19.05" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-19.05" y1="0.635" x2="-19.05" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-17.78" y1="6.985" x2="-17.78" y2="1.27" width="0.762" layer="21"/>
<wire x1="-16.51" y1="-1.905" x2="-13.97" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-13.97" y1="-1.905" x2="-13.97" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-13.97" y1="0.635" x2="-16.51" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-15.24" y1="6.985" x2="-15.24" y2="1.27" width="0.762" layer="21"/>
<wire x1="-13.97" y1="-1.905" x2="-11.43" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-11.43" y1="-1.905" x2="-11.43" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-11.43" y1="0.635" x2="-13.97" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-12.7" y1="6.985" x2="-12.7" y2="1.27" width="0.762" layer="21"/>
<wire x1="-11.43" y1="-1.905" x2="-8.89" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-8.89" y1="-1.905" x2="-8.89" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-8.89" y1="0.635" x2="-11.43" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-10.16" y1="6.985" x2="-10.16" y2="1.27" width="0.762" layer="21"/>
<wire x1="-8.89" y1="-1.905" x2="-6.35" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-6.35" y1="-1.905" x2="-6.35" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-6.35" y1="0.635" x2="-8.89" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="6.985" x2="-7.62" y2="1.27" width="0.762" layer="21"/>
<wire x1="-6.35" y1="-1.905" x2="-3.81" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="-1.905" x2="-3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="0.635" x2="-6.35" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="6.985" x2="-5.08" y2="1.27" width="0.762" layer="21"/>
<wire x1="-3.81" y1="-1.905" x2="-1.27" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="-1.905" x2="-1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="0.635" x2="-3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="6.985" x2="-2.54" y2="1.27" width="0.762" layer="21"/>
<wire x1="-1.27" y1="-1.905" x2="1.27" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="1.27" y1="-1.905" x2="1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="0.635" x2="-1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="6.985" x2="0" y2="1.27" width="0.762" layer="21"/>
<wire x1="1.27" y1="-1.905" x2="3.81" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="3.81" y1="-1.905" x2="3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="3.81" y1="0.635" x2="1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="6.985" x2="2.54" y2="1.27" width="0.762" layer="21"/>
<wire x1="3.81" y1="-1.905" x2="6.35" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="6.35" y1="-1.905" x2="6.35" y2="0.635" width="0.1524" layer="21"/>
<wire x1="6.35" y1="0.635" x2="3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="5.08" y1="6.985" x2="5.08" y2="1.27" width="0.762" layer="21"/>
<wire x1="6.35" y1="-1.905" x2="8.89" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="8.89" y1="-1.905" x2="8.89" y2="0.635" width="0.1524" layer="21"/>
<wire x1="8.89" y1="0.635" x2="6.35" y2="0.635" width="0.1524" layer="21"/>
<wire x1="7.62" y1="6.985" x2="7.62" y2="1.27" width="0.762" layer="21"/>
<wire x1="8.89" y1="-1.905" x2="11.43" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="11.43" y1="-1.905" x2="11.43" y2="0.635" width="0.1524" layer="21"/>
<wire x1="11.43" y1="0.635" x2="8.89" y2="0.635" width="0.1524" layer="21"/>
<wire x1="10.16" y1="6.985" x2="10.16" y2="1.27" width="0.762" layer="21"/>
<wire x1="11.43" y1="-1.905" x2="13.97" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="13.97" y1="-1.905" x2="13.97" y2="0.635" width="0.1524" layer="21"/>
<wire x1="13.97" y1="0.635" x2="11.43" y2="0.635" width="0.1524" layer="21"/>
<wire x1="12.7" y1="6.985" x2="12.7" y2="1.27" width="0.762" layer="21"/>
<wire x1="13.97" y1="-1.905" x2="16.51" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="16.51" y1="-1.905" x2="16.51" y2="0.635" width="0.1524" layer="21"/>
<wire x1="16.51" y1="0.635" x2="13.97" y2="0.635" width="0.1524" layer="21"/>
<wire x1="15.24" y1="6.985" x2="15.24" y2="1.27" width="0.762" layer="21"/>
<wire x1="16.51" y1="-1.905" x2="19.05" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="19.05" y1="-1.905" x2="19.05" y2="0.635" width="0.1524" layer="21"/>
<wire x1="19.05" y1="0.635" x2="16.51" y2="0.635" width="0.1524" layer="21"/>
<wire x1="17.78" y1="6.985" x2="17.78" y2="1.27" width="0.762" layer="21"/>
<pad name="1" x="-17.78" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="-15.24" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="3" x="-12.7" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="4" x="-10.16" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="5" x="-7.62" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="6" x="-5.08" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="7" x="-2.54" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="8" x="0" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="9" x="2.54" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="10" x="5.08" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="11" x="7.62" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="12" x="10.16" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="13" x="12.7" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="14" x="15.24" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="15" x="17.78" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<text x="-19.685" y="-3.81" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="20.955" y="-3.81" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-18.161" y1="0.635" x2="-17.399" y2="1.143" layer="21"/>
<rectangle x1="-15.621" y1="0.635" x2="-14.859" y2="1.143" layer="21"/>
<rectangle x1="-13.081" y1="0.635" x2="-12.319" y2="1.143" layer="21"/>
<rectangle x1="-10.541" y1="0.635" x2="-9.779" y2="1.143" layer="21"/>
<rectangle x1="-8.001" y1="0.635" x2="-7.239" y2="1.143" layer="21"/>
<rectangle x1="-5.461" y1="0.635" x2="-4.699" y2="1.143" layer="21"/>
<rectangle x1="-2.921" y1="0.635" x2="-2.159" y2="1.143" layer="21"/>
<rectangle x1="-0.381" y1="0.635" x2="0.381" y2="1.143" layer="21"/>
<rectangle x1="2.159" y1="0.635" x2="2.921" y2="1.143" layer="21"/>
<rectangle x1="4.699" y1="0.635" x2="5.461" y2="1.143" layer="21"/>
<rectangle x1="7.239" y1="0.635" x2="8.001" y2="1.143" layer="21"/>
<rectangle x1="9.779" y1="0.635" x2="10.541" y2="1.143" layer="21"/>
<rectangle x1="12.319" y1="0.635" x2="13.081" y2="1.143" layer="21"/>
<rectangle x1="14.859" y1="0.635" x2="15.621" y2="1.143" layer="21"/>
<rectangle x1="17.399" y1="0.635" x2="18.161" y2="1.143" layer="21"/>
<rectangle x1="-18.161" y1="-2.921" x2="-17.399" y2="-1.905" layer="21"/>
<rectangle x1="-15.621" y1="-2.921" x2="-14.859" y2="-1.905" layer="21"/>
<rectangle x1="-13.081" y1="-2.921" x2="-12.319" y2="-1.905" layer="21"/>
<rectangle x1="-10.541" y1="-2.921" x2="-9.779" y2="-1.905" layer="21"/>
<rectangle x1="-8.001" y1="-2.921" x2="-7.239" y2="-1.905" layer="21"/>
<rectangle x1="-5.461" y1="-2.921" x2="-4.699" y2="-1.905" layer="21"/>
<rectangle x1="-2.921" y1="-2.921" x2="-2.159" y2="-1.905" layer="21"/>
<rectangle x1="-0.381" y1="-2.921" x2="0.381" y2="-1.905" layer="21"/>
<rectangle x1="2.159" y1="-2.921" x2="2.921" y2="-1.905" layer="21"/>
<rectangle x1="4.699" y1="-2.921" x2="5.461" y2="-1.905" layer="21"/>
<rectangle x1="7.239" y1="-2.921" x2="8.001" y2="-1.905" layer="21"/>
<rectangle x1="9.779" y1="-2.921" x2="10.541" y2="-1.905" layer="21"/>
<rectangle x1="12.319" y1="-2.921" x2="13.081" y2="-1.905" layer="21"/>
<rectangle x1="14.859" y1="-2.921" x2="15.621" y2="-1.905" layer="21"/>
<rectangle x1="17.399" y1="-2.921" x2="18.161" y2="-1.905" layer="21"/>
</package>
<package name="1X03" urn="urn:adsk.eagle:footprint:22340/1" library_version="28">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="-3.175" y1="1.27" x2="-1.905" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="1.27" x2="-1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="0.635" x2="-1.27" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="-0.635" x2="-1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="0.635" x2="-0.635" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="1.27" x2="0.635" y2="1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="1.27" x2="1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="0.635" x2="1.27" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="-0.635" x2="0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="-1.27" x2="-0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="-1.27" x2="-1.27" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="0.635" x2="-3.81" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="1.27" x2="-3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="-0.635" x2="-3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="-1.27" x2="-3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="1.27" y1="0.635" x2="1.905" y2="1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="1.27" x2="3.175" y2="1.27" width="0.1524" layer="21"/>
<wire x1="3.175" y1="1.27" x2="3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="3.81" y1="0.635" x2="3.81" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="3.81" y1="-0.635" x2="3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="3.175" y1="-1.27" x2="1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="-1.27" x2="1.27" y2="-0.635" width="0.1524" layer="21"/>
<pad name="1" x="-2.54" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="0" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="3" x="2.54" y="0" drill="1.016" shape="long" rot="R90"/>
<text x="-3.8862" y="1.8288" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.81" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-0.254" y1="-0.254" x2="0.254" y2="0.254" layer="51"/>
<rectangle x1="-2.794" y1="-0.254" x2="-2.286" y2="0.254" layer="51"/>
<rectangle x1="2.286" y1="-0.254" x2="2.794" y2="0.254" layer="51"/>
</package>
<package name="1X03/90" urn="urn:adsk.eagle:footprint:22341/1" library_version="28">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="-3.81" y1="-1.905" x2="-1.27" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="-1.905" x2="-1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="0.635" x2="-3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="0.635" x2="-3.81" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="6.985" x2="-2.54" y2="1.27" width="0.762" layer="21"/>
<wire x1="-1.27" y1="-1.905" x2="1.27" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="1.27" y1="-1.905" x2="1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="0.635" x2="-1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="6.985" x2="0" y2="1.27" width="0.762" layer="21"/>
<wire x1="1.27" y1="-1.905" x2="3.81" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="3.81" y1="-1.905" x2="3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="3.81" y1="0.635" x2="1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="6.985" x2="2.54" y2="1.27" width="0.762" layer="21"/>
<pad name="1" x="-2.54" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="0" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="3" x="2.54" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<text x="-4.445" y="-3.81" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="5.715" y="-3.81" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-2.921" y1="0.635" x2="-2.159" y2="1.143" layer="21"/>
<rectangle x1="-0.381" y1="0.635" x2="0.381" y2="1.143" layer="21"/>
<rectangle x1="2.159" y1="0.635" x2="2.921" y2="1.143" layer="21"/>
<rectangle x1="-2.921" y1="-2.921" x2="-2.159" y2="-1.905" layer="21"/>
<rectangle x1="-0.381" y1="-2.921" x2="0.381" y2="-1.905" layer="21"/>
<rectangle x1="2.159" y1="-2.921" x2="2.921" y2="-1.905" layer="21"/>
</package>
<package name="1X05" urn="urn:adsk.eagle:footprint:22354/1" library_version="28">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="1.905" y1="1.27" x2="3.175" y2="1.27" width="0.1524" layer="21"/>
<wire x1="3.175" y1="1.27" x2="3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="3.81" y1="0.635" x2="3.81" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="3.81" y1="-0.635" x2="3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="0.635" x2="-0.635" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="1.27" x2="0.635" y2="1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="1.27" x2="1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="0.635" x2="1.27" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="-0.635" x2="0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="-1.27" x2="-0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="-1.27" x2="-1.27" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="1.905" y1="1.27" x2="1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="-0.635" x2="1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="3.175" y1="-1.27" x2="1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-5.715" y1="1.27" x2="-4.445" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="1.27" x2="-3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="0.635" x2="-3.81" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="-0.635" x2="-4.445" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="0.635" x2="-3.175" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="1.27" x2="-1.905" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="1.27" x2="-1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="0.635" x2="-1.27" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="-0.635" x2="-1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="-1.27" x2="-3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="-1.27" x2="-3.81" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-6.35" y1="0.635" x2="-6.35" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-5.715" y1="1.27" x2="-6.35" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-6.35" y1="-0.635" x2="-5.715" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="-1.27" x2="-5.715" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="4.445" y1="1.27" x2="5.715" y2="1.27" width="0.1524" layer="21"/>
<wire x1="5.715" y1="1.27" x2="6.35" y2="0.635" width="0.1524" layer="21"/>
<wire x1="6.35" y1="0.635" x2="6.35" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="6.35" y1="-0.635" x2="5.715" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="4.445" y1="1.27" x2="3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="3.81" y1="-0.635" x2="4.445" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="5.715" y1="-1.27" x2="4.445" y2="-1.27" width="0.1524" layer="21"/>
<pad name="1" x="-5.08" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="-2.54" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="3" x="0" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="4" x="2.54" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="5" x="5.08" y="0" drill="1.016" shape="long" rot="R90"/>
<text x="-6.4262" y="1.8288" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-6.35" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="2.286" y1="-0.254" x2="2.794" y2="0.254" layer="51"/>
<rectangle x1="-0.254" y1="-0.254" x2="0.254" y2="0.254" layer="51"/>
<rectangle x1="-2.794" y1="-0.254" x2="-2.286" y2="0.254" layer="51"/>
<rectangle x1="-5.334" y1="-0.254" x2="-4.826" y2="0.254" layer="51"/>
<rectangle x1="4.826" y1="-0.254" x2="5.334" y2="0.254" layer="51"/>
</package>
<package name="1X05/90" urn="urn:adsk.eagle:footprint:22355/1" library_version="28">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="-6.35" y1="-1.905" x2="-3.81" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="-1.905" x2="-3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="0.635" x2="-6.35" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-6.35" y1="0.635" x2="-6.35" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="6.985" x2="-5.08" y2="1.27" width="0.762" layer="21"/>
<wire x1="-3.81" y1="-1.905" x2="-1.27" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="-1.905" x2="-1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="0.635" x2="-3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="6.985" x2="-2.54" y2="1.27" width="0.762" layer="21"/>
<wire x1="-1.27" y1="-1.905" x2="1.27" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="1.27" y1="-1.905" x2="1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="0.635" x2="-1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="6.985" x2="0" y2="1.27" width="0.762" layer="21"/>
<wire x1="1.27" y1="-1.905" x2="3.81" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="3.81" y1="-1.905" x2="3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="3.81" y1="0.635" x2="1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="6.985" x2="2.54" y2="1.27" width="0.762" layer="21"/>
<wire x1="3.81" y1="-1.905" x2="6.35" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="6.35" y1="-1.905" x2="6.35" y2="0.635" width="0.1524" layer="21"/>
<wire x1="6.35" y1="0.635" x2="3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="5.08" y1="6.985" x2="5.08" y2="1.27" width="0.762" layer="21"/>
<pad name="1" x="-5.08" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="-2.54" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="3" x="0" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="4" x="2.54" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="5" x="5.08" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<text x="-6.985" y="-3.81" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="8.255" y="-3.81" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-5.461" y1="0.635" x2="-4.699" y2="1.143" layer="21"/>
<rectangle x1="-2.921" y1="0.635" x2="-2.159" y2="1.143" layer="21"/>
<rectangle x1="-0.381" y1="0.635" x2="0.381" y2="1.143" layer="21"/>
<rectangle x1="2.159" y1="0.635" x2="2.921" y2="1.143" layer="21"/>
<rectangle x1="4.699" y1="0.635" x2="5.461" y2="1.143" layer="21"/>
<rectangle x1="-5.461" y1="-2.921" x2="-4.699" y2="-1.905" layer="21"/>
<rectangle x1="-2.921" y1="-2.921" x2="-2.159" y2="-1.905" layer="21"/>
<rectangle x1="-0.381" y1="-2.921" x2="0.381" y2="-1.905" layer="21"/>
<rectangle x1="2.159" y1="-2.921" x2="2.921" y2="-1.905" layer="21"/>
<rectangle x1="4.699" y1="-2.921" x2="5.461" y2="-1.905" layer="21"/>
</package>
<package name="1_05X2MM" urn="urn:adsk.eagle:footprint:22356/1" library_version="28">
<description>CON-M-1X5-200</description>
<text x="-4.5" y="1.5" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-4.75" y="-2.75" size="1.27" layer="27">&gt;VALUE</text>
<wire x1="-5" y1="0.5" x2="-4.5" y2="1" width="0.1524" layer="21"/>
<wire x1="-4.5" y1="1" x2="-3.5" y2="1" width="0.1524" layer="21"/>
<wire x1="-3.5" y1="1" x2="-3" y2="0.5" width="0.1524" layer="21"/>
<wire x1="-3" y1="-0.5" x2="-3.5" y2="-1" width="0.1524" layer="21"/>
<wire x1="-3.5" y1="-1" x2="-4.5" y2="-1" width="0.1524" layer="21"/>
<wire x1="-4.5" y1="-1" x2="-5" y2="-0.5" width="0.1524" layer="21"/>
<wire x1="-5" y1="0.5" x2="-5" y2="-0.5" width="0.1524" layer="21"/>
<wire x1="-3" y1="0.5" x2="-2.5" y2="1" width="0.1524" layer="21"/>
<wire x1="-2.5" y1="1" x2="-1.5" y2="1" width="0.1524" layer="21"/>
<wire x1="-1.5" y1="1" x2="-1" y2="0.5" width="0.1524" layer="21"/>
<wire x1="-1" y1="-0.5" x2="-1.5" y2="-1" width="0.1524" layer="21"/>
<wire x1="-1.5" y1="-1" x2="-2.5" y2="-1" width="0.1524" layer="21"/>
<wire x1="-2.5" y1="-1" x2="-3" y2="-0.5" width="0.1524" layer="21"/>
<wire x1="-3" y1="0.5" x2="-3" y2="-0.5" width="0.1524" layer="21"/>
<wire x1="-1" y1="0.5" x2="-0.5" y2="1" width="0.1524" layer="21"/>
<wire x1="-0.5" y1="1" x2="0.5" y2="1" width="0.1524" layer="21"/>
<wire x1="0.5" y1="1" x2="1" y2="0.5" width="0.1524" layer="21"/>
<wire x1="1" y1="-0.5" x2="0.5" y2="-1" width="0.1524" layer="21"/>
<wire x1="0.5" y1="-1" x2="-0.5" y2="-1" width="0.1524" layer="21"/>
<wire x1="-0.5" y1="-1" x2="-1" y2="-0.5" width="0.1524" layer="21"/>
<wire x1="-1" y1="0.5" x2="-1" y2="-0.5" width="0.1524" layer="21"/>
<wire x1="1" y1="0.5" x2="1.5" y2="1" width="0.1524" layer="21"/>
<wire x1="1.5" y1="1" x2="2.5" y2="1" width="0.1524" layer="21"/>
<wire x1="2.5" y1="1" x2="3" y2="0.5" width="0.1524" layer="21"/>
<wire x1="3" y1="-0.5" x2="2.5" y2="-1" width="0.1524" layer="21"/>
<wire x1="2.5" y1="-1" x2="1.5" y2="-1" width="0.1524" layer="21"/>
<wire x1="1.5" y1="-1" x2="1" y2="-0.5" width="0.1524" layer="21"/>
<wire x1="1" y1="0.5" x2="1" y2="-0.5" width="0.1524" layer="21"/>
<wire x1="3" y1="0.5" x2="3.5" y2="1" width="0.1524" layer="21"/>
<wire x1="3.5" y1="1" x2="4.5" y2="1" width="0.1524" layer="21"/>
<wire x1="4.5" y1="1" x2="5" y2="0.5" width="0.1524" layer="21"/>
<wire x1="5" y1="0.5" x2="5" y2="-0.5" width="0.1524" layer="21"/>
<wire x1="5" y1="-0.5" x2="4.5" y2="-1" width="0.1524" layer="21"/>
<wire x1="4.5" y1="-1" x2="3.5" y2="-1" width="0.1524" layer="21"/>
<wire x1="3.5" y1="-1" x2="3" y2="-0.5" width="0.1524" layer="21"/>
<wire x1="3" y1="0.5" x2="3" y2="-0.5" width="0.1524" layer="21"/>
<pad name="1" x="-4" y="0" drill="1.016" diameter="1.3" shape="square" rot="R90"/>
<pad name="3" x="0" y="0" drill="1.016" diameter="1.3" rot="R90"/>
<pad name="2" x="-2" y="0" drill="1.016" diameter="1.3" rot="R90"/>
<pad name="4" x="2" y="0" drill="1.016" diameter="1.3" rot="R90"/>
<pad name="5" x="4" y="0" drill="1.016" diameter="1.3" rot="R90"/>
<rectangle x1="-4.254" y1="-0.254" x2="-3.746" y2="0.254" layer="51"/>
<rectangle x1="-2.254" y1="-0.254" x2="-1.746" y2="0.254" layer="51"/>
<rectangle x1="-0.254" y1="-0.254" x2="0.254" y2="0.254" layer="51"/>
<rectangle x1="1.746" y1="-0.254" x2="2.254" y2="0.254" layer="51"/>
<rectangle x1="3.746" y1="-0.254" x2="4.254" y2="0.254" layer="51"/>
</package>
</packages>
<packages3d>
<package3d name="1X15" urn="urn:adsk.eagle:package:22424/2" type="model" library_version="28">
<description>PIN HEADER</description>
<packageinstances>
<packageinstance name="1X15"/>
</packageinstances>
</package3d>
<package3d name="1X15/90" urn="urn:adsk.eagle:package:22415/2" type="model" library_version="28">
<description>PIN HEADER</description>
<packageinstances>
<packageinstance name="1X15/90"/>
</packageinstances>
</package3d>
<package3d name="1X03" urn="urn:adsk.eagle:package:22458/2" type="model" library_version="28">
<description>PIN HEADER</description>
<packageinstances>
<packageinstance name="1X03"/>
</packageinstances>
</package3d>
<package3d name="1X03/90" urn="urn:adsk.eagle:package:22459/2" type="model" library_version="28">
<description>PIN HEADER</description>
<packageinstances>
<packageinstance name="1X03/90"/>
</packageinstances>
</package3d>
<package3d name="1X05" urn="urn:adsk.eagle:package:22469/2" type="model" library_version="28">
<description>PIN HEADER</description>
<packageinstances>
<packageinstance name="1X05"/>
</packageinstances>
</package3d>
<package3d name="1X05/90" urn="urn:adsk.eagle:package:22467/2" type="model" library_version="28">
<description>PIN HEADER</description>
<packageinstances>
<packageinstance name="1X05/90"/>
</packageinstances>
</package3d>
<package3d name="1_05X2MM" urn="urn:adsk.eagle:package:22466/2" type="model" library_version="28">
<description>CON-M-1X5-200</description>
<packageinstances>
<packageinstance name="1_05X2MM"/>
</packageinstances>
</package3d>
</packages3d>
<symbols>
<symbol name="PINHD15" urn="urn:adsk.eagle:symbol:22290/1" library_version="28">
<wire x1="-6.35" y1="-20.32" x2="1.27" y2="-20.32" width="0.4064" layer="94"/>
<wire x1="1.27" y1="-20.32" x2="1.27" y2="20.32" width="0.4064" layer="94"/>
<wire x1="1.27" y1="20.32" x2="-6.35" y2="20.32" width="0.4064" layer="94"/>
<wire x1="-6.35" y1="20.32" x2="-6.35" y2="-20.32" width="0.4064" layer="94"/>
<text x="-6.35" y="20.955" size="1.778" layer="95">&gt;NAME</text>
<text x="-6.35" y="-22.86" size="1.778" layer="96">&gt;VALUE</text>
<pin name="1" x="-2.54" y="17.78" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="2" x="-2.54" y="15.24" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="3" x="-2.54" y="12.7" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="4" x="-2.54" y="10.16" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="5" x="-2.54" y="7.62" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="6" x="-2.54" y="5.08" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="7" x="-2.54" y="2.54" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="8" x="-2.54" y="0" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="9" x="-2.54" y="-2.54" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="10" x="-2.54" y="-5.08" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="11" x="-2.54" y="-7.62" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="12" x="-2.54" y="-10.16" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="13" x="-2.54" y="-12.7" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="14" x="-2.54" y="-15.24" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="15" x="-2.54" y="-17.78" visible="pad" length="short" direction="pas" function="dot"/>
</symbol>
<symbol name="PINHD3" urn="urn:adsk.eagle:symbol:22339/1" library_version="28">
<wire x1="-6.35" y1="-5.08" x2="1.27" y2="-5.08" width="0.4064" layer="94"/>
<wire x1="1.27" y1="-5.08" x2="1.27" y2="5.08" width="0.4064" layer="94"/>
<wire x1="1.27" y1="5.08" x2="-6.35" y2="5.08" width="0.4064" layer="94"/>
<wire x1="-6.35" y1="5.08" x2="-6.35" y2="-5.08" width="0.4064" layer="94"/>
<text x="-6.35" y="5.715" size="1.778" layer="95">&gt;NAME</text>
<text x="-6.35" y="-7.62" size="1.778" layer="96">&gt;VALUE</text>
<pin name="1" x="-2.54" y="2.54" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="2" x="-2.54" y="0" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="3" x="-2.54" y="-2.54" visible="pad" length="short" direction="pas" function="dot"/>
</symbol>
<symbol name="PINHD5" urn="urn:adsk.eagle:symbol:22353/1" library_version="28">
<wire x1="-6.35" y1="-7.62" x2="1.27" y2="-7.62" width="0.4064" layer="94"/>
<wire x1="1.27" y1="-7.62" x2="1.27" y2="7.62" width="0.4064" layer="94"/>
<wire x1="1.27" y1="7.62" x2="-6.35" y2="7.62" width="0.4064" layer="94"/>
<wire x1="-6.35" y1="7.62" x2="-6.35" y2="-7.62" width="0.4064" layer="94"/>
<text x="-6.35" y="8.255" size="1.778" layer="95">&gt;NAME</text>
<text x="-6.35" y="-10.16" size="1.778" layer="96">&gt;VALUE</text>
<pin name="1" x="-2.54" y="5.08" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="2" x="-2.54" y="2.54" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="3" x="-2.54" y="0" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="4" x="-2.54" y="-2.54" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="5" x="-2.54" y="-5.08" visible="pad" length="short" direction="pas" function="dot"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="PINHD-1X15" urn="urn:adsk.eagle:component:16494878/2" prefix="JP" library_version="28">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<gates>
<gate name="A" symbol="PINHD15" x="0" y="0"/>
</gates>
<devices>
<device name="" package="1X15">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="10" pad="10"/>
<connect gate="A" pin="11" pad="11"/>
<connect gate="A" pin="12" pad="12"/>
<connect gate="A" pin="13" pad="13"/>
<connect gate="A" pin="14" pad="14"/>
<connect gate="A" pin="15" pad="15"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
<connect gate="A" pin="6" pad="6"/>
<connect gate="A" pin="7" pad="7"/>
<connect gate="A" pin="8" pad="8"/>
<connect gate="A" pin="9" pad="9"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:22424/2"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="CATEGORY" value="CONNECTOR" constant="no"/>
<attribute name="DESCRIPTION" value="" constant="no"/>
<attribute name="MANUFACTURER" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OPERATING_TEMP" value="" constant="no"/>
<attribute name="PART_STATUS" value="" constant="no"/>
<attribute name="ROHS_COMPLIANT" value="" constant="no"/>
<attribute name="SERIES" value="" constant="no"/>
<attribute name="SUB-CATEGORY" value="PIN-HEADER" constant="no"/>
<attribute name="THERMALLOSS" value="" constant="no"/>
<attribute name="TYPE" value="" constant="no"/>
</technology>
</technologies>
</device>
<device name="/90" package="1X15/90">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="10" pad="10"/>
<connect gate="A" pin="11" pad="11"/>
<connect gate="A" pin="12" pad="12"/>
<connect gate="A" pin="13" pad="13"/>
<connect gate="A" pin="14" pad="14"/>
<connect gate="A" pin="15" pad="15"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
<connect gate="A" pin="6" pad="6"/>
<connect gate="A" pin="7" pad="7"/>
<connect gate="A" pin="8" pad="8"/>
<connect gate="A" pin="9" pad="9"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:22415/2"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="CATEGORY" value="CONNECTOR" constant="no"/>
<attribute name="DESCRIPTION" value="" constant="no"/>
<attribute name="MANUFACTURER" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OPERATING_TEMP" value="" constant="no"/>
<attribute name="PART_STATUS" value="" constant="no"/>
<attribute name="ROHS_COMPLIANT" value="" constant="no"/>
<attribute name="SERIES" value="" constant="no"/>
<attribute name="SUB-CATEGORY" value="PIN-HEADER" constant="no"/>
<attribute name="THERMALLOSS" value="" constant="no"/>
<attribute name="TYPE" value="" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="PINHD-1X3" urn="urn:adsk.eagle:component:16494881/2" prefix="JP" library_version="28">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<gates>
<gate name="A" symbol="PINHD3" x="0" y="0"/>
</gates>
<devices>
<device name="" package="1X03">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:22458/2"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="CATEGORY" value="CONNECTOR" constant="no"/>
<attribute name="DESCRIPTION" value="" constant="no"/>
<attribute name="MANUFACTURER" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OPERATING_TEMP" value="" constant="no"/>
<attribute name="PART_STATUS" value="" constant="no"/>
<attribute name="ROHS_COMPLIANT" value="" constant="no"/>
<attribute name="SERIES" value="" constant="no"/>
<attribute name="SUB-CATEGORY" value="PIN-HEADER" constant="no"/>
<attribute name="THERMALLOSS" value="" constant="no"/>
<attribute name="TYPE" value="" constant="no"/>
</technology>
</technologies>
</device>
<device name="/90" package="1X03/90">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:22459/2"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="CATEGORY" value="CONNECTOR" constant="no"/>
<attribute name="DESCRIPTION" value="" constant="no"/>
<attribute name="MANUFACTURER" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OPERATING_TEMP" value="" constant="no"/>
<attribute name="PART_STATUS" value="" constant="no"/>
<attribute name="ROHS_COMPLIANT" value="" constant="no"/>
<attribute name="SERIES" value="" constant="no"/>
<attribute name="SUB-CATEGORY" value="PIN-HEADER" constant="no"/>
<attribute name="THERMALLOSS" value="" constant="no"/>
<attribute name="TYPE" value="" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="PINHD-1X5" urn="urn:adsk.eagle:component:16494879/2" prefix="JP" library_version="28">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<gates>
<gate name="A" symbol="PINHD5" x="0" y="0"/>
</gates>
<devices>
<device name="" package="1X05">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:22469/2"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="CATEGORY" value="CONNECTOR" constant="no"/>
<attribute name="DESCRIPTION" value="" constant="no"/>
<attribute name="MANUFACTURER" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OPERATING_TEMP" value="" constant="no"/>
<attribute name="PART_STATUS" value="" constant="no"/>
<attribute name="ROHS_COMPLIANT" value="" constant="no"/>
<attribute name="SERIES" value="" constant="no"/>
<attribute name="SUB-CATEGORY" value="PIN-HEADER" constant="no"/>
<attribute name="THERMALLOSS" value="" constant="no"/>
<attribute name="TYPE" value="" constant="no"/>
</technology>
</technologies>
</device>
<device name="/90" package="1X05/90">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:22467/2"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="CATEGORY" value="CONNECTOR" constant="no"/>
<attribute name="DESCRIPTION" value="" constant="no"/>
<attribute name="MANUFACTURER" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OPERATING_TEMP" value="" constant="no"/>
<attribute name="PART_STATUS" value="" constant="no"/>
<attribute name="ROHS_COMPLIANT" value="" constant="no"/>
<attribute name="SERIES" value="" constant="no"/>
<attribute name="SUB-CATEGORY" value="PIN-HEADER" constant="no"/>
<attribute name="THERMALLOSS" value="" constant="no"/>
<attribute name="TYPE" value="" constant="no"/>
</technology>
</technologies>
</device>
<device name="5X2MM" package="1_05X2MM">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:22466/2"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="CATEGORY" value="CONNECTOR" constant="no"/>
<attribute name="DESCRIPTION" value="" constant="no"/>
<attribute name="MANUFACTURER" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OPERATING_TEMP" value="" constant="no"/>
<attribute name="PART_STATUS" value="" constant="no"/>
<attribute name="ROHS_COMPLIANT" value="" constant="no"/>
<attribute name="SERIES" value="" constant="no"/>
<attribute name="SUB-CATEGORY" value="PIN-HEADER" constant="no"/>
<attribute name="THERMALLOSS" value="" constant="no"/>
<attribute name="TYPE" value="" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="HC-SR04">
<packages>
<package name="XCVR_HC-SR04">
<wire x1="-21.5" y1="-19.27" x2="-5.5" y2="-19.27" width="0.127" layer="21"/>
<wire x1="5.5" y1="-19.27" x2="21.5" y2="-19.27" width="0.127" layer="21"/>
<wire x1="22.5" y1="-5.47" x2="21.5" y2="-5.47" width="0.127" layer="21"/>
<wire x1="21.5" y1="-5.47" x2="5.5" y2="-5.47" width="0.127" layer="21"/>
<wire x1="5.5" y1="-5.47" x2="-5.5" y2="-5.47" width="0.127" layer="21"/>
<wire x1="-5.5" y1="-5.47" x2="-21.5" y2="-5.47" width="0.127" layer="21"/>
<wire x1="-21.5" y1="-5.47" x2="-22.5" y2="-5.47" width="0.127" layer="21"/>
<wire x1="-22.5" y1="-5.47" x2="-22.5" y2="-4.27" width="0.127" layer="21"/>
<wire x1="-22.5" y1="-4.27" x2="22.5" y2="-4.27" width="0.127" layer="21"/>
<wire x1="22.5" y1="-4.27" x2="22.5" y2="-5.47" width="0.127" layer="21"/>
<wire x1="-21.5" y1="-5.47" x2="-21.5" y2="-19.27" width="0.127" layer="21"/>
<wire x1="21.5" y1="-5.47" x2="21.5" y2="-19.27" width="0.127" layer="21"/>
<wire x1="-5.5" y1="-5.47" x2="-5.5" y2="-19.27" width="0.127" layer="21"/>
<wire x1="5.5" y1="-5.47" x2="5.5" y2="-19.27" width="0.127" layer="21"/>
<wire x1="-22.75" y1="-4" x2="-22.75" y2="-19.5" width="0.05" layer="39"/>
<wire x1="-22.75" y1="-19.5" x2="22.75" y2="-19.5" width="0.05" layer="39"/>
<wire x1="22.75" y1="-19.5" x2="22.75" y2="-4" width="0.05" layer="39"/>
<wire x1="22.75" y1="-4" x2="5" y2="-4" width="0.05" layer="39"/>
<wire x1="5" y1="-4" x2="5" y2="1.25" width="0.05" layer="39"/>
<wire x1="5" y1="1.25" x2="-5" y2="1.25" width="0.05" layer="39"/>
<wire x1="-5" y1="1.25" x2="-5" y2="-4" width="0.05" layer="39"/>
<wire x1="-5" y1="-4" x2="-22.75" y2="-4" width="0.05" layer="39"/>
<text x="-22.6617" y="-3.952040625" size="1.270659375" layer="25">&gt;NAME</text>
<text x="16.1773" y="-4.00676875" size="1.27215" layer="27">&gt;VALUE</text>
<pad name="2" x="-1.27" y="0" drill="1.02"/>
<pad name="3" x="1.27" y="0" drill="1.02"/>
<pad name="4" x="3.81" y="0" drill="1.02"/>
<pad name="1" x="-3.81" y="0" drill="1.02"/>
</package>
</packages>
<symbols>
<symbol name="HC-SR04">
<wire x1="0" y1="5.08" x2="0" y2="-7.62" width="0.254" layer="94"/>
<wire x1="0" y1="-7.62" x2="10.16" y2="-7.62" width="0.254" layer="94"/>
<wire x1="10.16" y1="-7.62" x2="10.16" y2="5.08" width="0.254" layer="94"/>
<wire x1="10.16" y1="5.08" x2="0" y2="5.08" width="0.254" layer="94"/>
<text x="0" y="5.0813" size="1.778459375" layer="95">&gt;NAME</text>
<text x="0" y="-10.163" size="1.77851875" layer="96">&gt;VALUE</text>
<pin name="VCC" x="-5.08" y="2.54" length="middle" direction="pwr"/>
<pin name="GND" x="-5.08" y="-5.08" length="middle" direction="pwr"/>
<pin name="TRIG" x="-5.08" y="0" length="middle"/>
<pin name="ECHO" x="-5.08" y="-2.54" length="middle"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="HC-SR04" prefix="U">
<description>Ultrasonic Sensor Module &lt;a href="https://pricing.snapeda.com/parts/HC-SR04/SparkFun%20Electronics/view-part?ref=eda"&gt;Check availability&lt;/a&gt;</description>
<gates>
<gate name="G$1" symbol="HC-SR04" x="0" y="0"/>
</gates>
<devices>
<device name="" package="XCVR_HC-SR04">
<connects>
<connect gate="G$1" pin="ECHO" pad="3"/>
<connect gate="G$1" pin="GND" pad="4"/>
<connect gate="G$1" pin="TRIG" pad="2"/>
<connect gate="G$1" pin="VCC" pad="1"/>
</connects>
<technologies>
<technology name="">
<attribute name="AVAILABILITY" value="Not in stock"/>
<attribute name="DESCRIPTION" value=" HC-SR04 Ultrasonic Sensor Qwiic Platform Evaluation Expansion Board "/>
<attribute name="MF" value="SparkFun Electronics"/>
<attribute name="MP" value="HC-SR04"/>
<attribute name="PACKAGE" value="None"/>
<attribute name="PRICE" value="None"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
</libraries>
<attributes>
</attributes>
<variantdefs>
</variantdefs>
<classes>
<class number="0" name="default" width="0" drill="0">
</class>
</classes>
<parts>
<part name="U1" library="RHT03_DHT-22_AM2302" deviceset="RHT03_DHT-22_AM2302" device=""/>
<part name="NODE1" library="nodemcu_esp8266" deviceset="NODEMCU_ESP8266" device=""/>
<part name="JP1" library="Connector" library_urn="urn:adsk.eagle:library:16378166" deviceset="PINHD-1X15" device="" package3d_urn="urn:adsk.eagle:package:22424/2"/>
<part name="JP3" library="Connector" library_urn="urn:adsk.eagle:library:16378166" deviceset="PINHD-1X3" device="" package3d_urn="urn:adsk.eagle:package:22458/2"/>
<part name="JP2" library="Connector" library_urn="urn:adsk.eagle:library:16378166" deviceset="PINHD-1X15" device="" package3d_urn="urn:adsk.eagle:package:22424/2"/>
<part name="JP4" library="Connector" library_urn="urn:adsk.eagle:library:16378166" deviceset="PINHD-1X5" device="" package3d_urn="urn:adsk.eagle:package:22469/2"/>
<part name="U2" library="HC-SR04" deviceset="HC-SR04" device=""/>
</parts>
<sheets>
<sheet>
<plain>
</plain>
<instances>
<instance part="U1" gate="G$1" x="66.04" y="93.98" smashed="yes" rot="R90">
<attribute name="NAME" x="54.61" y="88.9" size="1.27" layer="94" rot="R90"/>
<attribute name="VALUE" x="78.74" y="88.9" size="1.27" layer="94" rot="R90"/>
</instance>
<instance part="NODE1" gate="G$1" x="66.04" y="58.42" smashed="yes">
<attribute name="VALUE" x="55.88" y="30.48" size="1.27" layer="96"/>
<attribute name="NAME" x="55.88" y="76.2" size="1.27" layer="95"/>
</instance>
<instance part="JP1" gate="A" x="91.44" y="53.34" smashed="yes">
<attribute name="NAME" x="85.09" y="74.295" size="1.778" layer="95"/>
<attribute name="VALUE" x="85.09" y="30.48" size="1.778" layer="96"/>
</instance>
<instance part="JP3" gate="A" x="88.9" y="15.24" smashed="yes" rot="R270">
<attribute name="NAME" x="94.615" y="21.59" size="1.778" layer="95" rot="R270"/>
<attribute name="VALUE" x="81.28" y="21.59" size="1.778" layer="96" rot="R270"/>
</instance>
<instance part="JP2" gate="A" x="38.1" y="53.34" smashed="yes" rot="R180">
<attribute name="NAME" x="44.45" y="32.385" size="1.778" layer="95" rot="R180"/>
<attribute name="VALUE" x="44.45" y="76.2" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="JP4" gate="A" x="22.86" y="15.24" smashed="yes" rot="R270">
<attribute name="NAME" x="31.115" y="21.59" size="1.778" layer="95" rot="R270"/>
<attribute name="VALUE" x="12.7" y="21.59" size="1.778" layer="96" rot="R270"/>
</instance>
<instance part="U2" gate="G$1" x="2.54" y="68.58" smashed="yes" rot="R180">
<attribute name="NAME" x="2.54" y="63.4987" size="1.778459375" layer="95" rot="R180"/>
<attribute name="VALUE" x="2.54" y="78.743" size="1.77851875" layer="96" rot="R180"/>
</instance>
</instances>
<busses>
</busses>
<nets>
<net name="N$16" class="0">
<segment>
<pinref part="NODE1" gate="G$1" pin="A0"/>
<pinref part="JP1" gate="A" pin="15"/>
<wire x1="81.28" y1="35.56" x2="88.9" y2="35.56" width="0.1524" layer="91"/>
<pinref part="JP3" gate="A" pin="3"/>
<wire x1="86.36" y1="17.78" x2="81.28" y2="20.32" width="0.1524" layer="91"/>
<wire x1="81.28" y1="20.32" x2="81.28" y2="35.56" width="0.1524" layer="91"/>
<junction x="81.28" y="35.56"/>
</segment>
</net>
<net name="N$17" class="0">
<segment>
<pinref part="JP1" gate="A" pin="14"/>
<pinref part="NODE1" gate="G$1" pin="RSV@1"/>
<wire x1="88.9" y1="38.1" x2="81.28" y2="38.1" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$18" class="0">
<segment>
<pinref part="NODE1" gate="G$1" pin="RSV@2"/>
<pinref part="JP1" gate="A" pin="13"/>
<wire x1="81.28" y1="40.64" x2="88.9" y2="40.64" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$19" class="0">
<segment>
<pinref part="JP1" gate="A" pin="12"/>
<pinref part="NODE1" gate="G$1" pin="SD3"/>
<wire x1="88.9" y1="43.18" x2="81.28" y2="43.18" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$20" class="0">
<segment>
<pinref part="NODE1" gate="G$1" pin="SD2"/>
<pinref part="JP1" gate="A" pin="11"/>
<wire x1="81.28" y1="45.72" x2="88.9" y2="45.72" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$21" class="0">
<segment>
<pinref part="JP1" gate="A" pin="10"/>
<pinref part="NODE1" gate="G$1" pin="SD1"/>
<wire x1="88.9" y1="48.26" x2="81.28" y2="48.26" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$22" class="0">
<segment>
<pinref part="NODE1" gate="G$1" pin="CMD"/>
<pinref part="JP1" gate="A" pin="9"/>
<wire x1="81.28" y1="50.8" x2="88.9" y2="50.8" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$23" class="0">
<segment>
<pinref part="JP1" gate="A" pin="8"/>
<pinref part="NODE1" gate="G$1" pin="SD0"/>
<wire x1="88.9" y1="53.34" x2="81.28" y2="53.34" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$25" class="0">
<segment>
<pinref part="JP1" gate="A" pin="6"/>
<pinref part="NODE1" gate="G$1" pin="GND@3"/>
<wire x1="88.9" y1="58.42" x2="81.28" y2="58.42" width="0.1524" layer="91"/>
<pinref part="JP3" gate="A" pin="1"/>
<wire x1="91.44" y1="17.78" x2="91.44" y2="58.42" width="0.1524" layer="91"/>
<wire x1="91.44" y1="58.42" x2="81.28" y2="58.42" width="0.1524" layer="91"/>
<junction x="81.28" y="58.42"/>
</segment>
</net>
<net name="N$27" class="0">
<segment>
<pinref part="NODE1" gate="G$1" pin="EN"/>
<pinref part="JP1" gate="A" pin="4"/>
<wire x1="81.28" y1="63.5" x2="88.9" y2="63.5" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$28" class="0">
<segment>
<pinref part="JP1" gate="A" pin="3"/>
<pinref part="NODE1" gate="G$1" pin="RST"/>
<wire x1="88.9" y1="66.04" x2="81.28" y2="66.04" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$29" class="0">
<segment>
<pinref part="NODE1" gate="G$1" pin="GND@4"/>
<pinref part="U1" gate="G$1" pin="GND"/>
<wire x1="73.66" y1="83.82" x2="73.66" y2="68.58" width="0.1524" layer="91"/>
<wire x1="73.66" y1="68.58" x2="81.28" y2="68.58" width="0.1524" layer="91"/>
<pinref part="JP1" gate="A" pin="2"/>
<wire x1="81.28" y1="68.58" x2="88.9" y2="68.58" width="0.1524" layer="91"/>
<junction x="81.28" y="68.58"/>
<pinref part="U2" gate="G$1" pin="GND"/>
<wire x1="7.62" y1="73.66" x2="10.16" y2="73.66" width="0.1524" layer="91"/>
<wire x1="10.16" y1="73.66" x2="10.16" y2="111.76" width="0.1524" layer="91"/>
<wire x1="10.16" y1="111.76" x2="96.52" y2="111.76" width="0.1524" layer="91"/>
<wire x1="96.52" y1="111.76" x2="96.52" y2="68.58" width="0.1524" layer="91"/>
<wire x1="96.52" y1="68.58" x2="81.28" y2="68.58" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$30" class="0">
<segment>
<pinref part="JP1" gate="A" pin="1"/>
<pinref part="NODE1" gate="G$1" pin="VIN"/>
<wire x1="88.9" y1="71.12" x2="81.28" y2="71.12" width="0.1524" layer="91"/>
<pinref part="U2" gate="G$1" pin="VCC"/>
<wire x1="7.62" y1="66.04" x2="17.78" y2="66.04" width="0.1524" layer="91"/>
<wire x1="17.78" y1="66.04" x2="17.78" y2="104.14" width="0.1524" layer="91"/>
<wire x1="17.78" y1="104.14" x2="81.28" y2="104.14" width="0.1524" layer="91"/>
<wire x1="81.28" y1="104.14" x2="81.28" y2="71.12" width="0.1524" layer="91"/>
<junction x="81.28" y="71.12"/>
</segment>
</net>
<net name="N$2" class="0">
<segment>
<pinref part="JP2" gate="A" pin="14"/>
<pinref part="NODE1" gate="G$1" pin="GND@1"/>
<wire x1="40.64" y1="68.58" x2="50.8" y2="68.58" width="0.1524" layer="91"/>
<pinref part="JP4" gate="A" pin="2"/>
<wire x1="25.4" y1="17.78" x2="25.4" y2="68.58" width="0.1524" layer="91"/>
<wire x1="25.4" y1="68.58" x2="50.8" y2="68.58" width="0.1524" layer="91"/>
<junction x="50.8" y="68.58"/>
</segment>
</net>
<net name="N$3" class="0">
<segment>
<pinref part="NODE1" gate="G$1" pin="TX"/>
<pinref part="JP2" gate="A" pin="13"/>
<wire x1="50.8" y1="66.04" x2="40.64" y2="66.04" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$5" class="0">
<segment>
<pinref part="NODE1" gate="G$1" pin="RX"/>
<pinref part="JP2" gate="A" pin="12"/>
<wire x1="50.8" y1="63.5" x2="40.64" y2="63.5" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$6" class="0">
<segment>
<pinref part="JP2" gate="A" pin="11"/>
<pinref part="NODE1" gate="G$1" pin="D8"/>
<wire x1="40.64" y1="60.96" x2="50.8" y2="60.96" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$7" class="0">
<segment>
<pinref part="NODE1" gate="G$1" pin="D7"/>
<pinref part="JP2" gate="A" pin="10"/>
<wire x1="50.8" y1="58.42" x2="40.64" y2="58.42" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$8" class="0">
<segment>
<pinref part="JP2" gate="A" pin="9"/>
<pinref part="NODE1" gate="G$1" pin="D6"/>
<wire x1="40.64" y1="55.88" x2="50.8" y2="55.88" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$9" class="0">
<segment>
<pinref part="NODE1" gate="G$1" pin="D5"/>
<pinref part="JP2" gate="A" pin="8"/>
<wire x1="50.8" y1="53.34" x2="40.64" y2="53.34" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$12" class="0">
<segment>
<pinref part="JP2" gate="A" pin="5"/>
<pinref part="NODE1" gate="G$1" pin="D4"/>
<wire x1="40.64" y1="45.72" x2="50.8" y2="45.72" width="0.1524" layer="91"/>
<pinref part="U2" gate="G$1" pin="TRIG"/>
<wire x1="7.62" y1="68.58" x2="10.16" y2="68.58" width="0.1524" layer="91"/>
<wire x1="10.16" y1="68.58" x2="10.16" y2="45.72" width="0.1524" layer="91"/>
<wire x1="10.16" y1="45.72" x2="50.8" y2="45.72" width="0.1524" layer="91"/>
<junction x="50.8" y="45.72"/>
</segment>
</net>
<net name="N$13" class="0">
<segment>
<pinref part="NODE1" gate="G$1" pin="D3"/>
<pinref part="JP2" gate="A" pin="4"/>
<wire x1="50.8" y1="43.18" x2="40.64" y2="43.18" width="0.1524" layer="91"/>
<pinref part="U2" gate="G$1" pin="ECHO"/>
<wire x1="7.62" y1="71.12" x2="12.7" y2="71.12" width="0.1524" layer="91"/>
<wire x1="12.7" y1="71.12" x2="12.7" y2="43.18" width="0.1524" layer="91"/>
<wire x1="12.7" y1="43.18" x2="50.8" y2="43.18" width="0.1524" layer="91"/>
<junction x="50.8" y="43.18"/>
</segment>
</net>
<net name="N$14" class="0">
<segment>
<pinref part="JP2" gate="A" pin="3"/>
<pinref part="NODE1" gate="G$1" pin="D2"/>
<wire x1="40.64" y1="40.64" x2="50.8" y2="40.64" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$15" class="0">
<segment>
<pinref part="NODE1" gate="G$1" pin="D1"/>
<pinref part="U1" gate="G$1" pin="DATA"/>
<wire x1="63.5" y1="83.82" x2="63.5" y2="38.1" width="0.1524" layer="91"/>
<wire x1="63.5" y1="38.1" x2="50.8" y2="38.1" width="0.1524" layer="91"/>
<pinref part="JP2" gate="A" pin="2"/>
<wire x1="40.64" y1="38.1" x2="50.8" y2="38.1" width="0.1524" layer="91"/>
<junction x="50.8" y="38.1"/>
</segment>
</net>
<net name="N$24" class="0">
<segment>
<pinref part="NODE1" gate="G$1" pin="CLK"/>
<pinref part="JP1" gate="A" pin="7"/>
<wire x1="81.28" y1="55.88" x2="88.9" y2="55.88" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$10" class="0">
<segment>
<pinref part="JP2" gate="A" pin="7"/>
<pinref part="NODE1" gate="G$1" pin="GND@2"/>
<wire x1="40.64" y1="50.8" x2="50.8" y2="50.8" width="0.1524" layer="91"/>
<pinref part="JP4" gate="A" pin="4"/>
<wire x1="20.32" y1="17.78" x2="20.32" y2="50.8" width="0.1524" layer="91"/>
<wire x1="20.32" y1="50.8" x2="50.8" y2="50.8" width="0.1524" layer="91"/>
<junction x="50.8" y="50.8"/>
</segment>
</net>
<net name="N$26" class="0">
<segment>
<pinref part="JP2" gate="A" pin="1"/>
<pinref part="NODE1" gate="G$1" pin="D0"/>
<wire x1="40.64" y1="35.56" x2="50.8" y2="35.56" width="0.1524" layer="91"/>
<pinref part="JP4" gate="A" pin="1"/>
<wire x1="27.94" y1="17.78" x2="27.94" y2="35.56" width="0.1524" layer="91"/>
<wire x1="27.94" y1="35.56" x2="50.8" y2="35.56" width="0.1524" layer="91"/>
<junction x="50.8" y="35.56"/>
</segment>
</net>
<net name="N$1" class="0">
<segment>
<pinref part="JP2" gate="A" pin="15"/>
<pinref part="NODE1" gate="G$1" pin="3V3@1"/>
<wire x1="40.64" y1="71.12" x2="50.8" y2="71.12" width="0.1524" layer="91"/>
<pinref part="JP4" gate="A" pin="3"/>
<wire x1="22.86" y1="17.78" x2="22.86" y2="71.12" width="0.1524" layer="91"/>
<wire x1="22.86" y1="71.12" x2="50.8" y2="71.12" width="0.1524" layer="91"/>
<junction x="50.8" y="71.12"/>
</segment>
</net>
<net name="N$32" class="0">
<segment>
<pinref part="NODE1" gate="G$1" pin="3V3@3"/>
<pinref part="JP1" gate="A" pin="5"/>
<wire x1="88.9" y1="60.96" x2="81.28" y2="60.96" width="0.1524" layer="91"/>
<pinref part="U1" gate="G$1" pin="VDD"/>
<wire x1="58.42" y1="83.82" x2="58.42" y2="76.2" width="0.1524" layer="91"/>
<wire x1="58.42" y1="76.2" x2="66.04" y2="76.2" width="0.1524" layer="91"/>
<wire x1="66.04" y1="76.2" x2="66.04" y2="60.96" width="0.1524" layer="91"/>
<wire x1="66.04" y1="60.96" x2="81.28" y2="60.96" width="0.1524" layer="91"/>
<junction x="81.28" y="60.96"/>
<pinref part="JP3" gate="A" pin="2"/>
<wire x1="88.9" y1="17.78" x2="88.9" y2="27.94" width="0.1524" layer="91"/>
<wire x1="88.9" y1="27.94" x2="104.14" y2="27.94" width="0.1524" layer="91"/>
<wire x1="104.14" y1="27.94" x2="104.14" y2="60.96" width="0.1524" layer="91"/>
<wire x1="104.14" y1="60.96" x2="81.28" y2="60.96" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$4" class="0">
<segment>
<pinref part="JP2" gate="A" pin="6"/>
<pinref part="NODE1" gate="G$1" pin="3V3@2"/>
<wire x1="50.8" y1="48.26" x2="40.64" y2="48.26" width="0.1524" layer="91"/>
<pinref part="JP4" gate="A" pin="5"/>
<wire x1="17.78" y1="17.78" x2="17.78" y2="48.26" width="0.1524" layer="91"/>
<wire x1="17.78" y1="48.26" x2="50.8" y2="48.26" width="0.1524" layer="91"/>
<junction x="50.8" y="48.26"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
<errors>
<approved hash="110,1,88.9,35.56,N$26,N$16,,,,"/>
<approved hash="110,1,88.9,38.1,N$26,N$17,,,,"/>
<approved hash="110,1,88.9,40.64,N$26,N$18,,,,"/>
<approved hash="110,1,88.9,43.18,N$26,N$19,,,,"/>
<approved hash="110,1,88.9,45.72,N$26,N$20,,,,"/>
<approved hash="110,1,88.9,48.26,N$26,N$21,,,,"/>
<approved hash="110,1,88.9,50.8,N$26,N$22,,,,"/>
<approved hash="110,1,88.9,53.34,N$26,N$23,,,,"/>
<approved hash="110,1,88.9,55.88,N$26,N$24,,,,"/>
<approved hash="110,1,88.9,58.42,N$26,N$25,,,,"/>
</errors>
</schematic>
</drawing>
<compatibility>
<note version="8.2" severity="warning">
Since Version 8.2, EAGLE supports online libraries. The ids
of those online libraries will not be understood (or retained)
with this version.
</note>
<note version="8.3" severity="warning">
Since Version 8.3, EAGLE supports URNs for individual library
assets (packages, symbols, and devices). The URNs of those assets
will not be understood (or retained) with this version.
</note>
<note version="8.3" severity="warning">
Since Version 8.3, EAGLE supports the association of 3D packages
with devices in libraries, schematics, and board files. Those 3D
packages will not be understood (or retained) with this version.
</note>
</compatibility>
</eagle>
